package com.maninsoft.smart.homepage.jdbc;

import java.sql.*;
import java.util.ResourceBundle;

public class JDBC{

    public final static String CONFIGURATION_PROPERTIES = "com.maninsoft.smart.homepage.config";

    public JDBC(){
    }

	public static Connection getConnection() throws SQLException, ClassNotFoundException {
        Connection conn = null;
        try {
            Class.forName(getProperty(CONFIGURATION_PROPERTIES, "DRIVER"));
            conn = DriverManager.getConnection(getProperty(CONFIGURATION_PROPERTIES, "URL"),
                                               getProperty(CONFIGURATION_PROPERTIES, "ACCOUNT"),
                                               getProperty(CONFIGURATION_PROPERTIES, "PASSWORD"));


        } catch (ClassNotFoundException ex) {
            throw ex;
        } catch (SQLException ex) {
            throw ex;
        }
        return conn;
    }

    public static String getProperty(String property, String name) {
        try {
            ResourceBundle bundle = ResourceBundle.getBundle(property);
            return bundle.getString(name);
        } catch (Exception ex) {
            return null;
        }
    }

    public static Statement getStatement(Connection conn) throws SQLException {
        return conn.createStatement();
    }

    public static PreparedStatement getPreparedStatement(Connection conn, String query) throws SQLException {
        return conn.prepareStatement(query);
    }


    public synchronized static void close(Connection conn, PreparedStatement pstmt) {
        closePrepareStatement(pstmt);
        closeConnection(conn);
    }

    public synchronized static void close(Connection conn, PreparedStatement pstmt, ResultSet rs) {
    	closeResultSet(rs);
        closePrepareStatement(pstmt);
        closeConnection(conn);
    }

    public synchronized static void closeResultSet(ResultSet rs) {
        try {
            if (rs != null) {
                rs.close();
            }
            rs = null;
        } catch (SQLException ex) {
            //ignore;
        }
    }

    public synchronized static void closePrepareStatement(PreparedStatement
            pstmt) {
        try {
            if (pstmt != null) {
                pstmt.close();
            }
            pstmt = null;
        } catch (SQLException ex) {
            //ignore;
        }
    }

    public synchronized static void closeConnection(Connection conn) {
        try {
            if (conn != null) {
                conn.close();
            }
            conn = null;
        } catch (SQLException ex) {
            //ignore;
        }
    }
}