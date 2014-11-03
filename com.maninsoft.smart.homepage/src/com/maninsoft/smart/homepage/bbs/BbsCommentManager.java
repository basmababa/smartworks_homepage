package com.maninsoft.smart.homepage.bbs;

import com.maninsoft.smart.homepage.request.*;
import com.maninsoft.smart.homepage.jdbc.*;

import java.sql.*;
import java.util.ArrayList;

public class BbsCommentManager {
	private static BbsCommentManager instance = new BbsCommentManager();

    public static BbsCommentManager getInstance () {
        return instance;
    }

    private BbsCommentManager() {
    }
    
	/**
     * 해당 게시물의 댓글개수
     * @param intBbsId int
     * @param MAS_BBS_ID String
     * @return int
     * @throws ClassNotFoundException
     */
	public int getCommentCount(int intBbsId, String MAS_BBS_ID) throws
             ClassNotFoundException {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		int totalCount = 0;

		try {
			conn = JDBC.getConnection();

			String strSQL = "select count(*) from bbs_multi_board_comment where bbs_id = ? and mas_bbs_id = ?";
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
	 * 댓글 리스트
	 * @param strBbsId
	 * @param MAS_BBS_ID String
	 * @return ArrayList
	 * @throws ClassNotFoundException
	 */
	public ArrayList listComment(String strBbsId, String MAS_BBS_ID) throws
		ClassNotFoundException {
	
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList commentList = null;

		try {
			conn = JDBC.getConnection();

			String strSQL = "select cmt_idx, cmt_usr_id, cmt_usr_name, cmt_contents, cmt_wdate";
			strSQL       += " from bbs_multi_board_comment where bbs_id = ? and mas_bbs_id = ?";
			strSQL       += " order by cmt_wdate asc";

			pstmt = conn.prepareStatement(strSQL);
			pstmt.setInt(1, Integer.parseInt(strBbsId));
			pstmt.setString(2, MAS_BBS_ID);

			rs = pstmt.executeQuery();
			commentList = new ArrayList();

			while (rs.next()) {
				BbsCommentBean commentInfo = new BbsCommentBean();
				commentInfo.setCmtIdx(rs.getInt("cmt_idx"));
				commentInfo.setCmtUsrID(rs.getString("cmt_usr_id"));
				commentInfo.setCmtUsrName(rs.getString("cmt_usr_name"));
				commentInfo.setCmtContents(rs.getString("cmt_contents"));
				commentInfo.setCmtWdate(rs.getTimestamp("cmt_wdate"));
				commentList.add(commentInfo);
			}

		} catch (SQLException ex) {
			commentList = null;
			ex.printStackTrace();
		} finally {
			JDBC.close(conn, pstmt, rs);
		}
		return commentList;
	}
	
	/**
     * 댓글 쓰기
     * @param req Request
     * @return int
     * @throws ClassNotFoundException
     */
	public int writeComment (Request req) throws ClassNotFoundException {
		Connection conn = null;
		PreparedStatement pstmt = null;

		int checkCode = 0;

		try {
			conn = JDBC.getConnection();

			String strQuery = "insert into bbs_multi_board_comment";
			strQuery       += " (bbs_id, cmt_usr_id, cmt_usr_name, cmt_usr_pass, cmt_contents, mas_bbs_id)";
			strQuery       += " values (?,?,?,?,?,?)";

			pstmt = conn.prepareStatement(strQuery);
			pstmt.setInt(1, req.getInt("bbsId"));
			pstmt.setString(2, req.getString("userId"));
			pstmt.setString(3, req.getString("userName"));
			pstmt.setString(4, req.getString("userPass"));
			pstmt.setString(5, req.getString("comment"));
			pstmt.setString(6, req.getString("masBbsId"));

			pstmt.executeUpdate();
			
		} catch (SQLException ex) {
			ex.printStackTrace();
		} finally {
			JDBC.close(conn, pstmt);
		}
		return checkCode;
	}
	
	/**
     * 댓글삭제 (no Password)
     * @param req Request
     * @throws ClassNotFoundException
     */
    public void deleteComment(Request req) throws ClassNotFoundException {
         Connection conn = null;
         PreparedStatement pstmt = null;

         try {
        	 conn = JDBC.getConnection();

        	 String delQuery = "delete from bbs_multi_board_comment";
        	 delQuery += " where cmt_idx = ?";

        	 pstmt = conn.prepareStatement(delQuery);
        	 pstmt.setInt(1, req.getInt("commentId"));
        	 pstmt.executeUpdate();

         } catch (SQLException ex) {
             ex.printStackTrace();
         } finally {
             JDBC.close(conn, pstmt);
         }
    }

	/**
	 * 댓글 삭제 (패스워드비교)
	 * checkOk (0 : 패스워드불일치 , 1: 패스워드일치 삭제성공)
	 * @param req Request
	 * @return int
	 * @throws ClassNotFoundException
	 */
	public int checkCommentPass(Request req) throws ClassNotFoundException {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		int checkOk = 0;
		try {
			conn = JDBC.getConnection();

			String strQuery = "select cmt_idx, cmt_usr_id from bbs_multi_board_comment";
			strQuery += " where cmt_idx = ? and cmt_usr_pass = ?";
			pstmt = conn.prepareStatement(strQuery);
			pstmt.setInt(1, req.getInt("commentId"));
			pstmt.setString(2, req.getString("commentPass"));

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
		return checkOk;
    }
	
	/**
	 * Comment Write UserId
	 * @param req
	 * @return
	 * @throws ClassNotFoundException
	 */
    public String getUserId(Request req) throws ClassNotFoundException {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        String strUserId = "";
        try {
            conn = JDBC.getConnection();

            pstmt = conn.prepareStatement("select cmt_usr_id from bbs_multi_board_comment where cmt_idx = ?");
            pstmt.setInt(1, req.getInt("commentId"));
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
}
