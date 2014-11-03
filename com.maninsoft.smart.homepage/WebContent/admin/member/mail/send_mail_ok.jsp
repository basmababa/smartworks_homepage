<%@ page language="java" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
<%@ include file="/common/inc/config.jsp" %>
<%@ include file="/admin/include/check_admin.jsp" %>
<%@ page import="com.maninsoft.smart.homepage.request.*"%>
<%@ page import="com.maninsoft.smart.homepage.admin.mail.*" %>
<%
	//Request req = new Request(request);
	int sendMsgCount = 0;
	
	sendMsgCount = MailManager.getInstance().sendMail(request);
%>
<html>
<body>
	<form name="wForm" method="post" action="send_mail.jsp">
	</form>
	<script type="text/javascript" language="javascript">
		alert("<%=sendMsgCount%>건의 메일이 발송되었습니다.");
		document.wForm.submit();
	</script>
</body>
</html>