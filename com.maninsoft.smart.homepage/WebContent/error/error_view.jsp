<%@ page language="java" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
<%@ include file="/common/inc/config.jsp" %>
<%@ page import="com.maninsoft.smart.homepage.member.*" %>
<%@ page isErrorPage="true" %>
<%
	MemberBean member = new MemberBean();
	MemberManager manager = MemberManager.getInstance();
	
	//관리자의 정보를 가져온다(email)
	member = manager.getAdmin();
	String admin_email = "admin@maninsoft.co.kr";
	
	if (member != null){
		admin_email = member.getMemEmail();
	}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>
<%=SITE_TITLE_ADMIN %>
</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link href="<%=ROOT_DIR%>/common/css/common.css" rel="stylesheet" type="text/css">
<script language="javascript" type="text/javascript" src="<%=ROOT_DIR%>/common/js/common.js"></script>
<script language="javascript" type="text/javascript">
	
</script>
</head>
<body>
	<div style="margin:20px;">
	에러Error<br><br><br>
	에러 타입 : <%= exception.getClass().getName()%><br>
	에러 메시지 : <font color="tomato"><b><%=exception.getMessage()%></b></font><br><br>
	<h2>주소를 확인하신 후 다시 방문해 주십시오!</h2><br>
	개인정보침해 등 긴급사항은	관리자메일(<a href="mailto:<%=admin_email %>"><%=admin_email %></a>)로 
	연락주시면 담당자가 확인 후 연락드리겠습니다.<br><br>
	<a href="<%=ROOT_DIR %>">GO HOME~</a>
	</div>
</body>
</html>
