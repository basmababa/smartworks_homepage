<%@ page language="java" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
<%@ include file="/common/inc/config.jsp" %>
<%@ include file="/admin/include/check_admin.jsp" %>
<%@ page import="com.maninsoft.smart.homepage.request.*"%>
<%@ page import="com.maninsoft.smart.homepage.bbs.master.*" %>
<%
	Request req = new Request(request);
	MasterManager masmanager = MasterManager.getInstance();
	
	String alertMessage = "등록되었습니다.";
	String linkUrl = "list.jsp";
	
	int okBbsMake = masmanager.checkBbsId(req);
	
	if (okBbsMake == 1) {            //중복
		alertMessage = "이미 생성된 게시판 ID입니다.";
		linkUrl = "add.jsp";
	} else {                         //중복 안됨
		masmanager.insertBoard(req);
	}
%>
<html>
<body>
	<script type="text/javascript" language="javascript">
		alert("<%=alertMessage%>");
		location.href = "<%=linkUrl%>";
	</script>
</body>
</html>
