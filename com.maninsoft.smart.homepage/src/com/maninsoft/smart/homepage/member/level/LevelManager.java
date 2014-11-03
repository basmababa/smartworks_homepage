package com.maninsoft.smart.homepage.member.level;

import com.maninsoft.smart.homepage.request.*;
import com.maninsoft.smart.homepage.jdbc.*;
import java.sql.*;
import java.util.ArrayList;

public class LevelManager {

    private static LevelManager instance = new LevelManager();

    public static LevelManager getInstance (){
        return instance;
    }

    private LevelManager() {
    }

    /**
     * 회원등급 리스트(전체)
     * @return ArrayList
     * @throws ClassNotFoundException
     */
	public ArrayList getLevelList() throws ClassNotFoundException {
        ArrayList levelList = null;
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
            conn = JDBC.getConnection();

            String strSQL = "select lev_idx, lev_id, lev_name, lev_status";
            strSQL += " from usr_level";
            strSQL += " order by lev_id";
            pstmt = conn.prepareStatement(strSQL);
            rs = pstmt.executeQuery();

            levelList = new ArrayList();

            while (rs.next()) {
                LevelBean levelInfo = new LevelBean();

                levelInfo.setLevIdx(rs.getInt("lev_idx"));
                levelInfo.setLevId(rs.getString("lev_id"));
                levelInfo.setLevName(rs.getString("lev_name"));
                levelInfo.setLevStatus(rs.getString("lev_status"));

                levelList.add(levelInfo);
            }

        } catch (SQLException ex) {
            levelList = null;
            ex.printStackTrace();
        } finally {
            JDBC.close(conn, pstmt, rs);
        }
        return levelList;
    }

    /**
     * 회원등급 리스트(사용중)
     * @return ArrayList
     * @throws ClassNotFoundException
     */
    public ArrayList getUseLevelList() throws ClassNotFoundException {
        ArrayList levelList = null;
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
            conn = JDBC.getConnection();

            String strSQL = "select lev_idx, lev_id, lev_name, lev_status";
            strSQL += " from usr_level where lev_status = '1'";
            strSQL += " order by lev_id";
            pstmt = conn.prepareStatement(strSQL);
            rs = pstmt.executeQuery();

            levelList = new ArrayList();

            while (rs.next()) {
                LevelBean levelInfo = new LevelBean();

                levelInfo.setLevIdx(rs.getInt("lev_idx"));
                levelInfo.setLevId(rs.getString("lev_id"));
                levelInfo.setLevName(rs.getString("lev_name"));
                levelInfo.setLevStatus(rs.getString("lev_status"));

                levelList.add(levelInfo);
            }

        } catch (SQLException ex) {
            levelList = null;
            ex.printStackTrace();
        } finally {
            JDBC.close(conn, pstmt, rs);
        }
        return levelList;
    }

    /**
     * BBS 관리용 레벨 리스트
     * @return ArrayList
     * @throws ClassNotFoundException
     */
    public ArrayList getBbsLevelList() throws ClassNotFoundException {
        ArrayList levelList = null;
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
            conn = JDBC.getConnection();

            String strSQL = "select lev_idx, lev_id, lev_name, lev_status";
            strSQL +=       " from usr_level where lev_id != '999' and lev_status = '1'";
            strSQL +=       " order by lev_id";
            pstmt = conn.prepareStatement(strSQL);
            rs = pstmt.executeQuery();

            levelList = new ArrayList();

            while (rs.next()) {
                LevelBean levelInfo = new LevelBean();

                levelInfo.setLevIdx(rs.getInt("lev_idx"));
                levelInfo.setLevId(rs.getString("lev_id"));
                levelInfo.setLevName(rs.getString("lev_name"));
                levelInfo.setLevStatus(rs.getString("lev_status"));

                levelList.add(levelInfo);
            }

        } catch (SQLException ex) {
            levelList = null;
            ex.printStackTrace();
        } finally {
            JDBC.close(conn, pstmt, rs);
        }
        return levelList;
    }

    /**
     * 회원등급 등록
     * @param req Request
     * @throws ClassNotFoundException
     */
    public void insertLevel(Request req) throws ClassNotFoundException {
        Connection conn = null;
        PreparedStatement pstmt = null;

        try {
            conn = JDBC.getConnection();

            String strSQL = "insert into usr_level(lev_id, lev_name)";
            strSQL += " values (?,?)";

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
     * 등급정보가져오기
     * @param req Request
     * @return LevelBean
     * @throws ClassNotFoundException
     */
    public LevelBean getLevel(Request req) throws ClassNotFoundException {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        LevelBean level = new LevelBean();

        try {
            conn = JDBC.getConnection();

            String strSQL = "select lev_id, lev_name, lev_status";
            strSQL += " from usr_level where lev_idx = ?";
            pstmt = conn.prepareStatement(strSQL);
            pstmt.setInt(1, req.getInt("chkSel"));

            rs = pstmt.executeQuery();

            if (rs.next()) {
                level.setLevId(rs.getString("lev_id"));
                level.setLevName(rs.getString("lev_name"));
                level.setLevStatus(rs.getString("lev_status"));
            }

        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            JDBC.close(conn, pstmt, rs);
        }

        return level;
    }

    /**
     * 등급 수정
     * @param req Request
     * @throws ClassNotFoundException
     */
    public void updateLevel(Request req) throws ClassNotFoundException {

        Connection conn = null;
        PreparedStatement pstmt = null;

        try {
            conn = JDBC.getConnection();

            String strSQL = "update usr_level set lev_id = ?, lev_name = ?";
            strSQL +=       " where lev_idx = ?";

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
     * 레벨등급 삭제
     * @param req Request
     * @throws NumberFormatException
     * @throws ClassNotFoundException
     */
    public void deleteLevel(Request req) throws
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
                pstmt = conn.prepareStatement("delete from usr_level where lev_idx = ?");
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
     * 사용할 등급 선택
     * @param req Request
     * @throws NumberFormatException
     * @throws ClassNotFoundException
     */
    public void activeLevel(Request req) throws NumberFormatException,
            ClassNotFoundException {
        Connection conn = null;
        PreparedStatement pstmt = null;

        try {
            conn = JDBC.getConnection();

            int indexNum = 0;

            String[] check = req.getParameterValues("chkActive"); //같은 이름의 파라미터 "chkActive"
            if (check != null) { //parameter 가 null이 아닌경우에만 처리
                indexNum = check.length; //배열개수
            }

            //우선 status를 '0'으로 초기화 한다.
            pstmt = conn.prepareStatement("update usr_level set lev_status = '0'");
            pstmt.executeUpdate();

            //체크된 항목 status 를 '1'로 update
            for (int i = 0; i < indexNum; i++) {
                int intCheck = Integer.parseInt(check[i]);
                pstmt = conn.prepareStatement("update usr_level set lev_status = '1' where lev_idx = ?");
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
     * 레벨ID에 해당하는 레벨이름을 리턴
     * @param level String
     * @return String
     * @throws ClassNotFoundException
     */
    public String getLevelName(String level) throws ClassNotFoundException {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        String levelName = "";
        try {
            conn = JDBC.getConnection();

            pstmt = conn.prepareStatement("select lev_name from usr_level where lev_id = ?");
            pstmt.setString(1, level);
            rs = pstmt.executeQuery();

            if (rs.next()) {
                levelName = rs.getString(1);
            }

        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            JDBC.close(conn, pstmt, rs);
        }

        return levelName;

    }

}