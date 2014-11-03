<%@ page language="java" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
<%@ include file="/common/inc/config.jsp" %>
<%@ include file="/admin/include/check_admin.jsp" %>
<%@ page import="com.maninsoft.smart.homepage.request.*"%>
<%@ page import="com.maninsoft.smart.homepage.member.*" %>
<%
	Request req = new Request(request);
	
	String strUserId = "";
	if (request.getParameter("chkSel") != null) {
		strUserId = request.getParameter("chkSel");
	}
	
	MemberManager.getInstance().updateMember(req, strUserId);
%>
<html>
<body>
	<form name="sForm" method="post" action="modify.jsp">
		<input type="hidden" name="chkSel" value="<%=request.getParameter("chkSel")%>">
		<input type="hidden" name="page" value="<%=request.getParameter("page")%>">
		<input type="hidden" name="option_type" value="<%=request.getParameter("option_type")%>">
		<input type="hidden" name="option_order" value="<%=request.getParameter("option_order")%>">
		<input type="hidden" name="option_size" value="<%=request.getParameter("option_size")%>">
		<input type="hidden" name="option_status" value="<%=request.getParameter("option_status")%>">
		<input type="hidden" name="search_type" value="<%=request.getParameter("search_type")%>">
		<input type="hidden" name="search_keyword" value="<%=request.getParameter("search_keyword")%>">
	</form>
	<script type="text/javascript" language="javascript">
		alert("수정되었습니다.");
		document.sForm.submit();
	</script>
</body>
</html>