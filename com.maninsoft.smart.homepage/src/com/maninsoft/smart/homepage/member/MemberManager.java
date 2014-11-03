package com.maninsoft.smart.homepage.member;

import com.maninsoft.smart.homepage.request.*;
import com.maninsoft.smart.homepage.jdbc.*;

import java.util.ArrayList;
import java.sql.*;

public class MemberManager {

    private static MemberManager instance = new MemberManager();

    public static MemberManager getInstance () {
        return instance;
    }

    private MemberManager() {
    }
    
    /**
     * 로그인 인증
     * @param req Request
     * @return MemberBean
     * @throws ClassNotFoundException
     */
    public MemberBean checkAuth(Request req) throws
            ClassNotFoundException {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
            conn = JDBC.getConnection();

            String strSQL = "select mem_idx, mem_id, mem_pass, mem_name, mem_email, lev_id";
            strSQL += " from usr_member where mem_id = ?";
            pstmt = conn.prepareStatement(strSQL);

            pstmt.setString(1, req.getString("txtID"));

            rs = pstmt.executeQuery();

            if (rs.next()) {
                MemberBean member = new MemberBean();
                String dbPassword = rs.getString("mem_pass");
                member.setMemIdx(rs.getInt("mem_idx"));
                member.setMemPass(rs.getString("mem_pass"));
                member.setMemId(rs.getString("mem_id"));
                member.setMemName(rs.getString("mem_name"));
                member.setMemEmail(rs.getString("mem_email"));
                member.setMemLevId(rs.getString("lev_id"));

                if (dbPassword.compareTo(req.getString("txtPassword")) == 0) {
                    return member;
                } else {
                    member.setMemLevId("NOT");
                    return member;
                }

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
     * last login getdate()
     * @param memberIdx String
     * @throws ClassNotFoundException
     */
    public void lastLogin(int memberIdx) throws ClassNotFoundException {
        Connection conn = null;
        PreparedStatement pstmt = null;

        try {
            conn = JDBC.getConnection();

            String strSQL = "update usr_member set last_login = now()";
            strSQL += " where mem_idx = ?";

            pstmt = conn.prepareStatement(strSQL);
            pstmt.setInt(1, memberIdx);

            pstmt.executeUpdate();

        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            JDBC.close(conn, pstmt);
        }

    }

    /**
     * 관리자의 정보를 얻어온다. (공통)
     * @return MemberBean
     * @throws ClassNotFoundException
     */
    public MemberBean getAdmin() throws ClassNotFoundException {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
            conn = JDBC.getConnection();

            String strSQL = "select mem_idx, mem_id, mem_pass, mem_name, mem_email";
            strSQL +=       " from usr_member where lev_id = '1'";

            pstmt = conn.prepareStatement(strSQL);
            rs = pstmt.executeQuery();

            if (rs.next()) {
                MemberBean member = new MemberBean();
                member.setMemIdx(rs.getInt("mem_idx"));
                member.setMemId(rs.getString("mem_id"));
                member.setMemPass(rs.getString("mem_pass"));
                member.setMemName(rs.getString("mem_name"));
                member.setMemEmail(rs.getString("mem_email"));

                return member;

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
     * 관리자 정보수정(MASTER) (공통)
     * @param req Request
     * @throws ClassNotFoundException
     */
    public void modifyAdmin(Request req) throws ClassNotFoundException {
        Connection conn = null;
        PreparedStatement pstmt = null;

        try {
            conn = JDBC.getConnection();

            String strSQL = "update usr_member set mem_id = ?, mem_pass = ?,";
            strSQL += " mem_name = ?, mem_email = ? where mem_idx = ?";
            pstmt = conn.prepareStatement(strSQL);
            pstmt.setString(1, req.getString("member_id"));
            pstmt.setString(2, req.getString("member_pwd"));
            pstmt.setString(3, req.getString("member_name"));
            pstmt.setString(4, req.getString("member_email"));
            pstmt.setInt(5, req.getInt("rec_id"));

            pstmt.executeUpdate();

        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            JDBC.close(conn, pstmt);
        }
    }
    
    /**
     * 전체 게시물의 수
     * @param strWhere String
     * @return int
     * @throws ClassNotFoundException
     * @throws UnsupportedEncodingException
     * @throws NumberFormatException
     */
    public int getMemberListCount(String strWhere) throws ClassNotFoundException {
    	Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        int totalCount = 0;

        try {
            conn = JDBC.getConnection();

            String strSQL = "";
            strSQL = "select count(*) from usr_member " + strWhere;
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
     * 회원리스트
     * @param req Request
     * @param strWhere String
     * @return ArrayList
     * @throws ClassNotFoundException
     */
    public ArrayList getMemberList(Request req, String strWhere, String strOrder) throws
            ClassNotFoundException {
        ArrayList memberList = null;
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
            conn = JDBC.getConnection();

            int curPage = 1;
            int pageSize = 20;
            
            if (req.getString("page") != null) {
                curPage = req.getInt("page");
            }
            if (req.getString("option_size") != null) {
                pageSize = req.getInt("option_size");
            }
            
            int offset = pageSize * (curPage - 1); //시작 레코드 번호
            
            /*
            String offsetQuery = "";
            if (strWhere.equals("")) {
            	offsetQuery = " where mem_idx not in";
            } else {
            	offsetQuery = " and mem_idx not in";
            }
            
            String strSQL = "select top " + pageSize + " mem_idx, mem_id, mem_pass, mem_name, mem_jumin,";
            strSQL       += " mem_tel, mem_hp, mem_zipcode, mem_address, mem_email, mem_register, last_login, lev_id";
            strSQL       += "     from usr_member ";
            strSQL       +=       strWhere;
            strSQL       +=       offsetQuery;
            strSQL       += "     ( ";
            strSQL       += "         select top " + offset + " mem_idx ";
            strSQL       += "         from usr_member ";
            strSQL       +=           strWhere;
            strSQL       +=           strOrder;
            strSQL       += "     ) "; 
            strSQL       +=       strOrder;
            */
            
            String strSQL = "select mem_idx, mem_id, mem_pass, mem_name, mem_jumin,";
            strSQL       += " mem_tel, mem_hp, mem_zipcode, mem_address, mem_email, mem_register, last_login, lev_id";
            strSQL       += " from usr_member" + strWhere + strOrder + " LIMIT " + pageSize + " offset " + offset;
            
            pstmt = conn.prepareStatement(strSQL);

            rs = pstmt.executeQuery();
            memberList = new ArrayList();

            while (rs.next()) {
                MemberBean memberInfo = new MemberBean();

                memberInfo.setMemIdx(rs.getInt("mem_idx"));
                memberInfo.setMemId(rs.getString("mem_id"));
                memberInfo.setMemPass(rs.getString("mem_pass"));
                memberInfo.setMemName(rs.getString("mem_name"));

                memberInfo.setMemJumin(rs.getString("mem_jumin"));
                memberInfo.setMemTel(rs.getString("mem_tel"));
                memberInfo.setMemHp(rs.getString("mem_hp"));
                memberInfo.setMemZipCode(rs.getString("mem_zipcode"));
                memberInfo.setMemAddress(rs.getString("mem_address"));

                memberInfo.setMemEmail(rs.getString("mem_email"));
                memberInfo.setMemRegister(rs.getTimestamp("mem_register"));
                memberInfo.setMemLastLogin(rs.getTimestamp("last_login"));
                memberInfo.setMemLevId(rs.getString("lev_id"));

                memberList.add(memberInfo);
            }

        } catch (SQLException ex) {
            memberList = null;
            ex.printStackTrace();
        } finally {
            JDBC.close(conn, pstmt, rs);
        }

        return memberList;
    }
    
    /**
     * 아이디 중복체크 (1:사용중,0사용가능) (공통)
     * @param req Request
     * @return int
     * @throws ClassNotFoundException
     */
    public int checkId(Request req) throws ClassNotFoundException {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
            conn = JDBC.getConnection();
            pstmt = conn.prepareStatement("select mem_id from usr_member where mem_id = ?");
            pstmt.setString(1, req.getString("userId"));

            rs = pstmt.executeQuery();

            if (rs.next()) {
                return 1; //사용중인 ID
            } else {
                return 0; //ID 존재하지 않음 0
            }

        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            JDBC.close(conn, pstmt, rs);
        }
        return 0;
    }

    /**
     * 주민등록번호 check (가입여부)
     * 가입된 주민번호 일경우 가입날짜를 리턴
     * @param req Request
     * @return MemberBean
     * @throws ClassNotFoundException
     */
    public MemberBean checkSno(Request req) throws
            ClassNotFoundException {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
            conn = JDBC.getConnection();
            String snoNumber = req.getString("sno1") + "-" + req.getString("sno2");

            pstmt = conn.prepareStatement("select mem_register from usr_member where mem_jumin = ?");
            pstmt.setString(1, snoNumber);
            rs = pstmt.executeQuery();

            if (rs.next()) {
                MemberBean member = new MemberBean();
                member.setMemRegister(rs.getTimestamp("mem_register"));
                return member; //가입된 주민번호

            } else {
                return null; //가입되지 않은 주민번호
            }

        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            JDBC.close(conn, pstmt, rs);
        }
        return null;
    }
    
    /**
     * 회원가입
     * @param req Request
     * @throws ClassNotFoundException
     */
    public void insertMember(Request req) throws ClassNotFoundException {
        Connection conn = null;
        PreparedStatement pstmt = null;

        try {
            conn = JDBC.getConnection();

            String strSQL = "insert into usr_member";
            strSQL +=       " (mem_id, mem_pass, mem_name, mem_jumin,";
            strSQL +=       " mem_tel, mem_hp, mem_zipcode, mem_address,";
            strSQL +=       " mem_email, mem_register, last_login, lev_id)";
            strSQL +=       " values (?,?,?,?,?,?,?,?,?,now(),now(),'100')";

            pstmt = conn.prepareStatement(strSQL);
            pstmt.setString(1, req.getString("id"));
            pstmt.setString(2, req.getString("pass"));
            pstmt.setString(3, req.getString("name"));
            pstmt.setString(4, req.getString("sno1") + "-" + req.getString("sno2"));

            pstmt.setString(5, req.getString("tel"));
            pstmt.setString(6, req.getString("hp"));
            pstmt.setString(7, req.getString("zip1") + "-" + req.getString("zip2"));
            pstmt.setString(8, req.getString("address1") + " " + req.getString("address2"));
            pstmt.setString(9, req.getString("email"));

            pstmt.executeUpdate();

        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            JDBC.close(conn, pstmt);
        }
    }

    /**
     * 회원정보
     * @param usrID String
     * @return MemberBean
     * @throws ClassNotFoundException
     */
    public MemberBean getMember(String usrId) throws ClassNotFoundException {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
            conn = JDBC.getConnection();

            String strSQL = "select mem_idx, mem_id, mem_pass, mem_name, mem_jumin,";
            strSQL += " mem_tel, mem_hp, mem_zipcode, mem_address, mem_email, lev_id";
            strSQL += " from usr_member where mem_id = ?";

            pstmt = conn.prepareStatement(strSQL);
            pstmt.setString(1, usrId);
            rs = pstmt.executeQuery();

            if (rs.next()) {
                MemberBean member = new MemberBean();
                member.setMemIdx(rs.getInt("mem_idx"));
                member.setMemId(rs.getString("mem_id"));
                member.setMemPass(rs.getString("mem_pass"));
                member.setMemName(rs.getString("mem_name"));
                member.setMemJumin(rs.getString("mem_jumin"));

                member.setMemTel(rs.getString("mem_tel"));
                member.setMemHp(rs.getString("mem_hp"));
                member.setMemZipCode(rs.getString("mem_zipcode"));
                member.setMemAddress(rs.getString("mem_address"));
                member.setMemEmail(rs.getString("mem_email"));
                member.setMemLevId(rs.getString("lev_id"));

                return member;

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
     * 회원수정
     * @param req Request
     * @param usrId String
     * @throws ClassNotFoundException
     */
    public void updateMember(Request req, String usrId) throws
            ClassNotFoundException {
        Connection conn = null;
        PreparedStatement pstmt = null;

        try {
            conn = JDBC.getConnection();

            String strSQL = "update usr_member set";
            strSQL +=       " mem_pass=?, mem_name=?, mem_tel=?, mem_hp=?,";
            strSQL +=       " mem_email=?, mem_zipcode=?, mem_address=?";
            strSQL +=       " where mem_id = ?";

            pstmt = conn.prepareStatement(strSQL);

            pstmt.setString(1, req.getString("pass"));
            pstmt.setString(2, req.getString("name"));
            pstmt.setString(3, req.getString("tel"));
            pstmt.setString(4, req.getString("hp"));

            pstmt.setString(5, req.getString("email"));
            pstmt.setString(6, req.getString("zip1") + "-" + req.getString("zip2"));
            pstmt.setString(7, req.getString("address1") + " " + req.getString("address2"));
            pstmt.setString(8, usrId);

            pstmt.executeUpdate();

        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            JDBC.close(conn, pstmt);
        }
    }
    
	/**
	 * 회원 삭제
	 * @param req Request
	 * @throws NumberFormatException
	 * @throws ClassNotFoundException
	 */
	public void deleteMember(Request req) throws
	        NumberFormatException, ClassNotFoundException {
		Connection conn = null;
	    PreparedStatement pstmt = null;
	
	    try {
	        conn = JDBC.getConnection();
	        String[] check = req.getParameterValues("chkSel");
	        for (int i = 0; i < check.length; i++) {
	            pstmt = conn.prepareStatement("delete from usr_member where mem_id = ?");
	            pstmt.setString(1, check[i]);
	            pstmt.executeUpdate();
	        }
	
	    } catch (SQLException ex) {
	        ex.printStackTrace();
	    } finally {
	        JDBC.close(conn, pstmt);
	    }
	}
    
    /**
     * 회원등급 변경
     * @param req Request
     * @throws ClassNotFoundException
     */
    public void modifyLevel(Request req) throws
            ClassNotFoundException {
        Connection conn = null;
        PreparedStatement pstmt = null;

        try {
            conn = JDBC.getConnection();

            int indexNum = 0;

            String[] check = req.getParameterValues("chkSel"); 
            if (check != null) { 
                indexNum = check.length; 
            }

            String memberLevel = req.getString("level");

            //체크된 항목의 레벨을 수정한다.
            for (int i = 0; i < indexNum; i++) {

                //Level ID를 수정한다.
                String strSQL = "update usr_member set lev_id = ?";
                strSQL += " where mem_id = ?";

                pstmt = conn.prepareStatement(strSQL);
                pstmt.setString(1, memberLevel);
                pstmt.setString(2, check[i]);
                pstmt.executeUpdate();
            }

        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            JDBC.close(conn, pstmt);
        }
    }
    
    /**
     * ID 찾기
     * @param mem_name String
     * @param sno1 String
     * @param sno2 String
     * @return MemberBean
     * @throws ClassNotFoundException
     */
    public MemberBean searchId(String mem_name, String sno1, String sno2) throws ClassNotFoundException {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
            conn = JDBC.getConnection();

            String strSQL = "select mem_id, mem_name, mem_email from usr_member";
            strSQL +=       " where mem_name = ? and mem_jumin = ?";

            pstmt = conn.prepareStatement(strSQL);
            pstmt.setString(1, mem_name);
            pstmt.setString(2, sno1 + "-" + sno2);

            rs = pstmt.executeQuery();

            if (rs.next()) {
                MemberBean member = new MemberBean();
                member.setMemId(rs.getString("mem_id"));
                member.setMemName(rs.getString("mem_name"));
                member.setMemEmail(rs.getString("mem_email"));

                return member;
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
     * 패스워드 찾기
     * @param mem_id String
     * @param mem_name String
     * @param sno1 String
     * @param sno2 String
     * @return MemberBean
     * @throws ClassNotFoundException
     */
    public MemberBean searchPass(String mem_id, String mem_name, String sno1, String sno2) throws ClassNotFoundException {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
            conn = JDBC.getConnection();

            String strSQL = "select mem_id, mem_name, mem_email, mem_pass from usr_member";
            strSQL += " where mem_id = ? and mem_name = ? and mem_jumin = ?";
            pstmt = conn.prepareStatement(strSQL);
            pstmt.setString(1, mem_id);
            pstmt.setString(2, mem_name);
            pstmt.setString(3, sno1 + "-" + sno2);

            rs = pstmt.executeQuery();

            if (rs.next()) {
                MemberBean member = new MemberBean();
                member.setMemId(rs.getString("mem_id"));
                member.setMemName(rs.getString("mem_name"));
                member.setMemEmail(rs.getString("mem_email"));
                member.setMemPass(rs.getString("mem_pass"));

                return member;

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

}