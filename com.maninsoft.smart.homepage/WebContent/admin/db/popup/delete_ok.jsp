<%@ page language="java" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
<%@ include file="/common/inc/config.jsp" %>
<%@ include file="/admin/include/check_admin.jsp" %>
<%@ page import="com.maninsoft.smart.homepage.request.*"%>
<%@ page import="com.maninsoft.smart.homepage.admin.db.popup.*" %>
<%
	MRequest mReq = new MRequest(request);
	String uploadDir = "/popup/";
	PopupManager.getInstance().deletePopup(mReq, DATA_ROOT, uploadDir);
%>
<html>
<body>
	<script type="text/javascript" language="javascript">
		alert("삭제되었습니다.");
		location.href = "list.jsp";
	</script>
</body>
</html>
