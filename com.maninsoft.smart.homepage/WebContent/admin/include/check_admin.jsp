<%@ page language="java" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
<%
	if (!(S_LEVEL.equals("1") || S_LEVEL.equals("2")) ) {
%>
	<script language="javascript" type="text/javascript">
		alert("접근권한이 없습니다!");
		top.location.href="<%=ROOT_DIR%>/admin/login/login.jsp";
	</script>
<% } %>
