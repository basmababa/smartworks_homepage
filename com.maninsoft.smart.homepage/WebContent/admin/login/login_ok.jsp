<%@ page language="java" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
<%@ include file="/common/inc/config.jsp" %>
<%@ page import="com.maninsoft.smart.homepage.member.*" %>
<%@ page import="com.maninsoft.smart.homepage.request.*"%>
<%
	String loginURL = request.getParameter("loginURL");       //redirect page
	String loginMessage = "";

	try {
		Request req = new Request(request);
		
		MemberManager manager = MemberManager.getInstance();
		MemberBean member = new MemberBean();
		member = manager.checkAuth(req);
		int memberIdx = 0;
		String memberId = "";
		String memberPass = "";
		String memberName = "";
		String memberLevel = "";
		String memberHp = "";
		String memberEmail = "";
	
		if (member != null) {                             //null 이 아닌경우에만
			memberIdx = member.getMemIdx();
			memberId = member.getMemId();
			memberPass = member.getMemPass();
			memberName = member.getMemName();
			memberLevel = member.getMemLevId();
			memberHp = member.getMemHp();
			memberEmail = member.getMemEmail();
		}
	
	
		if (member == null) {                                               //아이디 없음
			loginMessage = "잘못된 회원 정보입니다.";
		} else if (memberLevel.equals("NOT")){                              //password 불일치
			loginMessage = "비밀번호가 잘못되었습니다.";
		} else if (!(memberLevel.equals("1") || memberLevel.equals("2"))){ 	//password 불일치
			loginMessage = "접근 권한이 없습니다.";
		} else if (memberLevel.equals("999")) {
			loginMessage = "죄송합니다. 탈퇴회원은 로그인 할수 없습니다.";
		} else{                   //로그인 성공
			loginMessage = "로그인 성공!";
			session.setAttribute("S_IDX", Integer.toString(memberIdx));
			session.setAttribute("S_ID", memberId);                        //세션을 생성한다.
			session.setAttribute("S_PASS", memberPass);
			session.setAttribute("S_NAME", memberName);
			session.setAttribute("S_LEVEL", memberLevel);
			session.setAttribute("S_HP", memberHp);
			session.setAttribute("S_EMAIL", memberEmail);
			//session.setMaxInactiveInterval(60*60);                         //세션시간 1시간

			loginURL = ROOT_DIR + "/admin/";
			//Last Login
			manager.lastLogin(memberIdx);
		}
	} catch (Exception ex) {
		ex.printStackTrace();
	}
%>
<html>
<body>
	<script language="javascript">
		alert('<%=loginMessage%>');
		location.href="<%=loginURL%>";
	</script>
</body>
</html>
