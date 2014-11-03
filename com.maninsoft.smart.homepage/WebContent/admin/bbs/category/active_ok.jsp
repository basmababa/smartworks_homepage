<%@ page language="java" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
<%@ include file="/common/inc/config.jsp" %>
<%@ include file="/admin/include/check_admin.jsp" %>
<%@ page import="com.maninsoft.smart.homepage.request.*"%>
<%@ page import="com.maninsoft.smart.homepage.bbs.category.*" %>
<%
	Request req = new Request(request);
	CategoryManager.getInstance().activeCategory(req);
%>
<html>
<body>
	<script type="text/javascript" language="javascript">
		alert("사용상태가 변경되었습니다.");
		location.href = "list.jsp";
	</script>
</body>
</html>