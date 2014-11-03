<%@ page language="java" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
<%@ include file="/common/inc/config.jsp" %>
<%@ include file="/admin/include/check_admin.jsp" %>
<%@ page import="com.maninsoft.smart.homepage.request.*"%>
<%@ page import="com.maninsoft.smart.homepage.admin.db.demo.*" %>
<%
	Request req = new Request(request);
	DemoManager.getInstance().deleteDemo(req);
%>
<html>
<body>
	<form name="sForm" method="post" action="list.jsp">
		<input type="hidden" name="chkSel" value="<%=request.getParameter("chkSel")%>">
		<input type="hidden" name="page" value="<%=request.getParameter("page")%>">
		<input type="hidden" name="searchType" value="<%=request.getParameter("searchType")%>">
		<input type="hidden" name="searchText" value="<%=request.getParameter("searchText")%>">
	</form>
	<script type="text/javascript" language="javascript">
		alert("삭제되었습니다.");
		document.sForm.submit();
	</script>
</body>
</html>