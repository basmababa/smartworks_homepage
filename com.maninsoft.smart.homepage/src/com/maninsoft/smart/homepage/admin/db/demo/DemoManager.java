package com.maninsoft.smart.homepage.admin.db.demo;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.maninsoft.smart.homepage.jdbc.JDBC;
import com.maninsoft.smart.homepage.request.*;

public class DemoManager {
	private static DemoManager instance = new DemoManager();

    public static DemoManager getInstance() {
        return instance;
    }
	
    private DemoManager() {
    }
    
    /**
     * 전체 게시물의 수
     * @param strWhere
     * @return
     * @throws ClassNotFoundException
     */
    public int getDemoListCount(String strWhere) throws ClassNotFoundException {
    	Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        int totalCount = 0;

        try {
            conn = JDBC.getConnection();

            String strSQL = "select count(*) from db_demo " + strWhere;
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
     * Demo 신청리스트 가져오기(관리자 화면)
     * @param req
     * @param pageSize
     * @param strWhere
     * @param strOrder
     * @return
     * @throws ClassNotFoundException
     */
	public ArrayList getDemoList(Request req, int pageSize, String strWhere, String strOrder) throws ClassNotFoundException {
    	ArrayList demList = null;
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
            	offsetQuery = " where dem_idx not in";
            } else {
            	offsetQuery = " and dem_idx not in";
            }
    		
    		String strSQL = "select top " + pageSize + " dem_idx, dem_company, dem_name, dem_email, dem_hp,";
            strSQL       += " dem_staff_number, dem_user_number, dem_item, dem_business, dem_wdate";
            strSQL       += "     from db_demo ";
            strSQL       +=       strWhere;
            strSQL       +=       offsetQuery;
            strSQL       += "     ( ";
            strSQL       += "         select top " + offset + " dem_idx ";
            strSQL       += "         from db_demo ";
            strSQL       +=           strWhere;
            strSQL       += "         order by dem_idx desc";
            strSQL       += "     ) "; 
            strSQL       += "     order by dem_idx desc";
    		*/
            String strSQL = "select dem_idx, dem_company, dem_name, dem_email, dem_hp,";
            strSQL       += " dem_staff_number, dem_user_number, dem_item, dem_business, dem_wdate";
            strSQL       += " from db_demo" + strWhere + strOrder + " LIMIT " + pageSize + " offset " + offset;
            
    		pstmt = conn.prepareStatement(strSQL);
    		rs = pstmt.executeQuery();

    		demList = new ArrayList();

    		while (rs.next()) {
    			DemoBean demInfo = new DemoBean();

    			demInfo.setDemIdx(rs.getInt("dem_idx"));
    			demInfo.setDemCompany(rs.getString("dem_company"));
    			demInfo.setDemName(rs.getString("dem_name"));
    			demInfo.setDemEmail(rs.getString("dem_email"));
    			demInfo.setDemHp(rs.getString("dem_hp"));
    			demInfo.setDemStaffNumber(rs.getInt("dem_staff_number"));
    			demInfo.setDemUserNumber(rs.getInt("dem_user_number"));
    			demInfo.setDemItem(rs.getString("dem_item"));
    			demInfo.setDemBusiness(rs.getString("dem_business"));
    			demInfo.setDemWdate(rs.getTimestamp("dem_wdate"));

    			demList.add(demInfo);
    		}

    	} catch (SQLException ex) {
    		demList = null;
    		ex.printStackTrace();
    	} finally {
    		JDBC.close(conn, pstmt, rs);
    	}
    	return demList;
	}
	
