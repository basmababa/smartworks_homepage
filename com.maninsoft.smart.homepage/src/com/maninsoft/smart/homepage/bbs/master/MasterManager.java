package com.maninsoft.smart.homepage.bbs.master;

import com.maninsoft.smart.homepage.request.*;
import com.maninsoft.smart.homepage.jdbc.*;
import com.maninsoft.smart.homepage.fms.FileRepository;
import java.util.ArrayList;
import java.sql.*;

public class MasterManager {
	
	public static MasterManager instance =  new MasterManager();

    public static MasterManager getInstance() {
        return instance;
    }

    private MasterManager() {
    }

	/**
     * Board Master Info List
     * @return ArrayList
     * @throws ClassNotFoundException
     */
	public ArrayList getBoardList() throws ClassNotFoundException {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		ArrayList bbsList = null;
		
		try {
			conn = JDBC.getConnection();
			String strQuery = "select mas_idx, mas_bbs_id, mas_bbs_name, mas_admin_id, mas_access, mas_view, mas_write,";
			strQuery       += " mas_attach, mas_comment, mas_reply, mas_mail, mas_kind, mas_status, cat_id";
			strQuery       += " from bbs_master order by mas_idx desc";
			
			pstmt = conn.prepareStatement(strQuery);
			rs = pstmt.executeQuery();

			bbsList = new ArrayList();

			while (rs.next()) {
				MasterBean bbsInfo = new MasterBean();

				bbsInfo.setMasIdx(rs.getInt(1));
				bbsInfo.setMasBbsId(rs.getString(2));
				bbsInfo.setMasBbsName(rs.getString(3));
				bbsInfo.setMasAdminId(rs.getString(4));
				bbsInfo.setMasAccess(rs.getString(5));
				bbsInfo.setMasView(rs.getString(6));
				bbsInfo.setMasWrite(rs.getString(7));
				bbsInfo.setMasAttach(rs.getString(8));
				bbsInfo.setMasComment(rs.getString(9));
				bbsInfo.setMasReply(rs.getString(10));
				bbsInfo.setMasMail(rs.getString(11));
				bbsInfo.setMasKind(rs.getString(12));
				bbsInfo.setMasStatus(rs.getString(13));
				bbsInfo.setCatId(rs.getString(14));
				bbsList.add(bbsInfo);
			}

		} catch (SQLException ex) {
			bbsList = null;
			ex.printStackTrace();
		} finally {
			JDBC.close(conn, pstmt, rs);
		}
		return bbsList;
	}

