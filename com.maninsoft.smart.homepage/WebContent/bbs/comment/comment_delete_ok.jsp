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

	String MAS_BBS_ID = req.getString("masBbsId");
	String strBbsId = req.getParameter("bbsId");
	
	String boardName = masmanager.getBoardName(MAS_BBS_ID);
	if (boardName == null || boardName.equals("")) {
		response.sendRedirect(ROOT_DIR);
	}
	String accessLevel = masmanager.getAccessLevel(MAS_BBS_ID, S_ID, S_LEVEL);
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
<%

	String cmtUserId = cmtmanager.getUserId(req);
	if (accessLevel.indexOf("S") > 0 || (!S_ID.equals("") && S_ID.equals(cmtUserId))) {  //관리자 이거나 글쓴이일 경우
		cmtmanager.deleteComment(req);
	} else {																	//그외(Guest인 경우:패스워드 check)
		int delOk = 0;
		delOk = cmtmanager.checkCommentPass(req);
		if (delOk == 0) {
			out.println("<script language='javascript' type='text/javascript'>");
			out.println("alert('비밀번호가 일치하지 않습니다.');");
			out.println("</script>");
		} else {
			cmtmanager.deleteComment(req);
		}
	}

%>
	<form name="wForm" method="post" action="comment_list.jsp">
		<input type="hidden" name="masBbsId" value="<%=MAS_BBS_ID%>">
		<input type="hidden" name="bbsId" value="<%=strBbsId%>">
	</form>

	<script language="javascript" type="text/javascript">
		document.wForm.submit();
	</script>
</body>
</html>

