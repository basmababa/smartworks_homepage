package com.maninsoft.smart.homepage.post;

import com.maninsoft.smart.homepage.jdbc.*;
import java.sql.*;
import java.util.ArrayList;

public class PostSearch {

	public PostSearch() {
	}

	/**
	 * 우편번호 검색
	 * @param dong String
	 * @return String[][]
	 * @throws ClassNotFoundException
	 */
	public static String [][] getPostList(String dong) throws ClassNotFoundException {
		String [][] postList = null;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			conn = JDBC.getConnection();
			pstmt = conn.prepareStatement("select id, zipcode, sido, gugun, dong, ri, bldg, st_bunji, ed_bunji from zipcode where dong like ?");
			pstmt.setString(1,"%"+dong+"%");
			rs = pstmt.executeQuery();
      
			ArrayList arrayList = new ArrayList();
			while(rs.next()) {
				String [] postInfo = new String[9];
				postInfo[0] = rs.getString(1);
				postInfo[1] = rs.getString(2);
				postInfo[2] = rs.getString(3);
				postInfo[3] = rs.getString(4);
				postInfo[4] = rs.getString(5);
				postInfo[5] = rs.getString(6);
				postInfo[6] = rs.getString(7);
				postInfo[7] = rs.getString(8);
				postInfo[8] = rs.getString(9);

				arrayList.add(postInfo);
			}

			int numOfPost = arrayList.size();
			postList = new String[numOfPost][9];

			for(int i = 0 ; i < numOfPost ; i++) {
				postList[i] = (String[]) arrayList.get(i);
			}

		} catch (Exception ex) {
			postList = null;
			ex.printStackTrace();
		} finally {
			JDBC.close(conn, pstmt, rs);
		}
		return postList;
	}
}