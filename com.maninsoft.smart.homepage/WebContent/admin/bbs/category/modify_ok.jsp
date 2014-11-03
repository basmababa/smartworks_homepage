<%@ page language="java" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
<%@ include file="/common/inc/config.jsp" %>
<%@ include file="/admin/include/check_admin.jsp" %>
<%@ page import="com.maninsoft.smart.homepage.request.*"%>
<%@ page import="com.maninsoft.smart.homepage.bbs.category.*" %>
<%
	Request req = new Request(request);
	CategoryManager.getInstance().updateCategory(req);
%>
<html>
<body>
	<form name="sForm" method="post" action="modify.jsp">
		<input type="hidden" name="chkSel" value="<%=req.getString("rec_id")%>"/>
	</form>
	<script type="text/javascript" language="javascript">
		alert("수정되었습니다.");
		document.sForm.submit();
	</script>
</body>
</html>