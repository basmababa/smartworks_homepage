package com.maninsoft.smart.homepage.bbs;

import com.maninsoft.smart.homepage.request.*;
import com.maninsoft.smart.homepage.jdbc.*;
import com.maninsoft.smart.homepage.util.ImageManager;
import java.sql.*;
import java.util.ArrayList;
import java.io.IOException;
import java.io.File;

public class BbsManager {
	private static BbsManager instance = new BbsManager();

    public static BbsManager getInstance () {
        return instance;
    }

    private BbsManager() {
    }

    /**
     * 관리자용 Multi Board List
     * @param boardId String
     * @return ArrayList
     * @throws ClassNotFoundException
     */
	public ArrayList getBoardList(String strMasBbsId) throws ClassNotFoundException {
        ArrayList boardList = null;
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
            conn = JDBC.getConnection();
            String strQuery = "select bbs_usr_name, bbs_title, bbs_wdate from bbs_multi_board where mas_bbs_id = ?";
            strQuery +=       " order by bbs_idx desc";
            strQuery +=       " LIMIT 7 offset 0";

            pstmt = conn.prepareStatement(strQuery);
            pstmt.setString(1, strMasBbsId);
            rs = pstmt.executeQuery();

            boardList = new ArrayList();

            while (rs.next()) {
                BbsBean boardInfo = new BbsBean();

                boardInfo.setBbsUsrName(rs.getString(1));
                boardInfo.setBbsTitle(rs.getString(2));
                boardInfo.setBbsWdate(rs.getTimestamp(3));

                boardList.add(boardInfo);
            }

        } catch (SQLException ex) {
            boardList = null;
            ex.printStackTrace();
        } finally {
            JDBC.close(conn, pstmt, rs);
        }
        return boardList;
	}

    /**
     * 해당 게시판의 total Count를 가져온다.
     * @param MAS_BBS_ID String
     * @param strWhere String
     * @return int
     * @throws ClassNotFoundException
     */
    public int getBbsListCount(String MAS_BBS_ID, String strWhere) throws
            ClassNotFoundException {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        int totalCount = 0;

        try {
            conn = JDBC.getConnection();

            String strSQL = "Select count(*) from bbs_multi_board" + strWhere;
            pstmt = conn.prepareStatement(strSQL);

            rs = pstmt.executeQuery();

            if (rs.next()) {
                totalCount = rs.getInt(1); //전체 게시물의 수
            }
            return totalCount;

        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            JDBC.close(conn, pstmt, rs);
        }
        return 0;
    }
    
    /**
     * 상단 알림글 리스트를 받아온다
     * @param req Request
     * @param MAS_BBS_ID String
     * @return ArrayList
     * @throws ClassNotFoundException
     */
    public ArrayList getNoticeList(String MAS_BBS_ID) throws
            ClassNotFoundException {
        ArrayList boardList = null;
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
            conn = JDBC.getConnection();

            String strSQL = "select bbs_idx, bbs_id, bbs_depth, bbs_usr_id, bbs_usr_name, bbs_usr_pass,";
            strSQL       += " bbs_usr_email, bbs_title, bbs_contents, bbs_host,";
            strSQL       += " bbs_html, bbs_refer, bbs_down, bbs_wdate";
            strSQL       += " from bbs_multi_board where bbs_notice = '1' and mas_bbs_id = ?";
            
            pstmt = conn.prepareStatement(strSQL);
            pstmt.setString(1, MAS_BBS_ID);

            rs = pstmt.executeQuery();
            boardList = new ArrayList();

            while (rs.next()) {
                BbsBean boardInfo = new BbsBean();

                boardInfo.setBbsIdx(rs.getInt("bbs_idx"));
                boardInfo.setBbsId(rs.getInt("bbs_id"));
                boardInfo.setBbsDepth(rs.getInt("bbs_depth"));
                boardInfo.setBbsUsrId(rs.getString("bbs_usr_id"));
                boardInfo.setBbsUsrName(rs.getString("bbs_usr_name"));
                boardInfo.setBbsUsrPass(rs.getString("bbs_usr_pass"));
                boardInfo.setBbsUsrEmail(rs.getString("bbs_usr_email"));
                boardInfo.setBbsTitle(rs.getString("bbs_title"));
                boardInfo.setBbsContents(rs.getString("bbs_contents"));
                boardInfo.setBbsHost(rs.getString("bbs_host"));
                boardInfo.setBbsHtml(rs.getString("bbs_html"));
                boardInfo.setBbsRefer(rs.getInt("bbs_refer"));
                boardInfo.setBbsDown(rs.getInt("bbs_down"));
                boardInfo.setBbsWdate(rs.getTimestamp("bbs_wdate"));

                boardList.add(boardInfo);
            }

        } catch (SQLException ex) {
            boardList = null;
            ex.printStackTrace();
        } finally {
            JDBC.close(conn, pstmt, rs);
        }
        return boardList;
    }

    /**
     * 해당 게시물의 목록을 가져온다.
     * @param req Request
     * @param MAS_BBS_ID String
     * @param strWhere String
     * @param strOrder String
     * @return ArrayList
     */
    public ArrayList getBbsList(Request req, String MAS_BBS_ID, int pageSize, String strWhere, String strOrder) throws
            ClassNotFoundException {
        ArrayList boardList = null;
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
            conn = JDBC.getConnection();

            int curPage = 1;

            //페이징을 위한 공통 Parameter
            if (req.getString("page") != null) {
                curPage = req.getInt("page");
            }

            int offset = pageSize * (curPage - 1); //시작 레코드 번호
            /*
            String offsetQuery = "";
            if (strWhere.equals("")) {
            	offsetQuery = " where bbs_idx not in";
            } else {
            	offsetQuery = " and bbs_idx not in";
            }
            
            String strSQL = "select top " + pageSize + " bbs_idx, bbs_id, bbs_depth, bbs_usr_id, bbs_usr_name, bbs_usr_pass,";
            strSQL       += " bbs_usr_email, bbs_title, bbs_contents, bbs_host, bbs_html, bbs_refer, bbs_down, bbs_wdate, bbs_secret, bbs_section";
            strSQL       += "     from bbs_multi_board";
            strSQL       +=       strWhere;
            strSQL       +=       offsetQuery;
            strSQL       += "     ( ";
            strSQL       += "         select top " + offset + " bbs_idx";
            strSQL       += "         from bbs_multi_board";
            strSQL       +=           strWhere;
            strSQL       += "         order by bbs_id desc";
            strSQL       += "     ) "; 
            strSQL       += "     order by bbs_id desc";
            */
            
            String strSQL = "select bbs_idx, bbs_id, bbs_depth, bbs_usr_id, bbs_usr_name, bbs_usr_pass,";
            strSQL       += " bbs_usr_email, bbs_title, bbs_contents, bbs_host, bbs_html, bbs_refer, bbs_down, bbs_wdate, bbs_secret, bbs_section";
            strSQL       += " from bbs_multi_board" + strWhere + strOrder + " LIMIT " + pageSize + " offset " + offset;

            pstmt = conn.prepareStatement(strSQL);
            rs = pstmt.executeQuery();
            boardList = new ArrayList();

            while (rs.next()) {
                BbsBean boardInfo = new BbsBean();

                boardInfo.setBbsIdx(rs.getInt("bbs_idx"));
                boardInfo.setBbsId(rs.getInt("bbs_id"));
                boardInfo.setBbsDepth(rs.getInt("bbs_depth"));
                boardInfo.setBbsUsrId(rs.getString("bbs_usr_id"));
                boardInfo.setBbsUsrName(rs.getString("bbs_usr_name"));
                boardInfo.setBbsUsrPass(rs.getString("bbs_usr_pass"));
                boardInfo.setBbsUsrEmail(rs.getString("bbs_usr_email"));
                boardInfo.setBbsTitle(rs.getString("bbs_title"));
                boardInfo.setBbsContents(rs.getString("bbs_contents"));
                boardInfo.setBbsHost(rs.getString("bbs_host"));
                boardInfo.setBbsHtml(rs.getString("bbs_html"));
                boardInfo.setBbsRefer(rs.getInt("bbs_refer"));
                boardInfo.setBbsDown(rs.getInt("bbs_down"));
                boardInfo.setBbsWdate(rs.getTimestamp("bbs_wdate"));
                boardInfo.setBbsSecret(rs.getString("bbs_secret"));
                boardInfo.setBbsSection(rs.getString("bbs_section"));
                
                boardList.add(boardInfo);
            }

        } catch (SQLException ex) {
            boardList = null;
            ex.printStackTrace();
        } finally {
            JDBC.close(conn, pstmt, rs);
        }
        return boardList;
    }

	/**
     * 글쓰기
     * @param mReq MRequest
     * @param TABLE_NAME String
     * @return int
     * @throws ClassNotFoundException
     */
	public int bbsWrite (MRequest mReq, String DATA_ROOT, String MAS_BBS_ID) throws ClassNotFoundException {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int checkCode = 0;

		try {
			conn = JDBC.getConnection();

			//게시물의 bbsId
			int bbsId = 0;
			try {
				String maxQuery = "select max(bbs_id) from bbs_multi_board where mas_bbs_id = ?";
				pstmt = conn.prepareStatement(maxQuery);
				pstmt.setString(1, MAS_BBS_ID);

				rs = pstmt.executeQuery();
				if (rs.next()) {
					bbsId = rs.getInt(1) + 100;
				} else {
					bbsId = 100;
				}
			} catch (SQLException ex) {
				ex.printStackTrace();
			} finally {
				JDBC.closePrepareStatement(pstmt);
				JDBC.closeResultSet(rs);
			}

			//파일의 저장위치를 Setting
			mReq.setSavePath(DATA_ROOT + "/BBS/" + MAS_BBS_ID + "/");
			mReq.makeDir();

			try {
				mReq.parse();
			} catch (IOException ex) {
				ex.printStackTrace();
			}

			//common parameter
			String id = mReq.getParameter("id");
			String name = mReq.getParameter("name");
			String password = mReq.getParameter("password");
			String title = mReq.getParameter("title");
			String email = mReq.getParameter("email");
			String html = mReq.getParameter("html");
			String notice = mReq.getParameter("notice");
			String secret = mReq.getParameter("secret");
			String contents = mReq.getParameter("contents");
			String section = mReq.getParameter("section");
			String hp = mReq.getParameter("hp");
			
			if (html == null) { html = "0"; }
			if (notice == null) { notice = "0"; }
			if (secret == null) { secret = "0"; }
			
			int attach_count = 0;
			if (mReq.getParameter("attach_count") != null) {
				attach_count = Integer.parseInt(mReq.getParameter("attach_count"));
			}

			//파일이 저장되는 위치
			String uploadPath = "/BBS/" + MAS_BBS_ID + "/";

			//파일 개수 만큼 Loop를 돌면서 처리
			for (int i = 1; i <= attach_count; i++) {
				String inputFormName = "attach_file" + i;
				String fileName = mReq.getFileSystemName(inputFormName);	//파일명
				String fileType = mReq.getContentType(inputFormName);		//파일 Type
				if (fileName == null) {										//파일이 없다.
				} else {
					File realFile = mReq.getFile(inputFormName);			//실제 파일 객체를 불러온다.
					int fileSize = (int) realFile.length();					//파일 Size
					
					if (fileSize <= 0) {									//잘못된 파일이다.
						mReq.delFile();
					} else {												//파일이 있을경우에만 DB에 저장한다.
						
						String[] arrImgType = fileType.split("/");			//이미지 type을 추려낸다.
						String imgType = arrImgType[0];
						
						if (imgType.equals("image")) {
							//썸네일 이미지 만들기
							ImageManager imgmanager = ImageManager.getInstance();

							//썸네일 폴더 생성
							String strThumbNailDir = mReq.getSavePath() + "thumbnail/";
							File thumbNailDir = new File(strThumbNailDir);

							if (!thumbNailDir.exists()) {
								thumbNailDir.mkdirs();
							}

							//Mid 썸네일 폴더 생성
							String strMidThumbNailDir = mReq.getSavePath() + "mid_thumbnail/";
							File midThumbNailDir = new File(strMidThumbNailDir);

							if (!midThumbNailDir.exists()) {
								midThumbNailDir.mkdirs();
							}

							//썸네일 이름 Setting
							String thumbName = fileName.substring(0,fileName.lastIndexOf("."));
							String thumbFileName = thumbName + "_thumb.jpg";
							String thumbNailFileUri = strThumbNailDir + thumbFileName;
							String midThumbNailFileUri = strMidThumbNailDir + thumbFileName;
							String orgPath = mReq.getSavePath() + fileName;
							
							try {
								imgmanager.createThumbnail(orgPath, thumbNailFileUri, 100);
								imgmanager.createThumbnail(orgPath, midThumbNailFileUri, 500);
							} catch (Exception ex1) {
							}
						}
						
						try {
							String strSQL = "insert into bbs_attach(mas_bbs_id,bbs_id,ach_file_name,ach_file_path,ach_file_size)";
							strSQL       += " values (?,?,?,?,?)";
							pstmt = conn.prepareStatement(strSQL);
                          
							pstmt.setString(1, MAS_BBS_ID);
							pstmt.setInt(2, bbsId);
							pstmt.setString(3, fileName);
							pstmt.setString(4, uploadPath);
							pstmt.setInt(5, fileSize);
							pstmt.executeUpdate();
						} catch (SQLException ex) {
							ex.printStackTrace();
						} finally {
							JDBC.closePrepareStatement(pstmt);
						}
					} //if (fileSize <= 0) {
				} //if (fileName == null) {
			} //for (int i = 1; i <= attach_count; i++) {

			/*게시물을 저장한다.*/
			String strQuery = "insert into bbs_multi_board (";
			strQuery       += " bbs_id, bbs_depth, bbs_usr_id, bbs_usr_name, bbs_usr_pass, bbs_usr_email,";
			strQuery       += " bbs_title, bbs_contents, bbs_host, bbs_html, bbs_notice, bbs_secret, mas_bbs_id, bbs_section, bbs_hp)";
			strQuery       += " values (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";

			pstmt = conn.prepareStatement(strQuery);

			pstmt.setInt(1, bbsId);
			pstmt.setInt(2, 0);
			pstmt.setString(3, id);
			pstmt.setString(4, name);
			pstmt.setString(5, password);
			pstmt.setString(6, email);
			pstmt.setString(7, title);
			pstmt.setString(8, contents);
			pstmt.setString(9, mReq.getRemoteHost());
			pstmt.setString(10, html);
			pstmt.setString(11, notice);
			pstmt.setString(12, secret);
			pstmt.setString(13, MAS_BBS_ID);
			pstmt.setString(14, section);
			pstmt.setString(15, hp);
			pstmt.executeUpdate();

		} catch (SQLException ex) {
			ex.printStackTrace();
		} finally {
			JDBC.close(conn, pstmt);
		}
		return checkCode;
	}

	/**
	 * 게시물 ReadCount 증가
	 * @param req Request
	 * @param MAS_BBS_ID String
	 * @throws ClassNotFoundException
	 */
	public void addCount(Request req, String MAS_BBS_ID) throws ClassNotFoundException {
		Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
            conn = JDBC.getConnection();
            String strQuery = "Update bbs_multi_board set bbs_refer = bbs_refer + 1 where bbs_id = ? and mas_bbs_id = ?";

            pstmt = conn.prepareStatement(strQuery);
            pstmt.setInt(1, req.getInt("bbsId"));
            pstmt.setString(2, MAS_BBS_ID);
            pstmt.executeUpdate();
        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            JDBC.close(conn, pstmt, rs);
        }
    }

	/**
	 * 상세보기
	 * @param req Request
	 * @return BbsBean
	 * @throws ClassNotFoundException
	 */
	public BbsBean bbsView(Request req, String MAS_BBS_ID) throws ClassNotFoundException {
		Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        BbsBean board = new BbsBean();

        try {
            conn = JDBC.getConnection();

            String strQuery = "select bbs_depth,bbs_usr_id,bbs_usr_name,bbs_usr_pass,bbs_usr_email,";
            strQuery += " bbs_title,bbs_contents,bbs_host,bbs_html,bbs_secret,bbs_refer,bbs_down,bbs_notice,bbs_wdate,bbs_secret,bbs_section,bbs_hp";
            strQuery += " from bbs_multi_board where bbs_id = ? and mas_bbs_id = ?";
            
            pstmt = conn.prepareStatement(strQuery);
            pstmt.setInt(1, req.getInt("bbsId"));
            pstmt.setString(2, MAS_BBS_ID);

            rs = pstmt.executeQuery();

            if (rs.next()) {
                board.setBbsDepth(rs.getInt("bbs_depth"));
                board.setBbsUsrId(rs.getString("bbs_usr_id"));
                board.setBbsUsrName(rs.getString("bbs_usr_name"));
                board.setBbsUsrPass(rs.getString("bbs_usr_pass"));
                board.setBbsUsrEmail(rs.getString("bbs_usr_email"));
                board.setBbsTitle(rs.getString("bbs_title"));
                board.setBbsContents(rs.getString("bbs_contents"));
                board.setBbsHost(rs.getString("bbs_host"));
                board.setBbsHtml(rs.getString("bbs_html"));
                board.setBbsSecret(rs.getString("bbs_secret"));
                board.setBbsRefer(rs.getInt("bbs_refer"));
                board.setBbsDown(rs.getInt("bbs_down"));
                board.setBbsNotice(rs.getString("bbs_notice"));
                board.setBbsWdate(rs.getTimestamp("bbs_wdate"));
                board.setBbsSecret(rs.getString("bbs_secret"));
                board.setBbsSection(rs.getString("bbs_section"));
                board.setBbsHp(rs.getString("bbs_hp"));
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            JDBC.close(conn, pstmt, rs);
        }
        return board;
    }

	/**
	 * 답변하기
	 * @param mReq MRequest
	 * @param TABLE_NAME String
	 * @return int
	 * @throws ClassNotFoundException
	*/
	public int bbsReply(MRequest mReq, String DATA_ROOT, String MAS_BBS_ID) throws ClassNotFoundException {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int checkCode = 0;

		try {
			conn = JDBC.getConnection();
			//파일의 저장위치를 Setting
			mReq.setSavePath(DATA_ROOT + "/BBS/" + MAS_BBS_ID + "/");
			mReq.makeDir();

			try {
				mReq.parse();
			} catch (IOException ex) {
				ex.printStackTrace();
			}

			//게시물의 INDEX
			int intBbsId = 0;
			if (mReq.getParameter("bbsId") != null) {
				intBbsId = Integer.parseInt(mReq.getParameter("bbsId"));
			}

			//게시물의 Depth
			int intDepth = 0;
			if (mReq.getParameter("depth") != null) {
				intDepth = Integer.parseInt(mReq.getParameter("depth"));
			}

			//common parameter
			String id = mReq.getParameter("id");
			String name = mReq.getParameter("name");
			String password = mReq.getParameter("password");
			String title = mReq.getParameter("title");
			String email = mReq.getParameter("email");
			String html = mReq.getParameter("html");
			String contents = mReq.getParameter("contents");
			String section = mReq.getParameter("section");
			String hp = mReq.getParameter("hp");
			
			int attach_count = 0;
			if (mReq.getParameter("attach_count") != null) {
				attach_count = Integer.parseInt(mReq.getParameter("attach_count"));
			}


			//해당글의 하위글(depth가 0인)의 index를 가져온다.
			int lastIdx = 0;
			try {
				String strQuery = "select max(bbs_id) from bbs_multi_board";
				strQuery       += " where bbs_id < ? and bbs_depth = 0 and mas_bbs_id = ?";

				pstmt = conn.prepareStatement(strQuery);
				pstmt.setInt(1, intBbsId);
				pstmt.setString(2, MAS_BBS_ID);
				rs = pstmt.executeQuery();

				if (rs.next()) {
					lastIdx = rs.getInt(1);
				}

			} catch (SQLException ex) {
				ex.printStackTrace();
			} finally {
				JDBC.closePrepareStatement(pstmt);
				JDBC.closeResultSet(rs);
			}

			//답변 대상글의 인덱스 하위에 있는 인덱스들을 수정 (-1)
			try {
				String updateQuery = "update bbs_multi_board set bbs_id = bbs_id - 1";
				updateQuery       += " where bbs_id < ?";
				updateQuery       += " and bbs_id > ?";
				//updateQuery       += " and bbs_id > isnull((select max(bbs_id) from bbs_multi_board where bbs_id < ? and bbs_depth = 0),0)";
				updateQuery       += " and mas_bbs_id = ?";

				pstmt = conn.prepareStatement(updateQuery);
				pstmt.setInt(1, intBbsId);
				//pstmt.setInt(2, intBbsId);
				pstmt.setInt(2, lastIdx);
				pstmt.setString(3, MAS_BBS_ID);
				pstmt.executeUpdate();

			} catch (SQLException ex) {
				ex.printStackTrace();
			} finally {
				JDBC.closePrepareStatement(pstmt);
			}
			
			//답변 대상글의 ID 하위의 Comment 테이블들을 수정 (-1)
			try {
				String updateQuery = "update bbs_multi_board_comment set bbs_id = bbs_id - 1";
				updateQuery       += " where bbs_id < ?";
				updateQuery       += " and bbs_id > ?";
				//updateQuery       += " and bbs_id > isnull((select max(bbs_id) from bbs_multi_board where bbs_id < ? and bbs_depth = 0),0)";
				updateQuery       += " and mas_bbs_id = ?";

				pstmt = conn.prepareStatement(updateQuery);

				pstmt.setInt(1, intBbsId);
				//pstmt.setInt(2, intBbsId);
				pstmt.setInt(2, lastIdx);
				pstmt.setString(3, MAS_BBS_ID);
				pstmt.executeUpdate();

			} catch (SQLException ex) {
				ex.printStackTrace();
			} finally {
				JDBC.closePrepareStatement(pstmt);
			}
			
			//답변 대상글의 ID 하위의 file 테이블들을 수정 (-1)
			try {
				String updateQuery = "update bbs_attach set bbs_id = bbs_id - 1";
				updateQuery       += " where bbs_id < ?";
				updateQuery       += " and bbs_id > ?";
				//updateQuery       += " and bbs_id > isnull((select max(bbs_id) from bbs_multi_board where bbs_id < ? and bbs_depth = 0),0)";
				updateQuery       += " and mas_bbs_id = ?";

				pstmt = conn.prepareStatement(updateQuery);

				pstmt.setInt(1, intBbsId);
				//pstmt.setInt(2, intBbsId);
				pstmt.setInt(2, lastIdx);
				pstmt.setString(3, MAS_BBS_ID);
				pstmt.executeUpdate();

			} catch (SQLException ex) {
				ex.printStackTrace();
			} finally {
				JDBC.closePrepareStatement(pstmt);
			}
			
			//파일이 저장되는 위치
			String uploadPath = "/BBS/" + MAS_BBS_ID + "/";

			//파일 개수 만큼 Loop를 돌면서 처리
			for (int i = 1; i <= attach_count; i++) {
				String inputFormName = "attach_file" + i;
				String fileName = mReq.getFileSystemName(inputFormName);		//파일명
				String fileType = mReq.getContentType(inputFormName);			//파일 Type
				
				if (fileName == null) {											//파일이 없다.
				} else {
					File realFile = mReq.getFile(inputFormName);				//실제 파일 객체를 불러온다.
					int fileSize = (int) realFile.length();						//파일 Size
					if (fileSize <= 0) {										//잘못된 파일이다.
						mReq.delFile();
					} else {													//파일이 있을경우에만 DB에 저장한다.
						
						String[] arrImgType = fileType.split("/");				//이미지 type을 추려낸다.
						String imgType = arrImgType[0];
						
						if (imgType.equals("image")) {
							//썸네일 이미지 만들기
							ImageManager imgmanager = ImageManager.getInstance();

							//썸네일 폴더 생성
							String strThumbNailDir = mReq.getSavePath() + "thumbnail/";
							File thumbNailDir = new File(strThumbNailDir);

							if (!thumbNailDir.exists()) {
								thumbNailDir.mkdirs();
							}

							//Mid 썸네일 폴더 생성
							String strMidThumbNailDir = mReq.getSavePath() + "mid_thumbnail/";
							File midThumbNailDir = new File(strMidThumbNailDir);

							if (!midThumbNailDir.exists()) {
								midThumbNailDir.mkdirs();
							}

							//썸네일 이름 Setting
							String thumbName = fileName.substring(0,fileName.lastIndexOf("."));
							String thumbFileName = thumbName + "_thumb.jpg";
							String thumbNailFileUri = strThumbNailDir + thumbFileName;
							String midThumbNailFileUri = strMidThumbNailDir + thumbFileName;
							String orgPath = mReq.getSavePath() + fileName;
							
							try {
								imgmanager.createThumbnail(orgPath, thumbNailFileUri, 100);
								imgmanager.createThumbnail(orgPath, midThumbNailFileUri, 500);
							} catch (Exception ex1) {
							}
						}
						
						try {
							String strSQL = "insert into bbs_attach(";
							strSQL +=  " bbs_id,mas_bbs_id,ach_file_name,ach_file_path,ach_file_size)";
							strSQL += " values (?,?,?,?,?)";
							pstmt = conn.prepareStatement(strSQL);

							pstmt.setInt(1, intBbsId-1);
							pstmt.setString(2, MAS_BBS_ID);
							pstmt.setString(3, fileName);
							pstmt.setString(4, uploadPath);
							pstmt.setInt(5, fileSize);
							pstmt.executeUpdate();
						} catch (SQLException ex) {
							ex.printStackTrace();
						} finally {
							JDBC.closePrepareStatement(pstmt);
						}
					} //if (fileSize <= 0) {
				} //if (fileName == null) {
			} //for (int i = 1; i <= attach_count; i++) {

			/*게시물을 저장한다.*/
			String strQuery = "insert into bbs_multi_board (";
			strQuery       += " bbs_id, bbs_depth, bbs_usr_id, bbs_usr_name, bbs_usr_pass,";
			strQuery       += " bbs_usr_email, bbs_title, bbs_contents, bbs_host, bbs_html, mas_bbs_id, bbs_hp, bbs_section)";
			strQuery       += " values (?,?,?,?,?,?,?,?,?,?,?,?,?)";

			pstmt = conn.prepareStatement(strQuery);
			pstmt.setInt(1, intBbsId - 1);
			pstmt.setInt(2, intDepth + 1);
			pstmt.setString(3, id);
			pstmt.setString(4, name);
			pstmt.setString(5, password);
			pstmt.setString(6, email);
			pstmt.setString(7, title);
			pstmt.setString(8, contents);
			pstmt.setString(9, mReq.getRemoteHost());
			pstmt.setString(10, html);
			pstmt.setString(11, MAS_BBS_ID);
			pstmt.setString(12, hp);
			pstmt.setString(13, section);
			
			pstmt.executeUpdate();

		} catch (SQLException ex) {
			ex.printStackTrace();
		} finally {
			JDBC.close(conn, pstmt);
		}
		return checkCode;
	}
	
	/**
     * 답글이 있는지 체크
     * 1 : 답글있음(삭제안함) 2 : 답글없음 (삭제)
     * @param req Request
     * @return int
     * @throws ClassNotFoundException
     */
	public int isReply(Request req) throws ClassNotFoundException {
		Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        int checkDelOk = 0;
        int nextDepth = 0;

        String MAS_BBS_ID = req.getString("masBbsId");
        int intBbsId = Integer.parseInt(req.getString("bbsId"));
        int intDepth = Integer.parseInt(req.getString("depth"));

        try {

            conn = JDBC.getConnection();

            String strQuery = "select bbs_depth from bbs_multi_board";
            strQuery       += " where bbs_id = ";
            strQuery       += " (select max(bbs_id) from bbs_multi_board";
            strQuery       += " where bbs_id < ? and mas_bbs_id = ?) and mas_bbs_id = ?";

            pstmt = conn.prepareStatement(strQuery);
            pstmt.setInt(1, intBbsId);
            pstmt.setString(2, MAS_BBS_ID);
            pstmt.setString(3, MAS_BBS_ID);

            rs = pstmt.executeQuery();

            if (rs.next()) {
            	nextDepth = rs.getInt(1);
            } else {
            	nextDepth = 0;
            }

            if ((nextDepth - intDepth) > 0) {     //하위글이 있다
                checkDelOk = 1;
            } else {                              //하위글이 없다 (삭제할수 있다.)
                checkDelOk = 0;
            }

        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            JDBC.close(conn, pstmt, rs);
        }

        return checkDelOk;
	}
	
	/**
	 * 알림글 Flag Change 여부
     * 1 : 수정가능 0 : 수정불가
     * @param req Request
     * @return int
     * @throws ClassNotFoundException
     */
	public int isChangeNotice(Request req) {

		int checkChangeOk = 0;

		try {

			int intBbsId = Integer.parseInt(req.getString("bbsId"));
            int tmpValue = intBbsId % 100;

            if (tmpValue == 0) {				//원글
                int isReply = isReply(req);
                if (isReply == 1) {				//답글이 있다
                	checkChangeOk = 0;
                } else {						//답글이 없다
                    checkChangeOk = 1;
                }
            } else {							//답글
            	checkChangeOk = 0;
            }

        } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
        }

        return checkChangeOk;
	}
	
	/**
	 * Write UserId
	 * @param strBbsId
	 * @param MAS_BBS_ID
	 * @return
	 * @throws ClassNotFoundException
	 */
    public String getUserId(String strBbsId, String MAS_BBS_ID) throws ClassNotFoundException {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        String strUserId = "";
        try {
            conn = JDBC.getConnection();

            pstmt = conn.prepareStatement("select bbs_usr_id from bbs_multi_board where bbs_id = ? and mas_bbs_id = ?");
            pstmt.setInt(1, Integer.parseInt(strBbsId));
            pstmt.setString(2, MAS_BBS_ID);
            
            rs = pstmt.executeQuery();
            if (rs.next()) {
            	strUserId = rs.getString(1);
            }

        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            JDBC.close(conn, pstmt, rs);
        }
        return strUserId;
    }
    
	/**
	 * 비회원 삭제및 수정용
	 * @param strBbsId
	 * @param MAS_BBS_ID
	 * @param strBbsPass
	 * @return
	 * @throws ClassNotFoundException
	 */
	public int checkBoardPass(String strBbsId, String MAS_BBS_ID, String strBbsPass) throws ClassNotFoundException {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		int checkOk = 0;

		try {
			conn = JDBC.getConnection();

			try {
				String strQuery = "select bbs_id from bbs_multi_board";
				strQuery       += " where bbs_id = ? and mas_bbs_id = ? and bbs_usr_pass = ?";

				pstmt = conn.prepareStatement(strQuery);
				pstmt.setInt(1, Integer.parseInt(strBbsId));
				pstmt.setString(2, MAS_BBS_ID);
				pstmt.setString(3, strBbsPass);

				rs = pstmt.executeQuery();
				if (rs.next()) {
					checkOk = 1;            //패스워드 OK
				} else {
					checkOk = 0;            //패스워드 불일치
				}

			} catch (SQLException ex) {
				ex.printStackTrace();
			} finally {
				JDBC.close(conn, pstmt, rs);
			}

         } catch (SQLException ex) {
             ex.printStackTrace();
         } finally {
        	 JDBC.close(conn, pstmt, rs);
         }

         return checkOk;
	}
	
	/**
	 * 게시물 수정
	 * @param mReq MRequest
	 * @param MAS_BBS_ID String
	 * @return int
	 * @throws ClassNotFoundException
	 */
	public int bbsModify (MRequest mReq, String DATA_ROOT, String MAS_BBS_ID, String S_LEVEL, String S_ID) throws ClassNotFoundException {
		Connection conn = null;
		PreparedStatement pstmt = null;
		//ResultSet rs = null;
		int checkCode = 0;

		try {
			conn = JDBC.getConnection();
			mReq.setSavePath(DATA_ROOT + "/BBS/" + MAS_BBS_ID + "/");

			mReq.makeDir();

			try {
				mReq.parse();
			} catch (IOException ex) {
				ex.printStackTrace();
			}

			//게시물의 INDEX
			int intBbsId = 0;
			if (mReq.getParameter("bbsId") != null) {
				intBbsId = Integer.parseInt(mReq.getParameter("bbsId"));
			}

			//common parameter
			String id = mReq.getParameter("id");
			String name = mReq.getParameter("name");
			String password = mReq.getParameter("password");
			String title = mReq.getParameter("title");
			String email = mReq.getParameter("email");
			String contents = mReq.getParameter("contents");
			String html = mReq.getParameter("html");
			String oldHtml = mReq.getParameter("oldHtml");
			if (html == null) { html = oldHtml; }
			String notice = mReq.getParameter("notice");
			String oldNotice = mReq.getParameter("oldNotice");
			if (notice == null) { notice = oldNotice; }
			String secret = mReq.getParameter("secret");
			String oldSecret = mReq.getParameter("oldSecret");
			if (secret == null) { secret = oldSecret; }
			String section = mReq.getParameter("section");
			String hp = mReq.getParameter("hp");
			
			int checkModify = 1;
			
			//if (S_LEVEL.equals("1") || (!S_ID.equals("") && S_ID.equals(id))) {  				//관리자 이거나 글쓴이일 경우
			if (S_LEVEL.indexOf("S") > 0 || (!S_ID.equals("") && S_ID.equals(id))) {			//관리자 이거나 글쓴이일 경우
			} else {
				checkModify = checkBoardPass(mReq.getParameter("bbsId"), MAS_BBS_ID, password);	//그외(Guest인 경우:패스워드 check)
			}
			
			if (checkModify == 1) {
			
				//기존 파일개수
				int orgfile_count = 0;
				if (mReq.getParameter("orgfile_count") != null) {
					orgfile_count = Integer.parseInt(mReq.getParameter("orgfile_count"));
				}
	
				//새로 등록할 파일개수
				int attach_count = 0;
				if (mReq.getParameter("attach_count") != null) {
					attach_count = Integer.parseInt(mReq.getParameter("attach_count"));
				}
	              
				String uploadPath = "/BBS/" + MAS_BBS_ID + "/";
	
				//기존 파일 개수 만큼 Loop 돌면서 삭제 체크된 파일 삭제
				for (int j = 1; j <= orgfile_count; j++) {
					String orgFileFormName = "orgFile" + j;
					String orgFileFormId = "fileId" + j;
					String orgFileFormDelFlag = "delFlag" + j;
	
					String orgFileName = mReq.getParameter(orgFileFormName); 	//파일명
					String orgFileId = mReq.getParameter(orgFileFormId);		//파일아이디
					String delFlag = mReq.getParameter(orgFileFormDelFlag);		//삭제 Flag
					
					if (delFlag == null) { delFlag = "0"; }
	
					//Check된 파일만 삭제한다.
					if (delFlag.equals("1")) {
						mReq.delOldFile(orgFileName);
	
						//삭제된 파일정보를 DB에서도 삭제
						try {
							String strSQL = "delete from bbs_attach where ach_idx = ?";
							pstmt = conn.prepareStatement(strSQL);
							pstmt.setInt(1, Integer.parseInt(orgFileId));
							pstmt.executeUpdate();
						} catch (SQLException ex) {
							ex.printStackTrace();
						} finally {
							JDBC.closePrepareStatement(pstmt);
						}
					}
				}
	
				//파일 개수 만큼 Loop를 돌면서 처리(등록)
				for (int i = 1; i <= attach_count; i++) {
					String inputFormName = "attach_file" + i;
					String fileName = mReq.getFileSystemName(inputFormName);		//파일명
					String fileType = mReq.getContentType(inputFormName);			//파일 Type
	
					if (fileName == null) {											//파일이 없다.
					} else {
						File realFile = mReq.getFile(inputFormName);				//실제 파일 객체를 불러온다.
						int fileSize = (int) realFile.length();						//파일 Size
						if (fileSize <= 0) {										//잘못된 파일이다.
							mReq.delFile();
						} else {													//파일이 있을경우에만 DB에 저장한다.
							
							String[] arrImgType = fileType.split("/");				//이미지 type을 추려낸다.
							String imgType = arrImgType[0];
							
							if (imgType.equals("image")) {
								//썸네일 이미지 만들기
								ImageManager imgmanager = ImageManager.getInstance();
	
								//썸네일 폴더 생성
								String strThumbNailDir = mReq.getSavePath() + "thumbnail/";
								File thumbNailDir = new File(strThumbNailDir);
	
								if (!thumbNailDir.exists()) {
									thumbNailDir.mkdirs();
								}
	
								//Mid 썸네일 폴더 생성
								String strMidThumbNailDir = mReq.getSavePath() + "mid_thumbnail/";
								File midThumbNailDir = new File(strMidThumbNailDir);
	
								if (!midThumbNailDir.exists()) {
									midThumbNailDir.mkdirs();
								}
	
								//썸네일 이름 Setting
								String thumbName = fileName.substring(0,fileName.lastIndexOf("."));
								String thumbFileName = thumbName + "_thumb.jpg";
								String thumbNailFileUri = strThumbNailDir + thumbFileName;
								String midThumbNailFileUri = strMidThumbNailDir + thumbFileName;
								String orgPath = mReq.getSavePath() + fileName;
								
								try {
									imgmanager.createThumbnail(orgPath, thumbNailFileUri, 100);
									imgmanager.createThumbnail(orgPath, midThumbNailFileUri, 500);
								} catch (Exception ex1) {
								}
							}
							
							try {
								String strSQL = "insert into bbs_attach(";
								strSQL       += " bbs_id,mas_bbs_id,ach_file_name,ach_file_path,ach_file_size)";
								strSQL       += " values (?,?,?,?,?)";
								pstmt = conn.prepareStatement(strSQL);
	
								pstmt.setInt(1, intBbsId);
								pstmt.setString(2, MAS_BBS_ID);
								pstmt.setString(3, fileName);
								pstmt.setString(4, uploadPath);
								pstmt.setInt(5, fileSize);
								pstmt.executeUpdate();
							} catch (SQLException ex) {
								ex.printStackTrace();
							} finally {
								JDBC.closePrepareStatement(pstmt);
							}
						} //if (fileSize <= 0) {
					} //if (fileName == null) {
				} //for (int i = 1; i <= attach_count; i++) {
	
				/*게시물을 수정한다..*/
				String strQuery = "update bbs_multi_board set";
				strQuery       += " bbs_usr_name = ?, bbs_usr_email = ?, bbs_title = ?,";
				strQuery       += " bbs_contents = ?, bbs_host = ?, bbs_html = ?, bbs_notice = ?, bbs_secret = ?,";
				strQuery       += " bbs_hp = ?, bbs_section = ?";
				strQuery       += " where bbs_id = ? and mas_bbs_id = ?";
	
				pstmt = conn.prepareStatement(strQuery);
	
				pstmt.setString(1, name);
				pstmt.setString(2, email);
				pstmt.setString(3, title);
				pstmt.setString(4, contents);
				pstmt.setString(5, mReq.getRemoteHost());
				pstmt.setString(6, html);
				pstmt.setString(7, notice);
				pstmt.setString(8, secret);
				pstmt.setString(9, hp);
				pstmt.setString(10, section);
				pstmt.setInt(11, intBbsId);
				pstmt.setString(12, MAS_BBS_ID);
				pstmt.executeUpdate();
				
				checkCode = 1;
			} else {
				checkCode = 0;
			}

		} catch (SQLException ex) {
			ex.printStackTrace();
		} finally {
			JDBC.close(conn, pstmt);
		}
		return checkCode;
	}

	/**
	 * 게시물을 삭제한다.
	 * 댓글, 파일정보, 파일을 삭제한다.
     * @param req Request
     * @throws ClassNotFoundException
     */
    public void bbsDelete(Request req) throws ClassNotFoundException {
    	Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        String MAS_BBS_ID = req.getString("masBbsId");
        int intBbsId = Integer.parseInt(req.getString("bbsId"));

        try {
            conn = JDBC.getConnection();

            //Comment 삭제
            try {
                String strQuery = "delete from bbs_multi_board_comment where bbs_id = ? and mas_bbs_id = ?";
                pstmt = conn.prepareStatement(strQuery);
                pstmt.setInt(1, intBbsId);
                pstmt.setString(2, MAS_BBS_ID);
                pstmt.executeUpdate();
            } catch (SQLException ex) {
                ex.printStackTrace();
            } finally {
                JDBC.closePrepareStatement(pstmt);
            }

            //게시물 삭제
            try {
                String strQuery = "delete from bbs_multi_board where bbs_id = ? and mas_bbs_id = ?";
                pstmt = conn.prepareStatement(strQuery);
                pstmt.setInt(1, intBbsId);
                pstmt.setString(2, MAS_BBS_ID);
                pstmt.executeUpdate();
            } catch (SQLException ex) {
                ex.printStackTrace();
            } finally {
                JDBC.closePrepareStatement(pstmt);
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            JDBC.close(conn, pstmt, rs);
        }
    }
}