	/**
	 * 게시판 아이디(DB table name) 중복체크
     * 1 : 중복 , 0: 중복안됨
     * @param req Request
     * @return int
     * @throws ClassNotFoundException
     */
	public int checkBbsId(Request req) throws ClassNotFoundException {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			conn = JDBC.getConnection();
			pstmt = conn.prepareStatement("select mas_bbs_id from bbs_master where mas_bbs_id = ?");
			pstmt.setString(1, req.getString("board_id"));

			rs = pstmt.executeQuery();
			if (rs.next()) {
				return 1;              //사용중인  BBS ID
			} else {
				return 0;              //BBS ID 존재하지 않음 0
			}

		} catch (SQLException ex) {
			ex.printStackTrace();
		} finally {
			JDBC.close(conn, pstmt, rs);
		}
		return 0;
	}

	/**
	 * BOARD Master 등록
     * @param req Request
     * @throws ClassNotFoundException
     */
	public void insertBoard(Request req) throws ClassNotFoundException {
		Connection conn = null;
		PreparedStatement pstmt = null;

		try {
			conn = JDBC.getConnection();

            String strQuery = "insert into bbs_master (mas_bbs_id, mas_bbs_name, mas_admin_id, ";
            strQuery +=       " mas_access, mas_view, mas_write, mas_attach, mas_comment,";
            strQuery +=       " mas_reply, mas_mail, mas_kind, cat_id)";
            strQuery +=       " values (?,?,?,?,?,?,?,?,?,?,?,?)";

            //Limit parameter setting (Type : array)
            String[] arrAccess = req.getParameterValues("chk_access");
            String[] arrView = req.getParameterValues("chk_view");
            String[] arrWrite = req.getParameterValues("chk_write");

            String strAccess = "";
            String strView = "";
            String strWrite = "";

            if (arrAccess != null) { //parameter 가 null이 아닌경우에만 처리
                //최초값 세팅
                strAccess = arrAccess[0];
                for (int i = 1; i < arrAccess.length; i++) {
                    strAccess = strAccess + "," + arrAccess[i];
                }
            }
            if (arrView != null) { //parameter 가 null이 아닌경우에만 처리
                //최초값 세팅
                strView = arrView[0];
                for (int i = 1; i < arrView.length; i++) {
                    strView = strView + "," + arrView[i];
                }
            }
            if (arrAccess != null) { //parameter 가 null이 아닌경우에만 처리
                //최초값 세팅
                strWrite = arrWrite[0];
                for (int i = 1; i < arrWrite.length; i++) {
                    strWrite = strWrite + "," + arrWrite[i];
                }
            }

            //config parameter setting
            String strAttach = req.getString("chk_attach");
            String strComment = req.getString("chk_comment");
            String strReply = req.getString("chk_reply");
            String strMail = req.getString("chk_mail");

            if (strAttach == null) {
                strAttach = "0";
            }
            if (strComment == null) {
                strComment = "0";
            }
            if (strReply == null) {
                strReply = "0";
            }
            if (strMail == null) {
                strMail = "0";
            }

            pstmt = conn.prepareStatement(strQuery);
            pstmt.setString(1, req.getString("board_id"));
            pstmt.setString(2, req.getString("board_name"));
            pstmt.setString(3, req.getString("board_admin"));
            pstmt.setString(4, strAccess);
            pstmt.setString(5, strView);
            pstmt.setString(6, strWrite);
            pstmt.setString(7, strAttach);
            pstmt.setString(8, strComment);
            pstmt.setString(9, strReply);
            pstmt.setString(10, strMail);
            pstmt.setString(11, req.getString("board_kind"));
            pstmt.setString(12, req.getString("category"));
            pstmt.executeUpdate();

        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            JDBC.close(conn, pstmt);
        }
	}

	/**
     * board master 수정용
     * @param req Request
     * @return MasterBean
     * @throws ClassNotFoundException
     */
	public MasterBean getBoard(Request req) throws ClassNotFoundException {
		Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        MasterBean master = new MasterBean();

        try {
            conn = JDBC.getConnection();

            String strQuery = "select mas_bbs_id,mas_bbs_name,mas_admin_id,mas_access,mas_view,";
            strQuery +=       " mas_write,mas_attach,mas_comment,mas_reply,mas_mail,mas_kind,cat_id";
            strQuery +=       " from bbs_master where mas_idx = ?";

            pstmt = conn.prepareStatement(strQuery);
            pstmt.setInt(1, req.getInt("chkSel"));
            rs = pstmt.executeQuery();

            if (rs.next()) {
                master.setMasBbsId(rs.getString("mas_bbs_id"));
                master.setMasBbsName(rs.getString("mas_bbs_name"));
                master.setMasAdminId(rs.getString("mas_admin_id"));
                master.setMasAccess(rs.getString("mas_access"));
                master.setMasView(rs.getString("mas_view"));
                master.setMasWrite(rs.getString("mas_write"));
                master.setMasAttach(rs.getString("mas_attach"));
                master.setMasComment(rs.getString("mas_comment"));
                master.setMasReply(rs.getString("mas_reply"));
                master.setMasMail(rs.getString("mas_mail"));
                master.setMasKind(rs.getString("mas_kind"));
                master.setCatId(rs.getString("cat_id"));
            }

        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            JDBC.close(conn, pstmt, rs);
        }
        return master;
    }

	/**
     * Board Master info Update
     * @param req Request
     * @throws ClassNotFoundException
     */
    public void updateBoard(Request req) throws ClassNotFoundException {
        Connection conn = null;
        PreparedStatement pstmt = null;

        try {
            conn = JDBC.getConnection();
            String strQuery = "update bbs_master set";
            strQuery +=       " mas_bbs_name=?, mas_admin_id=?, mas_access=?, mas_view=?, mas_write=?,";
            strQuery +=       " mas_attach=?, mas_comment=?, mas_reply=?, mas_mail=?, mas_kind=?, cat_id=?";
            strQuery +=       " where mas_idx = ?";

            //Limit parameter setting (Type : array)
            String[] arrAccess = req.getParameterValues("chk_access");
            String[] arrView = req.getParameterValues("chk_view");
            String[] arrWrite = req.getParameterValues("chk_write");

            String strAccess = "";
            String strView = "";
            String strWrite = "";

            if (arrAccess != null) { //parameter 가 null이 아닌경우에만 처리
                //최초값 세팅
                strAccess = arrAccess[0];
                for (int i = 1; i < arrAccess.length; i++) {
                    strAccess = strAccess + "," + arrAccess[i];
                }
            }
            if (arrView != null) { //parameter 가 null이 아닌경우에만 처리
                //최초값 세팅
                strView = arrView[0];
                for (int i = 1; i < arrView.length; i++) {
                    strView = strView + "," + arrView[i];
                }
            }
            if (arrAccess != null) { //parameter 가 null이 아닌경우에만 처리
                //최초값 세팅
                strWrite = arrWrite[0];
                for (int i = 1; i < arrWrite.length; i++) {
                    strWrite = strWrite + "," + arrWrite[i];
                }
            }

            //config parameter setting
            String strAttach = req.getString("chk_attach");
            String strComment = req.getString("chk_comment");
            String strReply = req.getString("chk_reply");
            String strMail = req.getString("chk_mail");

            if (strAttach == null) {
                strAttach = "0";
            }
            if (strComment == null) {
                strComment = "0";
            }
            if (strReply == null) {
                strReply = "0";
            }
            if (strMail == null) {
                strMail = "0";
            }

            pstmt = conn.prepareStatement(strQuery);
            pstmt.setString(1, req.getString("board_name"));
            pstmt.setString(2, req.getString("board_admin"));
            pstmt.setString(3, strAccess);
            pstmt.setString(4, strView);
            pstmt.setString(5, strWrite);
            pstmt.setString(6, strAttach);
            pstmt.setString(7, strComment);
            pstmt.setString(8, strReply);
            pstmt.setString(9, strMail);
            pstmt.setString(10, req.getString("board_kind"));
            pstmt.setString(11, req.getString("category"));
            pstmt.setInt(12, req.getInt("chkSel"));

            pstmt.executeUpdate();

        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            JDBC.close(conn, pstmt);
        }
    }

	/**
     * 해당 idx의 게시판 MAS_BBS_ID를 가져온다.
     * DataBase table 삭제용
     * @param req Request
     * @return String
     * @throws ClassNotFoundException
     */
	public String getMasBbsId(Request req) throws ClassNotFoundException {
		Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        String boardId = "";

        try {
            conn = JDBC.getConnection();

            pstmt = conn.prepareStatement("select mas_bbs_id from bbs_master where mas_idx = ?");
            pstmt.setInt(1, req.getInt("chkSel"));
            rs = pstmt.executeQuery();

            if (rs.next()) {
                boardId = rs.getString(1);
            }

        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            JDBC.close(conn, pstmt, rs);
        }
        return boardId;
    }

    /**
     * Board Master info 삭제
     * @param req
     * @param DATA_ROOT
     * @param MAS_BBS_ID
     * @throws ClassNotFoundException
     */
	public void deleteBoard(Request req, String DATA_ROOT, String MAS_BBS_ID) throws ClassNotFoundException {
		Connection conn = null;
		PreparedStatement pstmt = null;

		try {
			conn = JDBC.getConnection();

			//파일삭제
			try {
				FileRepository fileStore = FileRepository.getInstance();
				String boardDir = DATA_ROOT + "/BBS/" + MAS_BBS_ID + "/";
                String boardThumDir = boardDir + "thumbnail/";
                String boardMidThumDir = boardDir + "mid_thumbnail/";
                fileStore.removeDirectory(boardThumDir);
                fileStore.removeDirectory(boardMidThumDir);
                fileStore.removeDirectory(boardDir);
			} catch (Exception ex) {
				ex.printStackTrace();
			} finally {
			}

			//file attach 삭제
			try {
				pstmt = conn.prepareStatement("delete from bbs_attach where mas_bbs_id = ?");
				pstmt.setString(1, MAS_BBS_ID);
				pstmt.executeUpdate();
			} catch (SQLException ex) {
				ex.printStackTrace();
			} finally {
				JDBC.closePrepareStatement(pstmt);
			}

			//Comment 삭제
			try {
				pstmt = conn.prepareStatement("delete from bbs_multi_board_comment where mas_bbs_id = ?");
				pstmt.setString(1, MAS_BBS_ID);
				pstmt.executeUpdate();
			} catch (Exception ex) {
				ex.printStackTrace();
			} finally {
				JDBC.closePrepareStatement(pstmt);
			}

			//게시물 삭제
			try {
				pstmt = conn.prepareStatement("delete from bbs_multi_board where mas_bbs_id = ?");
				pstmt.setString(1, MAS_BBS_ID);
				pstmt.executeUpdate();
			} catch (Exception ex) {
				ex.printStackTrace();
			} finally {
				JDBC.closePrepareStatement(pstmt);
			}

			//bbs_master info 삭제
			try {
				pstmt = conn.prepareStatement("delete from bbs_master where mas_idx = ?");
				pstmt.setInt(1, req.getInt("chkSel"));
				pstmt.executeUpdate();
			} catch (Exception ex) {
				ex.printStackTrace();
			} finally {
				JDBC.closePrepareStatement(pstmt);
			}

		} catch (SQLException ex) {
			ex.printStackTrace();
		} finally {
			JDBC.closeConnection(conn);
		}
	}

    /**
     * 일반게시판, 갤러리게시판 목록 가져오기
     * catId = 0 전체, 그외 해당 카테고리 게시판리스트
     * 특정 목적(mas_kind = 3)게시판 제외
     * @return ArrayList
     * @throws ClassNotFoundException
     */
	public ArrayList getGeneralList(int catId) throws ClassNotFoundException {
		ArrayList bbsList = null;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			conn = JDBC.getConnection();
			String strQuery = "select mas_bbs_id, mas_bbs_name, mas_kind, cat_id";
			strQuery       += " from bbs_master";
			strQuery       += " where mas_status = '1' and mas_kind != '3'";
			if (catId != 0) {
				strQuery   += " and cat_id = '" + catId + "'";
			}

			pstmt = conn.prepareStatement(strQuery);
			rs = pstmt.executeQuery();

			bbsList = new ArrayList();
			while (rs.next()) {
				MasterBean bbsInfo = new MasterBean();
				bbsInfo.setMasBbsId(rs.getString(1));
				bbsInfo.setMasBbsName(rs.getString(2));
				bbsInfo.setMasKind(rs.getString(3));
				bbsInfo.setCatId(rs.getString(4));
				bbsList.add(bbsInfo);
			}

		} catch (SQLException ex) {
			bbsList = null;
			ex.printStackTrace();
		} finally {
			JDBC.close(conn, pstmt, rs);
		}
		return bbsList;
	}

	/**
	 * 접근 권한
     * ALVW (A:관리자 L:목록보기 V:내용보기 W:글쓰기)
     * @param MAS_BBS_ID String
     * @param sessionId String
     * @param sessionLevel String
     * @return String
     * @throws ClassNotFoundException
     */
	public String getAccessLevel(String MAS_BBS_ID, String sessionId, String sessionLevel) throws ClassNotFoundException {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String accessLevel = "";

        try {
            conn = JDBC.getConnection();

            String strQuery = "select mas_admin_id, mas_access, mas_view, mas_write";
            strQuery       += " from bbs_master where mas_bbs_id = ?";

            pstmt = conn.prepareStatement(strQuery);
            pstmt.setString(1, MAS_BBS_ID);
            rs = pstmt.executeQuery();

            if (rs.next()) {
                String strAdminId = rs.getString(1);
                String strAccess = rs.getString(2);
                String strView = rs.getString(3);
                String strWrite = rs.getString(4);

                // 권한을 분해해서 찾아낸다.
                String[] arrAccess = strAccess.split(",");
                String[] arrView = strView.split(",");
                String[] arrWrite = strWrite.split(",");

                /*****   ALVW (A:관리자 L:목록보기 V:내용보기 W:글쓰기   *****/
                if (sessionLevel.equals("1") || sessionLevel.equals("2") || sessionId.equals(strAdminId)) {     //관리권한이 있음(관리자 or 게시판관리자)
                	accessLevel = "ALVWS";
                } else {
                    //배열처리된 스트링을 Loop를 돌면서 Check해야 한다.
                    //목록보기 권한있음
                	for (int i = 0; i < arrAccess.length; i++) {
                		if (arrAccess[i].equals(sessionLevel)) {
                			accessLevel = accessLevel + "L";
                		}
                	}

                    //내용보기 권한있음
                    for (int i = 0; i < arrView.length; i++) {
                    	if (arrView[i].equals(sessionLevel)) {
                    		accessLevel = accessLevel + "V";
                    	}
                    }

                    //글쓰기 권한있음
                    for (int i = 0; i < arrWrite.length; i++) {
                    	if (arrWrite[i].equals(sessionLevel)) {
                    		accessLevel = accessLevel + "W";
                    	}
                    }
                }
            }
            
        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            JDBC.close(conn, pstmt, rs);
        }
        return accessLevel;
    }

	/**
     * 게시판 환경설정
     * FCRM (F:첨부 C:댓글 R:답변 M:메일)
     * @param MAS_BBS_ID String
     * @return String
     * @throws ClassNotFoundException
     */
	public String getConfig(String MAS_BBS_ID) throws ClassNotFoundException {
		Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        String boardConfig = "";

        try {
            conn = JDBC.getConnection();

            String strQuery = "select mas_attach, mas_comment, mas_reply, mas_mail";
            strQuery       += " from bbs_master where mas_bbs_id = ?";

            pstmt = conn.prepareStatement(strQuery);
            pstmt.setString(1, MAS_BBS_ID);
            rs = pstmt.executeQuery();

            if (rs.next()) {
                String strAttach = rs.getString(1);
                String strComment = rs.getString(2);
                String strReply = rs.getString(3);
                String strMail = rs.getString(4);

                //파일 업로드 기능 있음
                if (strAttach.equals("1")) {
                    boardConfig = boardConfig + "F";
                }

                //댓글 기능 있음
                if (strComment.equals("1")) {
                    boardConfig = boardConfig + "C";
                }

                //답변 기능 있음
                if (strReply.equals("1")) {
                    boardConfig = boardConfig + "R";
                }

                //메일 기능 있음(실제 사용 안함)
                if (strMail.equals("1")) {
                    boardConfig = boardConfig + "M";
                }
            }

        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            JDBC.close(conn, pstmt, rs);
        }

        return boardConfig;
	}

	/**
     * 게시판 이름 가져오기
     * @param MAS_BBS_ID String
     * @return String
     * @throws ClassNotFoundException
     */
	public String getBoardName(String MAS_BBS_ID) throws ClassNotFoundException {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        String boardName = "";

        try {
            conn = JDBC.getConnection();

            String strQuery = "select mas_bbs_name";
            strQuery       += " from bbs_master where mas_bbs_id = ?";

            pstmt = conn.prepareStatement(strQuery);
            pstmt.setString(1, MAS_BBS_ID);
            rs = pstmt.executeQuery();

            if (rs.next()) {
               boardName = rs.getString(1);
            }

        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            JDBC.close(conn, pstmt, rs);
        }
        return boardName;
    }

	/**
     * 게시판 전용관리자 가져오기
     * @param MAS_BBS_ID String
     * @return String
     * @throws ClassNotFoundException
     */
    public String getBoardOperator(String MAS_BBS_ID) throws ClassNotFoundException {
    	Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        String operaterId = "";

        try {
            conn = JDBC.getConnection();

            String strQuery = "select mas_admin_id";
            strQuery       += " from bbs_master where mas_bbs_id = ?";

            pstmt = conn.prepareStatement(strQuery);
            pstmt.setString(1, MAS_BBS_ID);
            rs = pstmt.executeQuery();

            if (rs.next()) {
               operaterId = rs.getString(1);
            }

        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            JDBC.close(conn, pstmt, rs);
        }
        return operaterId;
    }

	/**
     * 사용여부체크
     * @param req Request
     * @throws NumberFormatException
     * @throws ClassNotFoundException
     */
	public void activeBoard(Request req) throws
            NumberFormatException, ClassNotFoundException {
		Connection conn = null;
		PreparedStatement pstmt = null;

        try {
            conn = JDBC.getConnection();

            int indexNum = 0;
            String[] check = req.getParameterValues("chkActive");
            if (check != null) {
                indexNum = check.length;
            }

            pstmt = conn.prepareStatement("update bbs_master set mas_status = '0'");
            pstmt.executeUpdate();

            for (int i = 0; i < indexNum; i++) {
            	int intCheck = Integer.parseInt(check[i]);
                pstmt = conn.prepareStatement("update bbs_master set mas_status = '1' where mas_idx = ?");
                pstmt.setInt(1, intCheck);
                pstmt.executeUpdate();
            }

        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            JDBC.close(conn, pstmt);
        }
    }
	
}
