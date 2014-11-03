package com.maninsoft.smart.homepage.bbs.category;

import com.maninsoft.smart.homepage.request.*;
import com.maninsoft.smart.homepage.jdbc.*;
import java.sql.*;
import java.util.ArrayList;

public class CategoryManager {

    private static CategoryManager instance = new CategoryManager();

    public static CategoryManager getInstance (){
        return instance;
    }

    private CategoryManager() {
    }

	/**
     * 카테고리 리스트(전체)
     * @return ArrayList
     * @throws ClassNotFoundException
     */
	public ArrayList getCategoryList() throws ClassNotFoundException {

		Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        ArrayList categoryList = null;

        try {
            conn = JDBC.getConnection();

            String strSQL = "select cat_idx, cat_id, cat_name, cat_status";
            strSQL       += " from bbs_category";
            strSQL       += " order by cat_id";
            pstmt = conn.prepareStatement(strSQL);
            rs = pstmt.executeQuery();

            categoryList = new ArrayList();

            while (rs.next()) {
                CategoryBean category = new CategoryBean();

                category.setCatIdx(rs.getInt("cat_idx"));
                category.setCatId(rs.getString("cat_id"));
                category.setCatName(rs.getString("cat_name"));
                category.setCatStatus(rs.getString("cat_status"));

                categoryList.add(category);
            }

        } catch (SQLException ex) {
            categoryList = null;
            ex.printStackTrace();
        } finally {
            JDBC.close(conn, pstmt, rs);
        }
        return categoryList;
    }

    /**
     * 카테고리 리스트(사용중)
     * @return ArrayList
     * @throws ClassNotFoundException
     */
	public ArrayList getUseCategoryList() throws ClassNotFoundException {

        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        ArrayList categoryList = null;

        try {
            conn = JDBC.getConnection();

            String strSQL = "select cat_idx, cat_id, cat_name, cat_status";
            strSQL       += " from bbs_category where cat_status = '1'";
            strSQL       += " order by cat_id";

            pstmt = conn.prepareStatement(strSQL);
            rs = pstmt.executeQuery();

            categoryList = new ArrayList();

            while (rs.next()) {
                CategoryBean category = new CategoryBean();

                category.setCatIdx(rs.getInt("cat_idx"));
                category.setCatId(rs.getString("cat_id"));
                category.setCatName(rs.getString("cat_name"));
                category.setCatStatus(rs.getString("cat_status"));

                categoryList.add(category);

            }

        } catch (SQLException ex) {
            categoryList = null;
            ex.printStackTrace();
        } finally {
            JDBC.close(conn, pstmt, rs);
        }
        return categoryList;
    }

    /**
     * 카테고리 등록
     * @param req Request
     * @throws ClassNotFoundException
     */
    public void insertCategory (Request req) throws ClassNotFoundException {
        Connection conn = null;
        PreparedStatement pstmt = null;

        try {
            conn = JDBC.getConnection();

            String strSQL = "insert into bbs_category (cat_id, cat_name)";
            strSQL       += " values (?,?)";

            pstmt = conn.prepareStatement(strSQL);
            pstmt.setString(1, req.getString("id"));
            pstmt.setString(2, req.getString("name"));

            pstmt.executeUpdate();

        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            JDBC.close(conn, pstmt);
        }

    }

    /**
     * 카테고리정보가져오기
     * @param req Request
     * @return CategoryBean
     * @throws ClassNotFoundException
     */
    public CategoryBean getCategory(Request req) throws ClassNotFoundException {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        CategoryBean category = new CategoryBean();

        try {
            conn = JDBC.getConnection();

            String strSQL = "select cat_id, cat_name, cat_status";
            strSQL       += " from bbs_category where cat_idx = ?";
            pstmt = conn.prepareStatement(strSQL);
            pstmt.setInt(1, req.getInt("chkSel"));

            rs = pstmt.executeQuery();

            if (rs.next()) {
                category.setCatId(rs.getString("cat_id"));
                category.setCatName(rs.getString("cat_name"));
                category.setCatStatus(rs.getString("cat_status"));
            }

        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            JDBC.close(conn, pstmt, rs);
        }

        return category;
    }

    /**
     * 카테고리 수정
     * @param req Request
     * @throws ClassNotFoundException
     */
    public void updateCategory(Request req) throws ClassNotFoundException {

        Connection conn = null;
        PreparedStatement pstmt = null;

        try {
            conn = JDBC.getConnection();

            String strSQL = "update bbs_category set cat_id = ?, cat_name = ?";
            strSQL       += " where cat_idx = ?";

            pstmt = conn.prepareStatement(strSQL);

            pstmt.setString(1, req.getString("id"));
            pstmt.setString(2, req.getString("name"));
            pstmt.setInt(3, req.getInt("rec_id"));

            pstmt.executeUpdate();

        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            JDBC.close(conn, pstmt);
        }

    }

    /**
     * 카테고리 삭제
     * @param req Request
     * @throws NumberFormatException
     * @throws ClassNotFoundException
     */
    public void deleteCategory(Request req) throws
            NumberFormatException, ClassNotFoundException {
        Connection conn = null;
        PreparedStatement pstmt = null;

        try {
            conn = JDBC.getConnection();

            int indexNum = 0;

            String[] check = req.getParameterValues("chkSel"); //같은 이름의 파라미터 "chkSel"
            indexNum = check.length; //배열개수

            for (int i = 0; i < indexNum; i++) {
                int intCheck = Integer.parseInt(check[i]);
                pstmt = conn.prepareStatement("delete from bbs_category where cat_idx = ?");
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
     * 사용할 카테고리 선택
     * @param req Request
     * @throws NumberFormatException
     * @throws ClassNotFoundException
     */
    public void activeCategory(Request req) throws NumberFormatException,
            ClassNotFoundException {
        Connection conn = null;
        PreparedStatement pstmt = null;

        try {
            conn = JDBC.getConnection();

            int indexNum = 0;
            String[] check = req.getParameterValues("chkActive"); 
            if (check != null) { 
                indexNum = check.length; 
            }

            pstmt = conn.prepareStatement("update bbs_category set cat_status = '0'");
            pstmt.executeUpdate();

            //체크된 항목 status 를 '1'로 update
            for (int i = 0; i < indexNum; i++) {
                int intCheck = Integer.parseInt(check[i]);
                pstmt = conn.prepareStatement("update bbs_category set cat_status = '1' where cat_idx = ?");
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
     * ID에 해당하는 카테고리이름을 리턴
     * @param catId String
     * @return String
     * @throws ClassNotFoundException
     */
    public String getCategoryName(String catId) throws ClassNotFoundException {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        String categoryName = "";
        try {
            conn = JDBC.getConnection();

            pstmt = conn.prepareStatement("select cat_name from bbs_category where cat_id = ?");
            pstmt.setString(1, catId);
            rs = pstmt.executeQuery();

            if (rs.next()) {
                categoryName = rs.getString(1);
            }

        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            JDBC.close(conn, pstmt, rs);
        }
        return categoryName;
    }

}
