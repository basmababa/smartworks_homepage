<%@ page language="java" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
<%@ page errorPage="/error/error_view.jsp" %>
<%@ include file="/common/inc/config.jsp" %>
<%@ page import="com.maninsoft.smart.homepage.request.*" %>
<%@ page import="com.maninsoft.smart.homepage.bbs.*" %>
<%@ page import="com.maninsoft.smart.homepage.bbs.master.*" %>
<%@ page import="com.maninsoft.smart.homepage.member.*" %>
<%@ page import="com.maninsoft.smart.homepage.admin.mail.*" %>
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

	//접근권한 체크(Modify 페이지)
	if (accessLevel.indexOf("W") < 0) {
  		response.sendRedirect(ROOT_DIR);
	}
	
	int modifyOk = 0;
	//modifyOk = bbsmanager.bbsModify(mReq, DATA_ROOT, MAS_BBS_ID, S_LEVEL, S_ID);
	modifyOk = bbsmanager.bbsModify(mReq, DATA_ROOT, MAS_BBS_ID, accessLevel, S_ID);
	
	if (modifyOk != 0 && boardConfig.indexOf("M") >= 0) {	//관리자에게 메일쓰기
		
		MemberBean member = new MemberBean();
		MemberManager manager = MemberManager.getInstance();
		
		//관리자의 정보를 가져온다(email)
		member = manager.getAdmin();
		String admin_email = "admin@maninsoft.co.kr";
		
		if (member != null){
			admin_email = member.getMemEmail();
		}
		
		String mail_to = admin_email;
		String mail_from = admin_email;
		String mail_subjet = "[" + boardName + "] 수정하기 :: " + mReq.getParameter("title");
		
		String mail_contents =  mReq.getParameter("contents");
			
		int sendMsgCount = 0;
		sendMsgCount = MailManager.getInstance().SendMail2(mail_to, mail_from, mail_subjet, mail_contents);
	}
	
	int curPage = 1;
	int pageSize = 10;
	String searchType = "";
	String searchText = "";
	String vSection = "";
	
	if (mReq.getParameter("page") != null) {
		curPage = Integer.parseInt(mReq.getParameter("page"));
	}
	if (mReq.getParameter("searchType") != null) {
		searchType = mReq.getParameter("searchType");
	}
	if (mReq.getParameter("searchText") != null) {
		searchText = mReq.getParameter("searchText");
	}
	if (mReq.getParameter("vSection") != null) {
		vSection = mReq.getParameter("vSection");
	}
	
	String strBbsId = mReq.getParameter("bbsId");
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
	<form name="wForm" method="post" action="view.jsp">
		<input type="hidden" name="masBbsId" value="<%=MAS_BBS_ID%>">
		<input type="hidden" name="bbsId" value="<%=strBbsId%>">
		<input type="hidden" name="page" value="<%=curPage%>">
		<input type="hidden" name="searchType" value="<%=searchType%>">
		<input type="hidden" name="searchText" value="<%=searchText%>">
		<input type="hidden" id="vSection" name="vSection" value="<%=vSection%>">
	</form>
<%
	if (modifyOk == 0) {
		out.println("<script language='javascript' type='text/javascript'>");
		out.println("alert('비밀번호가 일치하지 않습니다.');");
		out.println("document.wForm.submit();");
		out.println("</script>");
	} else {
		out.println("<script language='javascript' type='text/javascript'>");
		out.println("document.wForm.submit();");
		out.println("</script>");
	}
%>

</body>
</html>
