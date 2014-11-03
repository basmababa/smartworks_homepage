package com.maninsoft.smart.homepage.admin.db.contact;

import com.maninsoft.smart.homepage.request.*;
import com.maninsoft.smart.homepage.admin.db.install.InstallBean;
import com.maninsoft.smart.homepage.jdbc.*;

import java.sql.*;
import java.util.ArrayList;

public class ContactManager {
	
	private static ContactManager instance = new ContactManager();

    public static ContactManager getInstance() {
        return instance;
    }
	
    private ContactManager() {
    }
	
    /**
     * 전체 게시물의 수
     * @param strWhere
     * @return
     * @throws ClassNotFoundException
     */
    public int getContactListCount(String strWhere) throws ClassNotFoundException {
    	Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        int totalCount = 0;

        try {
            conn = JDBC.getConnection();

            String strSQL = "select count(*) from db_contact " + strWhere;
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
     * 제휴문의 리스트(관리자 화면)
     * @param req
     * @param pageSize
     * @param strWhere
     * @param strOrder
     * @return
     * @throws ClassNotFoundException
     */
	public ArrayList getContactList(Request req, int pageSize, String strWhere, String strOrder) throws ClassNotFoundException {
    	ArrayList conList = null;
    	Connection conn = null;
    	PreparedStatement pstmt = null;
    	ResultSet rs = null;

    	try {
    		conn = JDBC.getConnection();
    		    		
    		int curPage = 1;
            
            if (req.getString("page") != null) {
                curPage = req.getInt("page");
            }
            
            int offset = pageSize * (curPage - 1); //시작 레코드 번호
            /*
            String offsetQuery = "";
            if (strWhere.equals("")) {
            	offsetQuery = " where con_idx not in";
            } else {
            	offsetQuery = " and con_idx not in";
            }
    		
    		String strSQL = "select top " + pageSize + " con_idx, con_title, con_company, con_name,";
            strSQL       += "  con_hp, con_email, con_contents, con_wdate";
            strSQL       += "     from db_contact ";
            strSQL       +=       strWhere;
            strSQL       +=       offsetQuery;
            strSQL       += "     ( ";
            strSQL       += "         select top " + offset + " con_idx ";
            strSQL       += "         from db_contact ";
            strSQL       +=           strWhere;
            strSQL       += "         order by con_idx desc";
            strSQL       += "     ) "; 
            strSQL       += "     order by con_idx desc";
    		*/
            String strSQL = "select con_idx, con_title, con_company, con_name,";
            strSQL       += " con_hp, con_email, con_contents, con_wdate";
            strSQL       += " from db_contact" + strWhere + strOrder + " LIMIT " + pageSize + " offset " + offset;
            
    		pstmt = conn.prepareStatement(strSQL);
    		rs = pstmt.executeQuery();

    		conList = new ArrayList();

    		while (rs.next()) {
    			ContactBean contactInfo = new ContactBean();

    			contactInfo.setConIdx(rs.getInt("con_idx"));
    			contactInfo.setConTitle(rs.getString("con_title"));
    			contactInfo.setConCompany(rs.getString("con_company"));
    			contactInfo.setConName(rs.getString("con_name"));
    			contactInfo.setConHp(rs.getString("con_hp"));
    			contactInfo.setConEmail(rs.getString("con_email"));
    			contactInfo.setConContents(rs.getString("con_contents"));
    			contactInfo.setConWdate(rs.getTimestamp("con_wdate"));
    			
    			conList.add(contactInfo);
    		}

    	} catch (SQLException ex) {
    		conList = null;
    		ex.printStackTrace();
    	} finally {
    		JDBC.close(conn, pstmt, rs);
    	}
    	return conList;
	}
    
    /**
     * 제휴문의 Insert
     * @param req
     * @throws ClassNotFoundException
     */
    public void insertContact(Request req) throws ClassNotFoundException {
        Connection conn = null;
        PreparedStatement pstmt = null;

        try {
            conn = JDBC.getConnection();

            String strSQL = "insert into db_contact";
            strSQL       += " (con_title, con_company, con_name, con_hp, con_email, con_contents)";
            strSQL       += " values (?,?,?,?,?,?)";
            
            pstmt = conn.prepareStatement(strSQL);
            pstmt.setString(1, req.getString("title"));
            pstmt.setString(2, req.getString("company"));
            pstmt.setString(3, req.getString("name"));
            pstmt.setString(4, req.getString("hp"));
            pstmt.setString(5, req.getString("email"));
            pstmt.setString(6, req.getString("contents"));

            pstmt.executeUpdate();

        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            JDBC.close(conn, pstmt);
        }
    }
    
    /**
     * 제휴문의 정보
     * @param strConIdx
     * @return
     * @throws ClassNotFoundException
     */
    public ContactBean getContact(String strConIdx) throws ClassNotFoundException {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
            conn = JDBC.getConnection();

            String strSQL = "select con_idx, con_title, con_company, con_name, con_hp, con_email, con_contents";
            strSQL += " from db_contact where con_idx = ?";

            pstmt = conn.prepareStatement(strSQL);
            pstmt.setInt(1, Integer.parseInt(strConIdx));
            rs = pstmt.executeQuery();

            if (rs.next()) {
                ContactBean contact = new ContactBean();
                
                contact.setConIdx(rs.getInt("con_idx"));
                contact.setConTitle(rs.getString("con_title"));
                contact.setConCompany(rs.getString("con_company"));
                contact.setConName(rs.getString("con_name"));
                contact.setConHp(rs.getString("con_hp"));
                contact.setConEmail(rs.getString("con_email"));
                contact.setConContents(rs.getString("con_contents"));
               
                return contact;

            } else {
                return null;
            }

        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            JDBC.close(conn, pstmt, rs);
        }
        return null;
    }
    
    /**
     * 제휴문의정보 수정
     * @param req
     * @param strConIdx
     * @throws ClassNotFoundException
     */
    public void updateContact(Request req, String strConIdx) throws
		ClassNotFoundException {
		Connection conn = null;
		PreparedStatement pstmt = null;

		try {
		    conn = JDBC.getConnection();
		
		    String strSQL = "update db_contact set";
		    strSQL +=       " con_title=?, con_company=?, con_name=?, con_hp=?,";
		    strSQL +=       " con_email=?, con_contents=?";
		    strSQL +=       " where con_idx = ?";
		
		    pstmt = conn.prepareStatement(strSQL);
		
		    pstmt.setString(1, req.getString("title"));
		    pstmt.setString(2, req.getString("company"));
		    pstmt.setString(3, req.getString("name"));
		    pstmt.setString(4, req.getString("hp"));
		    pstmt.setString(5, req.getString("email"));
		    pstmt.setString(6, req.getString("contents"));
		    pstmt.setInt(7, Integer.parseInt(strConIdx));
		
		    pstmt.executeUpdate();
		
		} catch (SQLException ex) {
		    ex.printStackTrace();
		} finally {
		    JDBC.close(conn, pstmt);
		}
    }
    
    /**
     * 제휴문의 삭제
     * @param req
     * @throws NumberFormatException
     * @throws ClassNotFoundException
     */
    public void deleteContact(Request req) throws
		NumberFormatException, ClassNotFoundException {
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
		    conn = JDBC.getConnection();
		    String[] check = req.getParameterValues("chkSel");
		    for (int i = 0; i < check.length; i++) {
		        pstmt = conn.prepareStatement("delete from db_contact where con_idx = ?");
		        pstmt.setInt(1, Integer.parseInt(check[i]));
		        pstmt.executeUpdate();
		    }
		
		} catch (SQLException ex) {
		    ex.printStackTrace();
		} finally {
		    JDBC.close(conn, pstmt);
		}
    }
}
