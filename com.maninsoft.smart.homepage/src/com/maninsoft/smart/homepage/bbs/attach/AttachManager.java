package com.maninsoft.smart.homepage.bbs.attach;

import com.maninsoft.smart.homepage.request.*;
import com.maninsoft.smart.homepage.jdbc.*;
import java.util.ArrayList;
import java.sql.*;
import java.io.*;

public class AttachManager {
	
	private static AttachManager instance = new AttachManager();

	public static AttachManager getInstance () {
		return instance;
	}

	private AttachManager() {
	}
	
	/**
     * 해당게시물의 파일개수 리턴
     * @param intBbsId String
     * @param MAS_BBS_ID String
     * @return int
     * @throws ClassNotFoundException
     */
    public int getAttachCount(int intBbsId, String MAS_BBS_ID) throws
            ClassNotFoundException {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        int totalCount = 0;

        try {
            conn = JDBC.getConnection();

            String strSQL = "select count(*) from bbs_attach where bbs_id = ? and mas_bbs_id = ?";
            pstmt = conn.prepareStatement(strSQL);
            pstmt.setInt(1, intBbsId);
            pstmt.setString(2, MAS_BBS_ID);

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
     * 파일 리스트 (BBS View)
     * @param req Request
     * @param MAS_BBS_ID String
     * @return ArrayList
     * @throws ClassNotFoundException
     */
	public ArrayList getSimpleFileList(Request req, String MAS_BBS_ID) throws ClassNotFoundException {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        ArrayList fileList = null;
        
        try {
            conn = JDBC.getConnection();

            String strQuery = "select ach_idx, ach_file_name, ach_file_path, ach_file_size";
            strQuery +=       " from bbs_attach where bbs_id=? and mas_bbs_id = ?";
            pstmt = conn.prepareStatement(strQuery);
            
            pstmt.setInt(1, req.getInt("bbsId"));
            pstmt.setString(2, MAS_BBS_ID);
            
            rs = pstmt.executeQuery();
            fileList = new ArrayList();

            while (rs.next()) {
            	AttachBean attachInfo = new AttachBean();
                attachInfo.setAchIdx(rs.getInt(1));
                attachInfo.setAchFileName(rs.getString(2));
                attachInfo.setAchFilePath(rs.getString(3));
                attachInfo.setAchFileSize(rs.getString(4));
                fileList.add(attachInfo);
            }
        } catch (SQLException ex) {
            fileList = null;
            ex.printStackTrace();
        } finally {
            JDBC.close(conn, pstmt, rs);
        }
        return fileList;
    }
	
	/**
	 * 파일 다운로드를 위한 기본 정보 검색(서블릿페이지에서 호출)
	 * @param achIdx
	 * @param DATA_ROOT
	 * @param MAS_BBS_ID
	 * @return
	 */
	public AttachBean findByID(int achIdx, String DATA_ROOT, String MAS_BBS_ID) {
		AttachBean fileInfo = null;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			conn = JDBC.getConnection();
			pstmt = conn.prepareStatement("select * from bbs_attach where ach_idx=?");
			pstmt.setInt(1, achIdx);
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				fileInfo = new AttachBean();
				fileInfo.setAchIdx(rs.getInt("ach_idx"));
				String realFilePath = DATA_ROOT + "/BBS/" + MAS_BBS_ID;
				fileInfo.setAchFilePath(realFilePath);
				fileInfo.setAchFileName(rs.getString("ach_file_name"));
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			JDBC.close(conn, pstmt, rs);
		}
		return fileInfo;
	}
	
	/**
     * 게시물 삭제시 파일이 있다면 파일을 삭제해야한다.
     * @param mReq MRequest
     * @param MAS_BBS_ID String
     * @param strBbsId String
     * @throws ClassNotFoundException
     */
	public void deleteFiles(MRequest mReq, String DATA_ROOT, String MAS_BBS_ID, String strBbsId) throws
            ClassNotFoundException {
		Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
        	conn = JDBC.getConnection();

        	//파일의 저장위치를 Setting
        	mReq.setSavePath(DATA_ROOT + "/BBS/" + MAS_BBS_ID + "/");

        	try {
        		mReq.parse();
        	} catch (IOException ex) {
        		ex.printStackTrace();
        	}

            String strQuery = "select ach_file_name from bbs_attach where bbs_id = ? and mas_bbs_id = ?";
            pstmt = conn.prepareStatement(strQuery);
            pstmt.setInt(1, Integer.parseInt(strBbsId));
            pstmt.setString(2, MAS_BBS_ID);

            String thumbNailDir = DATA_ROOT + "/BBS/" + MAS_BBS_ID + "/thumbnail/";
            String midThumbNailDir = DATA_ROOT + "/BBS/" + MAS_BBS_ID + "/mid_thumbnail/";
            
            rs = pstmt.executeQuery();
            while (rs.next()) {
                String oldFileName = rs.getString("ach_file_name");
                //파일의 저장위치를 Setting (삭제)
                mReq.setSavePath(DATA_ROOT + "/BBS/" + MAS_BBS_ID + "/");
                mReq.delOldFile(oldFileName);
                
                //ThumbNail파일의 저장위치를 Setting (삭제)
                mReq.setSavePath(thumbNailDir);
                String strThumbNail = oldFileName.substring(0,oldFileName.lastIndexOf(".")) + "_thumb.jpg";
                mReq.delOldFile(strThumbNail);
                
                //MidThumbNail파일의 저장위치를 Setting (삭제)
                mReq.setSavePath(midThumbNailDir);
                String strMidThumbNail = oldFileName.substring(0,oldFileName.lastIndexOf(".")) + "_thumb.jpg";
                mReq.delOldFile(strMidThumbNail);
            }

            //bbs_attach 의 파일정보 삭제
            try {
                String strSQL = "delete from bbs_attach where bbs_id = ? and mas_bbs_id = ?";
                pstmt = conn.prepareStatement(strSQL);
                pstmt.setInt(1, Integer.parseInt(strBbsId));
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

    /**
     * 파일 인덱스에해당하는 파일정보를 가져온다(이미지 View용)
     * @param potoId String
     * @return AttachBean
     * @throws ClassNotFoundException
     */
	public AttachBean getImgInfo(String potoId) throws
            ClassNotFoundException {
		Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        AttachBean attach = new AttachBean();

        try {
            conn = JDBC.getConnection();
            String strSQL = "Select ach_file_name, ach_file_path, ach_file_size from bbs_attach where ach_idx = ?";
            pstmt = conn.prepareStatement(strSQL);
            pstmt.setInt(1, Integer.parseInt(potoId));
            
            rs = pstmt.executeQuery();
            if (rs.next()) {
                attach.setAchFileName(rs.getString(1));
                attach.setAchFilePath(rs.getString(2));
                attach.setAchFileSize(rs.getString(3));
            }

        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            JDBC.close(conn, pstmt, rs);
        }
        return attach;
    }

}
