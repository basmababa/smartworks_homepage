<%@ page language="java" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
<%@ page errorPage="/error/error_view.jsp" %>
<%@ include file="/common/inc/config.jsp" %>
<%@ page import="com.maninsoft.smart.homepage.request.*" %>
<%@ page import="com.maninsoft.smart.homepage.bbs.master.*" %>
<%@ page import="com.maninsoft.smart.homepage.bbs.*" %>
<%
	Request req = new Request(request);
	MasterManager masmanager = MasterManager.getInstance();
	BbsCommentManager cmtmanager = BbsCommentManager.getInstance();

	//table Name parameter
	String MAS_BBS_ID = req.getString("masBbsId");
	String strBbsId = req.getParameter("bbsId");
	
	String boardName = masmanager.getBoardName(MAS_BBS_ID);
	if (boardName == null || boardName.equals("")) {
		response.sendRedirect(ROOT_DIR);
	}

	//댓글 쓰기
	cmtmanager.writeComment(req);

%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title><%=SITE_TITLE %></title>
<meta http-equiv="imagetoolbar" content="no">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<script language="javascript" type="text/javascript" src="<%=ROOT_DIR%>/common/js/common.js"></script>
<script language="javaScript" type="text/javascript">
	var rootDir = "<%=ROOT_DIR%>";
</script>
</head>
<body>
	<form name="wForm" method="post" action="comment_list.jsp" target="_self">
		<input type="hidden" name="masBbsId" value="<%=MAS_BBS_ID%>">
		<input type="hidden" name="bbsId" value="<%=strBbsId%>">
	</form>

	<script language="javascript" type="text/javascript">
		document.wForm.submit();
	</script>
</body>
</html>
