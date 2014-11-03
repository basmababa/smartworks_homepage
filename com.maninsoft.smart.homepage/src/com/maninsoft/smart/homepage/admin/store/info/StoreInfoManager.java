package com.maninsoft.smart.homepage.admin.store.info;

import com.maninsoft.smart.homepage.request.*;
import com.maninsoft.smart.homepage.jdbc.*;
import java.sql.*;

public class StoreInfoManager {

    private static StoreInfoManager instance = new StoreInfoManager();

    public static StoreInfoManager getInstance () {
        return instance;
    }

    private StoreInfoManager() {
    }

    /**
     * @return StoreInfoBean
     * @throws ClassNotFoundException
     */
	public StoreInfoBean getStoreInfo () throws ClassNotFoundException {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

        StoreInfoBean store = new StoreInfoBean();

        try {
            conn = JDBC.getConnection();
            pstmt = conn.prepareStatement("select * from store_info");
            rs = pstmt.executeQuery();

            if (rs.next()) {
                store.setStoreIdx(rs.getString("store_idx"));
                store.setStoreAlias(rs.getString("store_alias"));
                store.setStoreNum(rs.getString("store_num"));
                store.setStoreName(rs.getString("store_name"));
                store.setStoreBoss(rs.getString("store_boss"));
                store.setStoreAddr(rs.getString("store_addr"));
                store.setStoreZip(rs.getString("store_zip"));
                store.setStoreBusiness(rs.getString("store_business"));
                store.setStoreItem(rs.getString("store_item"));
                store.setTelOffice(rs.getString("tel_office"));
                store.setTelFax(rs.getString("tel_fax"));
                store.setTelFaq(rs.getString("tel_faq"));
                store.setTelAs(rs.getString("tel_as"));
                store.setTel080(rs.getString("tel_080"));
                store.setTelDeliver(rs.getString("tel_deliver"));
                return store;
            }

        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            JDBC.close(conn, pstmt, rs);
        }
        return store;
    }


    public void modifyStoreInfo (Request req) throws ClassNotFoundException {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
            conn = JDBC.getConnection();
            int checkCnt = 0;
            String storeZip = req.getString("zip1") + "-" + req.getString("zip2");
            String storeAddr = req.getString("address1") + " " + req.getString("address2");

            try {
                String strQuery = "select count(*) from store_info";
                pstmt = conn.prepareStatement(strQuery);
                rs = pstmt.executeQuery();

                if (rs.next()) {
                    checkCnt = rs.getInt(1);
                }
            } catch (SQLException ex) {
                ex.printStackTrace();
            } finally {
                JDBC.closePrepareStatement(pstmt);
            }

            if (checkCnt == 0) {
                try {
                    String strInsert = "insert into store_info";
                    strInsert +=       " (store_alias, store_num, store_name, store_boss, store_addr,";
                    strInsert +=       " store_zip, store_business, store_item, tel_office,";
                    strInsert +=       " tel_fax, tel_faq, tel_as, tel_080, tel_deliver)";
                    strInsert +=       " values (?,?,?,?,?,?,?,?,?,?,?,?,?,?)";

                    pstmt = conn.prepareStatement(strInsert);
                    pstmt.setString(1, req.getString("store_alias"));
                    pstmt.setString(2, req.getString("store_num"));
                    pstmt.setString(3, req.getString("store_name"));
                    pstmt.setString(4, req.getString("store_boss"));
                    pstmt.setString(5, storeAddr);
                    pstmt.setString(6, storeZip);
                    pstmt.setString(7, req.getString("store_business"));
                    pstmt.setString(8, req.getString("store_item"));
                    pstmt.setString(9, req.getString("tel_office"));
                    pstmt.setString(10, req.getString("tel_fax"));
                    pstmt.setString(11, req.getString("tel_faq"));
                    pstmt.setString(12, req.getString("tel_as"));
                    pstmt.setString(13, req.getString("tel_080"));
                    pstmt.setString(14, req.getString("tel_deliver"));

                    pstmt.executeUpdate();

                } catch (SQLException ex) {
                    ex.printStackTrace();
                } finally {
                    JDBC.closePrepareStatement(pstmt);
                }
            } else {
                try {
                    String strUpdate = "update store_info set";
                    strUpdate +=       " store_alias = ?, store_num = ?, store_name = ?,";
                    strUpdate +=       " store_boss = ?, store_addr = ?, store_zip = ?,";
                    strUpdate +=       " store_business = ?, store_item = ?, tel_office = ?,";
                    strUpdate +=       " tel_fax = ?, tel_faq = ?, tel_as = ?, tel_080 = ?, tel_deliver = ?";
                    strUpdate +=       " where store_idx = ?";

                    pstmt = conn.prepareStatement(strUpdate);
                    pstmt.setString(1, req.getString("store_alias"));
                    pstmt.setString(2, req.getString("store_num"));
                    pstmt.setString(3, req.getString("store_name"));
                    pstmt.setString(4, req.getString("store_boss"));
                    pstmt.setString(5, storeAddr);
                    pstmt.setString(6, storeZip);
                    pstmt.setString(7, req.getString("store_business"));
                    pstmt.setString(8, req.getString("store_item"));
                    pstmt.setString(9, req.getString("tel_office"));
                    pstmt.setString(10, req.getString("tel_fax"));
                    pstmt.setString(11, req.getString("tel_faq"));
                    pstmt.setString(12, req.getString("tel_as"));
                    pstmt.setString(13, req.getString("tel_080"));
                    pstmt.setString(14, req.getString("tel_deliver"));
                    pstmt.setInt(15, req.getInt("store_idx"));

                    pstmt.executeUpdate();

                } catch (SQLException ex) {
                    ex.printStackTrace();
                } finally {
                    JDBC.closePrepareStatement(pstmt);
                }
            }

        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            JDBC.close(conn, pstmt, rs);
        }

    }


}