	/**
     * 설치신청 insert
     * @param req Request
     * @throws ClassNotFoundException
     */
    public void insertDemo(Request req) throws ClassNotFoundException {
        Connection conn = null;
        PreparedStatement pstmt = null;

        try {
            conn = JDBC.getConnection();

            String strSQL = "insert into db_demo";
            strSQL       += " (dem_company, dem_name, dem_email, dem_hp, dem_staff_number, dem_user_number,";
            strSQL       += " dem_item, dem_business)";
            strSQL       += " values (?,?,?,?,?,?,?,?)";
            
            pstmt = conn.prepareStatement(strSQL);
            pstmt.setString(1, req.getString("company"));
            pstmt.setString(2, req.getString("name"));
            pstmt.setString(3, req.getString("email"));
            pstmt.setString(4, req.getString("hp"));
            pstmt.setInt(5, req.getInt("staff_number"));
            pstmt.setInt(6, req.getInt("user_number"));
            pstmt.setString(7, req.getString("item"));
            pstmt.setString(8, req.getString("business"));
            
            pstmt.executeUpdate();

        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            JDBC.close(conn, pstmt);
        }
    }
    
    /**
     * 설치신청 정보
     * @param strDemIdx
     * @return
     * @throws ClassNotFoundException
     */
    public DemoBean getDemo(String strDemIdx) throws ClassNotFoundException {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
            conn = JDBC.getConnection();

            String strSQL = "select dem_idx, dem_company, dem_name, dem_email, dem_hp,";
            strSQL += " dem_staff_number, dem_user_number, dem_item, dem_business";
            strSQL += " from db_demo where dem_idx = ?";

            pstmt = conn.prepareStatement(strSQL);
            pstmt.setInt(1, Integer.parseInt(strDemIdx));
            rs = pstmt.executeQuery();

            if (rs.next()) {
                DemoBean demInfo = new DemoBean();
                demInfo.setDemIdx(rs.getInt("dem_idx"));
                demInfo.setDemCompany(rs.getString("dem_company"));
                demInfo.setDemName(rs.getString("dem_name"));
                demInfo.setDemEmail(rs.getString("dem_email"));
                demInfo.setDemHp(rs.getString("dem_hp"));
                demInfo.setDemStaffNumber(rs.getInt("dem_staff_number"));
                demInfo.setDemUserNumber(rs.getInt("dem_user_number"));
                demInfo.setDemItem(rs.getString("dem_item"));
                demInfo.setDemBusiness(rs.getString("dem_business"));

                return demInfo;

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
     * 설치신청정보 수정
     * @param req
     * @param strDemIdx
     * @throws ClassNotFoundException
     */
    public void updateDemo(Request req, String strDemIdx) throws
		ClassNotFoundException {
		Connection conn = null;
		PreparedStatement pstmt = null;

		try {
		    conn = JDBC.getConnection();
		
		    String strSQL = "update db_demo set";
		    strSQL +=       " dem_company=?, dem_name=?, dem_email=?, dem_hp=?,";
		    strSQL +=       " dem_staff_number=?, dem_user_number=?, dem_item=?, dem_business=?";
		    strSQL +=       " where dem_idx = ?";
		
		    pstmt = conn.prepareStatement(strSQL);
		
		    pstmt.setString(1, req.getString("company"));
		    pstmt.setString(2, req.getString("name"));
		    pstmt.setString(3, req.getString("email"));
		    pstmt.setString(4, req.getString("hp"));
		    pstmt.setInt(5, req.getInt("staff_number"));
		    pstmt.setInt(6, req.getInt("user_number"));
		    pstmt.setString(7, req.getString("item"));
		    pstmt.setString(8, req.getString("business"));
		    pstmt.setInt(9, Integer.parseInt(strDemIdx));
		
		    pstmt.executeUpdate();
		
		} catch (SQLException ex) {
		    ex.printStackTrace();
		} finally {
		    JDBC.close(conn, pstmt);
		}
    }
    
    /**
     * 데모신청 삭제
     * @param req
     * @throws NumberFormatException
     * @throws ClassNotFoundException
     */
    public void deleteDemo(Request req) throws
		NumberFormatException, ClassNotFoundException {
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
		    conn = JDBC.getConnection();
		    String[] check = req.getParameterValues("chkSel");
		    for (int i = 0; i < check.length; i++) {
		        pstmt = conn.prepareStatement("delete from db_demo where dem_idx = ?");
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
