<%@ page language="java" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
<%@ page errorPage="/error/error_view.jsp" %>
<%@ include file="/common/inc/config.jsp" %>
<%@ include file="/admin/include/check_admin.jsp" %>
<%@ page import="com.maninsoft.smart.homepage.request.*" %>
<%@ page import="com.maninsoft.smart.homepage.bbs.*" %>
<%@ page import="com.maninsoft.smart.homepage.bbs.master.*" %>
<%
	MRequest mReq = new MRequest(request);
	MasterManager masmanager = MasterManager.getInstance();
	BbsManager bbsmanager = BbsManager.getInstance();

	String MAS_BBS_ID = request.getParameter("masBbsId");
	
	String boardName = masmanager.getBoardName(MAS_BBS_ID);
	if (boardName == null || boardName.equals("")) {
		response.sendRedirect(ROOT_DIR);
	}
	
	String accessLevel = masmanager.getAccessLevel(MAS_BBS_ID, S_ID, S_LEVEL);
	String boardConfig = masmanager.getConfig(MAS_BBS_ID);

	//접근권한 체크(Write 페이지)
	if (accessLevel.indexOf("W") < 0) {
  		response.sendRedirect(ROOT_DIR);
	}

	bbsmanager.bbsWrite(mReq, DATA_ROOT, MAS_BBS_ID);
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>
<%=SITE_TITLE_ADMIN %>
</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link href="<%=ROOT_DIR%>/common/css/common.css" rel="stylesheet" type="text/css">
<script language="javascript" type="text/javascript" src="<%=ROOT_DIR%>/common/js/common.js"></script>
<script language="javascript" type="text/javascript">
	
</script>
</head>
<body>
	<div id="wrap">
		<form name="wForm" method="post" action="list.jsp">
			<input type="hidden" name="masBbsId" value="<%=MAS_BBS_ID%>">
		</form>
	
		<script language="javascript" type="text/javascript">
			document.wForm.submit();
		</script>
	</div>
</body>
</html>
