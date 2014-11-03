package com.maninsoft.smart.homepage.admin.db.install;

import com.maninsoft.smart.homepage.request.*;
import com.maninsoft.smart.homepage.jdbc.*;

import java.sql.*;
import java.util.ArrayList;

public class InstallManager {
	
	private static InstallManager instance = new InstallManager();

    public static InstallManager getInstance() {
        return instance;
    }
	
    private InstallManager() {
    }
    
    /**
     * 전체 게시물의 수
     * @param strWhere
     * @return
     * @throws ClassNotFoundException
     */
    public int getInstallListCount(String strWhere) throws ClassNotFoundException {
    	Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        int totalCount = 0;

        try {
            conn = JDBC.getConnection();

            String strSQL = "select count(*) from db_install " + strWhere;
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
     * Install 신청리스트 가져오기(관리자 화면)
     * @param req
     * @param pageSize
     * @param strWhere
     * @param strOrder
     * @return
     * @throws ClassNotFoundException
     */
	public ArrayList getInstallList(Request req, int pageSize, String strWhere, String strOrder) throws ClassNotFoundException {
    	ArrayList insList = null;
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
            	offsetQuery = " where ins_idx not in";
            } else {
            	offsetQuery = " and ins_idx not in";
            }
    		
    		String strSQL = "select top " + pageSize + " ins_idx, ins_company, ins_name, ins_email, ins_hp,";
            strSQL       += " ins_staff_number, ins_user_number, ins_item, ins_business, ins_server_location, ins_network, ins_wdate";
            strSQL       += "     from db_install ";
            strSQL       +=       strWhere;
            strSQL       +=       offsetQuery;
            strSQL       += "     ( ";
            strSQL       += "         select top " + offset + " ins_idx ";
            strSQL       += "         from db_install ";
            strSQL       +=           strWhere;
            strSQL       += "         order by ins_idx desc";
            strSQL       += "     ) "; 
            strSQL       += "     order by ins_idx desc";
    		*/
            String strSQL = "select ins_idx, ins_company, ins_name, ins_email, ins_hp,";
            strSQL       += " ins_staff_number, ins_user_number, ins_item, ins_business, ins_server_location, ins_network, ins_wdate";
            strSQL       += " from db_install" + strWhere + strOrder + " LIMIT " + pageSize + " offset " + offset;
            
    		pstmt = conn.prepareStatement(strSQL);
    		rs = pstmt.executeQuery();

    		insList = new ArrayList();

    		while (rs.next()) {
    			InstallBean insInfo = new InstallBean();

    			insInfo.setInsIdx(rs.getInt("ins_idx"));
    			insInfo.setInsCompany(rs.getString("ins_company"));
    			insInfo.setInsName(rs.getString("ins_name"));
    			insInfo.setInsEmail(rs.getString("ins_email"));
    			insInfo.setInsHp(rs.getString("ins_hp"));
    			insInfo.setInsStaffNumber(rs.getInt("ins_staff_number"));
    			insInfo.setInsUserNumber(rs.getInt("ins_user_number"));
    			insInfo.setInsItem(rs.getString("ins_item"));
    			insInfo.setInsBusiness(rs.getString("ins_business"));
    			insInfo.setInsServerLocation(rs.getString("ins_server_location"));
    			insInfo.setInsNetwork(rs.getString("ins_network"));
    			insInfo.setInsWdate(rs.getTimestamp("ins_wdate"));

    			insList.add(insInfo);
    		}

    	} catch (SQLException ex) {
    		insList = null;
    		ex.printStackTrace();
    	} finally {
    		JDBC.close(conn, pstmt, rs);
    	}
    	return insList;
	}
	
