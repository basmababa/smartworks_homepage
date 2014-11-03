package com.maninsoft.smart.homepage.admin.db.popup;

import com.maninsoft.smart.homepage.request.*;
import com.maninsoft.smart.homepage.jdbc.*;
import com.maninsoft.smart.homepage.util.ImageManager;
import java.util.ArrayList;
import java.sql.*;
import java.io.File;
import java.io.IOException;

public class PopupManager {

    private static PopupManager instance = new PopupManager();

    public static PopupManager getInstance() {
        return instance;
    }

    private PopupManager() {
    }

	/**
     * POPUP 리스트 가져오기(관리자 화면)
     * @return ArrayList
     * @throws ClassNotFoundException
     */
	public ArrayList getPopupList() throws ClassNotFoundException {
    	ArrayList popList = null;
    	Connection conn = null;
    	PreparedStatement pstmt = null;
    	ResultSet rs = null;

    	try {
    		conn = JDBC.getConnection();
    		String strQuery = "select pop_idx, pop_title, pop_img_width, pop_img_height, pop_img_size,";
    		strQuery       += " pop_point_top, pop_point_left, pop_start_date, pop_end_date, pop_use_cookie, pop_status";
    		strQuery       += " from db_popup order by pop_idx desc";

    		pstmt = conn.prepareStatement(strQuery);
    		rs = pstmt.executeQuery();

    		popList = new ArrayList();

    		while (rs.next()) {
    			PopupBean popInfo = new PopupBean();

				popInfo.setPopIdx(rs.getInt(1));
				popInfo.setPopTitle(rs.getString(2));
				popInfo.setPopImgWidth(rs.getInt(3));
				popInfo.setPopImgHeight(rs.getInt(4));
				popInfo.setPopImgSize(rs.getInt(5));
				popInfo.setPopPointTop(rs.getInt(6));
				popInfo.setPopPointLeft(rs.getInt(7));
				popInfo.setPopStartDate(rs.getTimestamp(8));
				popInfo.setPopEndDate(rs.getTimestamp(9));
				popInfo.setPopUseCookie(rs.getString(10));
				popInfo.setPopStatus(rs.getString(11));

				popList.add(popInfo);
    		}

    	} catch (SQLException ex) {
    		popList = null;
    		ex.printStackTrace();
    	} finally {
    		JDBC.close(conn, pstmt, rs);
    	}
    	return popList;
	}

