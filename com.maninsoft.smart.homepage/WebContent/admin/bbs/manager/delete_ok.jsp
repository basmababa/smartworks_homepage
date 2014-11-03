<%@ page language="java" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
<%@ include file="/common/inc/config.jsp" %>
<%@ include file="/admin/include/check_admin.jsp" %>
<%@ page import="com.maninsoft.smart.homepage.request.*"%>
<%@ page import="com.maninsoft.smart.homepage.bbs.master.*" %>
<%
	Request req = new Request(request);
	
	MasterManager masmanager = MasterManager.getInstance();
	String MAS_BBS_ID = "";
	MAS_BBS_ID = masmanager.getMasBbsId(req);

	MasterManager.getInstance().deleteBoard(req, DATA_ROOT, MAS_BBS_ID);
%>
<html>
<body>
	<script type="text/javascript" language="javascript">
		alert("삭제되었습니다.");
		location.href = "list.jsp";
	</script>
</body>
</html>