	/**
     * 설치신청 insert
     * @param req Request
     * @throws ClassNotFoundException
     */
    public void insertInstall(Request req) throws ClassNotFoundException {
        Connection conn = null;
        PreparedStatement pstmt = null;

        try {
            conn = JDBC.getConnection();

            String strSQL = "insert into db_install";
            strSQL       += " (ins_company, ins_name, ins_email, ins_hp, ins_staff_number, ins_user_number,";
            strSQL       += " ins_item, ins_business, ins_server_location, ins_network)";
            strSQL       += " values (?,?,?,?,?,?,?,?,?,?)";
            
            pstmt = conn.prepareStatement(strSQL);
            pstmt.setString(1, req.getString("company"));
            pstmt.setString(2, req.getString("name"));
            pstmt.setString(3, req.getString("email"));
            pstmt.setString(4, req.getString("hp"));
            pstmt.setInt(5, req.getInt("staff_number"));
            pstmt.setInt(6, req.getInt("user_number"));
            pstmt.setString(7, req.getString("item"));
            pstmt.setString(8, req.getString("business"));
            pstmt.setString(9, req.getString("server_location"));
            pstmt.setString(10, req.getString("network"));
            
            pstmt.executeUpdate();

        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            JDBC.close(conn, pstmt);
        }
    }
    
    /**
     * 설치신청 정보
     * @param strInsIdx
     * @return
     * @throws ClassNotFoundException
     */
    public InstallBean getInstall(String strInsIdx) throws ClassNotFoundException {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
            conn = JDBC.getConnection();

            String strSQL = "select ins_idx, ins_company, ins_name, ins_email, ins_hp,";
            strSQL += " ins_staff_number, ins_user_number, ins_item, ins_business, ins_server_location, ins_network";
            strSQL += " from db_install where ins_idx = ?";

            pstmt = conn.prepareStatement(strSQL);
            pstmt.setInt(1, Integer.parseInt(strInsIdx));
            rs = pstmt.executeQuery();

            if (rs.next()) {
                InstallBean install = new InstallBean();
                install.setInsIdx(rs.getInt("ins_idx"));
                install.setInsCompany(rs.getString("ins_company"));
                install.setInsName(rs.getString("ins_name"));
                install.setInsEmail(rs.getString("ins_email"));
                install.setInsHp(rs.getString("ins_hp"));
                install.setInsStaffNumber(rs.getInt("ins_staff_number"));
                install.setInsUserNumber(rs.getInt("ins_user_number"));
                install.setInsItem(rs.getString("ins_item"));
                install.setInsBusiness(rs.getString("ins_business"));
                install.setInsServerLocation(rs.getString("ins_server_location"));
                install.setInsNetwork(rs.getString("ins_network"));

                return install;

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
     * @param strInsIdx
     * @throws ClassNotFoundException
     */
    public void updateInstall(Request req, String strInsIdx) throws
		ClassNotFoundException {
		Connection conn = null;
		PreparedStatement pstmt = null;

		try {
		    conn = JDBC.getConnection();
		
		    String strSQL = "update db_install set";
		    strSQL +=       " ins_company=?, ins_name=?, ins_email=?, ins_hp=?,";
		    strSQL +=       " ins_staff_number=?, ins_user_number=?, ins_item=?,";
		    strSQL +=       " ins_business=?, ins_server_location=?, ins_network=?";
		    strSQL +=       " where ins_idx = ?";
		
		    pstmt = conn.prepareStatement(strSQL);
		
		    pstmt.setString(1, req.getString("company"));
		    pstmt.setString(2, req.getString("name"));
		    pstmt.setString(3, req.getString("email"));
		    pstmt.setString(4, req.getString("hp"));
		    pstmt.setInt(5, req.getInt("staff_number"));
		    pstmt.setInt(6, req.getInt("user_number"));
		    pstmt.setString(7, req.getString("item"));
		    pstmt.setString(8, req.getString("business"));
		    pstmt.setString(9, req.getString("server_location"));
		    pstmt.setString(10, req.getString("network"));
		    pstmt.setInt(11, Integer.parseInt(strInsIdx));
		
		    pstmt.executeUpdate();
		
		} catch (SQLException ex) {
		    ex.printStackTrace();
		} finally {
		    JDBC.close(conn, pstmt);
		}
    }
    
    /**
     * 설치신청 삭제
     * @param req
     * @throws NumberFormatException
     * @throws ClassNotFoundException
     */
    public void deleteInstall(Request req) throws
		NumberFormatException, ClassNotFoundException {
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
		    conn = JDBC.getConnection();
		    String[] check = req.getParameterValues("chkSel");
		    for (int i = 0; i < check.length; i++) {
		        pstmt = conn.prepareStatement("delete from db_install where ins_idx = ?");
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
