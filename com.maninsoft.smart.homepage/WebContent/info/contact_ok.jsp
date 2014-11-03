<%@ page language="java" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
<%@ page errorPage="/error/error_view.jsp" %>
<%@ include file="/common/inc/config.jsp" %>
<%@ page import="com.maninsoft.smart.homepage.request.*" %>
<%@ page import="com.maninsoft.smart.homepage.admin.db.contact.*" %>
<%@ page import="com.maninsoft.smart.homepage.member.*" %>
<%@ page import="com.maninsoft.smart.homepage.admin.mail.*" %>
<%
	Request req = new Request(request);
	ContactManager conmanager = ContactManager.getInstance();
	conmanager.insertContact(req);
	
	MemberBean member = new MemberBean();
	MemberManager manager = MemberManager.getInstance();
	
	//관리자의 정보를 가져온다(email)
	member = manager.getAdmin();
	String admin_email = "admin@maninsoft.co.kr";
	
	if (member != null){
		admin_email = member.getMemEmail();
	}
	
	String mail_to = admin_email;
	String mail_from = admin_email;
	String mail_subjet = "[제휴문의] :: " + req.getString("title");
	
	String mail_contents = req.getString("contents");
		
	int sendMsgCount = 0;
	sendMsgCount = MailManager.getInstance().SendMail2(mail_to, mail_from, mail_subjet, mail_contents);
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
	<div id="wrap">
		<form name="wForm" method="post" action="contact.jsp">
		</form>
	
		<script language="javascript" type="text/javascript">
			alert("정상적으로 접수되었습니다.");
			document.wForm.submit();
		</script>
	</div>
</body>
</html>
