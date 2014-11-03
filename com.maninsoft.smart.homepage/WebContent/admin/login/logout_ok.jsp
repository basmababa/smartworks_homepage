<%@page language="java" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
<%@include file="/common/inc/config.jsp"%>
<%
	session.invalidate();
	//response.sendRedirect(ROOT_DIR);
%>
<script type="text/javascript" language="javascript">
	alert("로그아웃 하셨습니다.");
	top.location.href="<%=ROOT_DIR%>/admin/login/login.jsp";
</script>