	/**
     * 유효한(현재 날짜가 포함되는)
     * @return ArrayList
     * @throws ClassNotFoundException
     */
	public ArrayList getValidPopupList() throws ClassNotFoundException {
		ArrayList popList = null;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			conn = JDBC.getConnection();
			String strQuery = "select pop_idx, pop_title, pop_img_width, pop_img_height, pop_img_size,";
			strQuery       += " pop_point_top, pop_point_left, pop_use_cookie, pop_link_url, pop_img_name, pop_img_path";
			strQuery       += " from db_popup where pop_start_date <= now() and pop_end_date >= now() and pop_status = '1' order by pop_idx desc";

			pstmt = conn.prepareStatement(strQuery);
			rs = pstmt.executeQuery();

			popList = new ArrayList();

			while (rs.next()) {
				PopupBean popInfo = new PopupBean();

				popInfo.setPopIdx(rs.getInt(1));
				popInfo.setPopTitle(rs.getString(2));
				popInfo.setPopImgWidth(rs.getInt(3));
				popInfo.setPopImgHeight(rs.getInt(4));
				popInfo.setPopImgSize(rs.getInt(5));
				popInfo.setPopPointTop(rs.getInt(6));
				popInfo.setPopPointLeft(rs.getInt(7));
				popInfo.setPopUseCookie(rs.getString(8));
				popInfo.setPopLinkUrl(rs.getString(9));
				popInfo.setPopImgName(rs.getString(10));
				popInfo.setPopImgPath(rs.getString(11));

				popList.add(popInfo);
           }

		} catch (SQLException ex) {
			popList = null;
			ex.printStackTrace();
		} finally {
			JDBC.close(conn, pstmt, rs);
		}
		return popList;
	}

	
	/**
     * 팝업의 정보를 등록
     * checkCode (1: 파일이 없음, 2:잘못된 파일, 3:이미지가 아님, 4: 성공)
     * @param mReq MRequest
     * @return int
     * @throws ClassNotFoundException
     */
	public int insertPopUp(MRequest mReq, String DATA_ROOT, String uploadDir) throws ClassNotFoundException {
		Connection conn = null;
		PreparedStatement pstmt = null;

		int checkCode = 0;

		try {
			conn = JDBC.getConnection();

			String strQuery = "insert into db_popup(pop_title, pop_img_name, pop_img_width, pop_img_height,";
			strQuery +=       " pop_img_size, pop_img_path, pop_start_date, pop_end_date,";
			strQuery +=       " pop_point_top, pop_point_left, pop_link_url, pop_use_cookie)";
			strQuery +=       " values (?,?,?,?,?,?,?,?,?,?,?,?)";

			mReq.setSavePath(DATA_ROOT + uploadDir);
			mReq.makeDir();
			try {
				mReq.parse();
			} catch (IOException ex) {
			}

			//common parameter
			String title = mReq.getParameter("title");
			String winTop = mReq.getParameter("win_top");
			String winLeft = mReq.getParameter("win_left");
			String linkUrl = mReq.getParameter("link_url");
			String useCookie = mReq.getParameter("check_cookie");
			String startDate = mReq.getParameter("start_date");
			String endDate = mReq.getParameter("end_date");
			
			startDate += " 00:00:00.000";
			endDate += " 00:00:00.000";
			
			String fileType = "";
			int fileSize = 0;

			//파일명 (리네임된 파일명이다.)
			String imgName = mReq.getFileSystemName("attach_img");
			fileType = mReq.getContentType("attach_img");       //(ex,image/pjpeg)
			
			if(imgName == null) {  //파일이 없다.
				checkCode = 1;
			} else {               //파일이 있다.
				File realFile = mReq.getFile("attach_img");
				fileSize = (int) realFile.length();

				String[] arrImgType = fileType.split("/");
				String imgType = arrImgType[0];                     //file type

				if (fileSize <= 0) {                                //잘못된 파일
					checkCode = 2;
					mReq.delFile();
				} else {
					if (!imgType.equals("image")) {        //이미지 type의 파일이 아니다.
						checkCode = 3;
						mReq.delFile();
					} else {
						ImageManager imgmanager = ImageManager.getInstance();
						int imgWidth = imgmanager.getImgWidth(realFile);
						int imgHeight = imgmanager.getImgHeight(realFile);

						pstmt = conn.prepareStatement(strQuery);
						pstmt.setString(1, title);
						pstmt.setString(2, imgName);
						pstmt.setInt(3, imgWidth);
						pstmt.setInt(4, imgHeight);
						pstmt.setInt(5, fileSize);
						pstmt.setString(6, uploadDir);
						pstmt.setTimestamp(7, Timestamp.valueOf(startDate));
						pstmt.setTimestamp(8, Timestamp.valueOf(endDate));
						pstmt.setInt(9, Integer.parseInt(winTop));
						pstmt.setInt(10, Integer.parseInt(winLeft));
						pstmt.setString(11, linkUrl);
						pstmt.setString(12, useCookie);
						pstmt.executeUpdate();

						checkCode = 4;
					}
				}
			}
		} catch (SQLException ex) {
			ex.printStackTrace();
		} finally {
			JDBC.close(conn, pstmt);
		}
		return checkCode;
	}

	/**
     * 팝업정보 가져오기(수정용)
     * @param req Request
     * @return PopupBean
     * @throws ClassNotFoundException
     */
	public PopupBean getPopup(Request req) throws ClassNotFoundException {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		PopupBean popup = new PopupBean();

		try {
			conn = JDBC.getConnection();

            String strQuery = "select pop_title,pop_img_name,pop_img_path,pop_start_date,";
            strQuery +=       " pop_end_date,pop_point_top,pop_point_left,pop_link_url,pop_use_cookie";
            strQuery +=       " from db_popup where pop_idx = ?";

            pstmt = conn.prepareStatement(strQuery);
            pstmt.setInt(1, req.getInt("chkSel"));

            rs = pstmt.executeQuery();

            if (rs.next()) {
            	popup.setPopTitle(rs.getString("pop_title"));
                popup.setPopImgName(rs.getString("pop_img_name"));
                popup.setPopImgPath(rs.getString("pop_img_path"));
                popup.setPopStartDate(rs.getTimestamp("pop_start_date"));
                popup.setPopEndDate(rs.getTimestamp("pop_end_date"));
                popup.setPopPointTop(rs.getInt("pop_point_top"));
                popup.setPopPointLeft(rs.getInt("pop_point_left"));
                popup.setPopLinkUrl(rs.getString("pop_link_url"));
                popup.setPopUseCookie(rs.getString("pop_use_cookie"));
            }

        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            JDBC.close(conn, pstmt, rs);
        }
        return popup;
    }

	/**
     * 팝업수정
     * 새로운 이미지가 있을경우에는 기존 파일은 삭제된다.
     * checkCode (1: 새파일이 없음(기본정보수정), 2:잘못된 파일, 3:이미지가 아님, 4: 성공)
     * @param mReq MRequest
     * @param uploadDir String
     * @return int
     * @throws ClassNotFoundException
     */
	public int updatePopUp(MRequest mReq, String DATA_ROOT, String uploadDir) throws ClassNotFoundException {
		Connection conn = null;
		PreparedStatement pstmt = null;

		int checkCode = 0;

		try {
			conn = JDBC.getConnection();

			//파일의 저장위치를 Setting
			mReq.setSavePath(DATA_ROOT + uploadDir);
			mReq.makeDir();
			try {
				mReq.parse();
			} catch (IOException ex) {
			}

			//common parameter
			String recId = mReq.getParameter("rec_id");
			String title = mReq.getParameter("title");
			String winTop = mReq.getParameter("win_top");
			String winLeft = mReq.getParameter("win_left");
			String linkUrl = mReq.getParameter("link_url");
			String useCookie = mReq.getParameter("check_cookie");
			String startDate = mReq.getParameter("start_date");
			String endDate = mReq.getParameter("end_date");
			
			startDate += " 00:00:00.000";
			endDate += " 00:00:00.000";
			
			//기존파일
			String oldFileName = mReq.getParameter("old_file");

			String fileType = "";
			int fileSize = 0;

			//파일명 (리네임된 파일명이다.)
			String imgName = mReq.getFileSystemName("attach_img");
			fileType = mReq.getContentType("attach_img");       //(ex,image/pjpeg)

			if (imgName == null) {       //새파일이 없다.(기본정보만 수정)
				String strQuery = "update db_popup set pop_title = ?, pop_point_top = ?, pop_point_left = ?,";
				strQuery +=      " pop_link_url = ?, pop_use_cookie = ?, pop_start_date = ?, pop_end_date = ?";
				strQuery +=      " where pop_idx = ?";

				pstmt = conn.prepareStatement(strQuery);

				pstmt.setString(1, title);
				pstmt.setInt(2, Integer.parseInt(winTop));
				pstmt.setInt(3, Integer.parseInt(winLeft));
				pstmt.setString(4, linkUrl);
				pstmt.setString(5, useCookie);
				pstmt.setTimestamp(6, Timestamp.valueOf(startDate));
				pstmt.setTimestamp(7, Timestamp.valueOf(endDate));
				pstmt.setInt(8, Integer.parseInt(recId));

				pstmt.executeUpdate();
				checkCode = 4;
			} else {               //파일이 있다.
				File realFile = mReq.getFile("attach_img");
				fileSize = (int) realFile.length();

				String[] arrImgType = fileType.split("/");
				String imgType = arrImgType[0];                     //file type

				if (fileSize <= 0) {                                //잘못된 파일
					checkCode = 2;
					mReq.delFile();
				} else {
					if (!imgType.equals("image")) {        //이미지 type의 파일이 아니다.
						checkCode = 3;
						mReq.delFile();
					} else {
						ImageManager imgmanager = ImageManager.getInstance();
						int imgWidth = imgmanager.getImgWidth(realFile);
						int imgHeight = imgmanager.getImgHeight(realFile);

						String strQuery = "update db_popup set pop_title = ?, pop_point_top = ?, pop_point_left = ?,";
						strQuery +=       " pop_link_url = ?, pop_use_cookie = ?, pop_start_date = ?, pop_end_date = ?,";
						strQuery +=       " pop_img_name = ?, pop_img_size = ?, pop_img_width = ?, pop_img_height = ?, pop_img_path = ?";
						strQuery +=       " where pop_idx = ?";

						pstmt = conn.prepareStatement(strQuery);

						pstmt.setString(1, title);
						pstmt.setInt(2, Integer.parseInt(winTop));
						pstmt.setInt(3, Integer.parseInt(winLeft));
						pstmt.setString(4, linkUrl);
						pstmt.setString(5, useCookie);
						pstmt.setTimestamp(6, Timestamp.valueOf(startDate));
						pstmt.setTimestamp(7, Timestamp.valueOf(endDate));
						pstmt.setString(8, imgName);
						pstmt.setInt(9, fileSize);
						pstmt.setInt(10, imgWidth);
						pstmt.setInt(11, imgHeight);
						pstmt.setString(12, uploadDir);
						pstmt.setInt(13, Integer.parseInt(recId));
						pstmt.executeUpdate();

						//이전파일이 있다면 삭제한다
						mReq.delOldFile(oldFileName);

						checkCode = 4;
					}
				}
			}
		} catch (SQLException ex) {
			ex.printStackTrace();
		} finally {
			JDBC.close(conn, pstmt);
		}
		return checkCode;
	}

	/**
     * popup 삭제
     * 파싱할핑요 없음
     * @param req Request
     * @throws ClassNotFoundException
     */
    public void deletePopup(MRequest mReq, String DATA_ROOT, String uploadDir) throws ClassNotFoundException {
    	Connection conn = null;
    	PreparedStatement pstmt = null;

    	try {
    		conn = JDBC.getConnection();
            
            int indexNum = 0;
            String[] check = mReq.getParameterValues("chkSel"); //같은 이름의 파라미터 "chkSel"
            indexNum = check.length; //배열개수

            for (int i = 0; i < indexNum; i++) {
            	
            	int intCheck = Integer.parseInt(check[i]);
            	
            	//이미지 삭제
            	String imgName = getImageName(intCheck);
            	mReq.setSavePath(DATA_ROOT + uploadDir);
        		mReq.delOldFile(imgName);
                
        		//DB 삭제
                pstmt = conn.prepareStatement("delete from db_popup where pop_idx = ?");
                pstmt.setInt(1, intCheck);
                pstmt.executeUpdate();

            }
            
    		

    	} catch (SQLException ex) {
    		ex.printStackTrace();
    	} finally {
    		JDBC.close(conn, pstmt);
    	}
	}

	/**
     * 사용여부체크
     * @param req Request
     * @throws NumberFormatException
     * @throws ClassNotFoundException
     */
	public void activePopup(Request req) throws
            NumberFormatException, ClassNotFoundException {
		Connection conn = null;
		PreparedStatement pstmt = null;

		try {
			conn = JDBC.getConnection();

            int indexNum = 0;
            String[] check = req.getParameterValues("chkActive"); //같은 이름의 파라미터 "chkActive"
            if (check != null) {
            	indexNum = check.length; //배열개수
            }

            pstmt = conn.prepareStatement("update db_popup set pop_status = '0'");
            pstmt.executeUpdate();

            //체크된 항목 status 를 '1'로 update
            for (int i = 0; i < indexNum; i++) {
            	int intCheck = Integer.parseInt(check[i]);
                pstmt = conn.prepareStatement("update db_popup set pop_status = '1' where pop_idx = ?");
                pstmt.setInt(1, intCheck);
                pstmt.executeUpdate();
            }

        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            JDBC.close(conn, pstmt);
        }
    }
	
	/**
	 * 이미지이름
	 * @param popIdx
	 * @return
	 * @throws ClassNotFoundException
	 */
	public String getImageName(int popIdx) throws ClassNotFoundException {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        String imageName = "";
        try {
            conn = JDBC.getConnection();

            pstmt = conn.prepareStatement("select pop_img_name from db_popup where pop_idx = ?");
            pstmt.setInt(1, popIdx);
            rs = pstmt.executeQuery();

            if (rs.next()) {
            	imageName = rs.getString(1);
            }

        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            JDBC.close(conn, pstmt, rs);
        }

        return imageName;
    }
}
