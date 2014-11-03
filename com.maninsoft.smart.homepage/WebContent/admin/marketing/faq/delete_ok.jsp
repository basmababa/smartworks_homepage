<%@ page language="java" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
<%@ page errorPage="/error/error_view.jsp" %>
<%@ include file="/common/inc/config.jsp" %>
<%@ include file="/admin/include/check_admin.jsp" %>
<%@ page import="com.maninsoft.smart.homepage.request.*" %>
<%@ page import="com.maninsoft.smart.homepage.bbs.*" %>
<%@ page import="com.maninsoft.smart.homepage.bbs.master.*" %>
<%@ page import="com.maninsoft.smart.homepage.bbs.attach.*" %>
<%
	Request req = new Request(request);
	MasterManager masmanager = MasterManager.getInstance();
	BbsManager bbsmanager = BbsManager.getInstance();
	AttachManager filemanager = AttachManager.getInstance();

	String MAS_BBS_ID = req.getString("masBbsId");
	String strBbsId = req.getParameter("bbsId");
	
	String boardName = masmanager.getBoardName(MAS_BBS_ID);
	if (boardName == null || boardName.equals("")) {
		response.sendRedirect(ROOT_DIR);
	}
	
	String accessLevel = masmanager.getAccessLevel(MAS_BBS_ID, S_ID, S_LEVEL);
	String boardConfig = masmanager.getConfig(MAS_BBS_ID);

	//접근권한 체크(Delete 페이지)
	if (accessLevel.indexOf("W") < 0) {
  		response.sendRedirect(ROOT_DIR);
	}

	int curPage = 1;
	int pageSize = 10;
	String searchType = "";
	String searchText = "";

	if (request.getParameter("page") != null) {
		curPage = Integer.parseInt(request.getParameter("page"));
	}
	if (request.getParameter("searchType") != null) {
		searchType = request.getParameter("searchType");
	}
	if (request.getParameter("searchText") != null) {
		searchText = request.getParameter("searchText");
	}

	String strNo = req.getParameter("no");
	String strBbsPass = req.getParameter("bbsPass");
	
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
	<form name="wForm" method="post" action="list.jsp">
		<input type="hidden" name="masBbsId" value="<%=MAS_BBS_ID%>">
		<input type="hidden" name="page" value="<%=curPage%>">
		<input type="hidden" name="searchType" value="<%=searchType%>">
		<input type="hidden" name="searchText" value="<%=searchText%>">
	</form>
<%
	
	String strUserId = bbsmanager.getUserId(strBbsId, MAS_BBS_ID);
	if (accessLevel.indexOf("S") > 0 || (!S_ID.equals("") && S_ID.equals(strUserId))) {  //관리자 이거나 글쓴이일 경우
		int isReply = bbsmanager.isReply(req);
		if (isReply == 1) {       //하위글 있음(삭제안됨)
			out.println("<script language='javascript' type='text/javascript'>");
			out.println("alert('하위에 등록된 답변이 있어서 삭제 할 수 없습니다.');");
			out.println("history.back();");
			out.println("</script>");
		} else { //게시물(댓글삭제, 파일정보삭제, 파일삭제)
			bbsmanager.bbsDelete(req);
			MRequest mReq = new MRequest(request);
		    filemanager.deleteFiles(mReq, DATA_ROOT, MAS_BBS_ID, strBbsId);  //파일삭제, 파일정보삭제
		}
	} else {																	//그외(Guest인 경우:패스워드 check)
		int delOk = 0;
		delOk = bbsmanager.checkBoardPass(strBbsId, MAS_BBS_ID, strBbsPass);
		if (delOk == 0) {
			out.println("<script language='javascript' type='text/javascript'>");
			out.println("alert('비밀번호가 일치하지 않습니다.');");
			out.println("history.back();");
			out.println("</script>");
		} else {
			
			int isReply = bbsmanager.isReply(req);
			if (isReply == 1) {       //하위글 있음(삭제안됨)
				out.println("<script language='javascript' type='text/javascript'>");
				out.println("alert('하위에 등록된 답변이 있어서 삭제 할 수 없습니다.');");
				out.println("history.back();");
				out.println("</script>");
			} else { //게시물(댓글삭제, 파일정보삭제, 파일삭제)
				bbsmanager.bbsDelete(req);
				MRequest mReq = new MRequest(request);
			    filemanager.deleteFiles(mReq, DATA_ROOT, MAS_BBS_ID, strBbsId);  //파일삭제, 파일정보삭제
			}
		}
	}
	
%>

	
	<script language="javascript" type="text/javascript">
		document.wForm.submit();
	</script>
</body>
</html>
