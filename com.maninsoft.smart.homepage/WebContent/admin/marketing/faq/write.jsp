<%@ page language="java" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
<%@ page errorPage="/error/error_view.jsp" %>
<%@ include file="/common/inc/config.jsp" %>
<%@ include file="/admin/include/check_admin.jsp" %>
<%@ page import="com.maninsoft.smart.homepage.admin.function.Function" %>
<%@ page import="com.maninsoft.smart.homepage.request.*" %>
<%@ page import="com.maninsoft.smart.homepage.bbs.master.*" %>
<%
	Function function = Function.getInstance();
	Request req = new Request(request);
	MasterManager masmanager = MasterManager.getInstance();

	//MAS_BBS_ID parameter
	String MAS_BBS_ID = req.getString("masBbsId");
	
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
	
	int curPage = 1;
	int pageSize = 15;
	String searchType = "";
	String searchText = "";
	String vType = "1";
	String vSection = "0";
	
	if (request.getParameter("page") != null) {
		curPage = Integer.parseInt(request.getParameter("page"));
	}
	if (request.getParameter("searchType") != null) {
		searchType = request.getParameter("searchType");
	}
	if (request.getParameter("searchText") != null) {
		searchText = request.getParameter("searchText");
	}
	if (request.getParameter("vSection") != null) {
		vSection = request.getParameter("vSection");
	}

%>
<html>
<head>
<title>
<%= SITE_TITLE_ADMIN %>
</title>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<link href="<%=ROOT_DIR%>/common/css/admin/common.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" type="text/css" href="<%=ROOT_DIR%>/common/css/bbs/board.css">
<script language="javascript" type="text/javascript" src="<%=ROOT_DIR%>/common/js/common.js"></script>
<script language="javascript" src="<%=ROOT_DIR%>/common/js/bbs/board.js"></script>
<link rel="stylesheet" type="text/css" href="<%=ROOT_DIR%>/smarteditor/css/default.css">
<script language="javascript" type="text/javascript" src="<%=ROOT_DIR%>/smarteditor/js/HuskyEZCreator.js" charset="utf-8"></script>
<script language="JavaScript" type="text/JavaScript">
<!--

//-->
</script>
</head>
<body>
	<div id="conTents">
		<%=function.getTitleBox(ADMIN_IMG, "FAQ 추가")%>
		<form name="wForm" method="post" action="write_ok.jsp?masBbsId=<%=MAS_BBS_ID%>" enctype="multipart/form-data">
			<table width="100%" border="0" cellpadding="0" cellspacing="0" class="t_b_bottom">
				<tr>
					<td width="13%" class="t_thC">작성자</td>
					<td width="" class="t_tdL">
						<input class="input" type="text" name="name" value="<%=S_NAME%>" style="width:25%" maxlength="100">
						<input name="id" type="hidden" value="<%=S_ID%>">
					</td>
				</tr>
				<tr>
					<td width="13%" class="t_thC">이메일</td>
					<td width="" class="t_tdL">
						<input class="input" type="text" name="email" value="<%=S_EMAIL%>" style="width:25%" maxlength="100">
					</td>
				</tr>
				<tr>
					<td width="13%" class="t_thC">구분</td>
					<td width="" class="t_tdL">
						<input type="radio" name="section" value="0" checked="checked">
						전체
						<input type="radio" name="section" value="1">
						홈페이지
						<input type="radio" name="section" value="2">
						앱스토어
						<input type="radio" name="section" value="3">
						스마트웍스닷넷
					</td>
				</tr>
				<tr>
					<td width="13%" class="t_thC">제목</td>
					<td width="" class="t_tdL">
						<input class="input" type="text" name="title" style="width:60%" maxlength="100">
						<%--
						<input type="checkbox" name="html" value="1">
						<strong>HTML</strong>&nbsp;&nbsp;
						 --%>
						<input type="checkbox" name="notice" value="1">
						<strong>알림글</strong>
					</td>
				</tr>
				<tr>
					<td width="13%" class="t_thC">내용</td>
					<td width="" class="t_tdL">
						<textarea name="ir1" id="ir1" style="width:97%; height:220px; display:none;"></textarea>
						<textarea name="contents" id="contents" style="display:none;"></textarea>
					</td>
				</tr>
				<% if (boardConfig.indexOf("F") >= 0) {%>
				<tr>
					<td width="13%" class="t_thC">첨부</td>
					<td width="" class="t_tdL">
						<table width="100%" border="0" cellspacing="0" cellpadding="0">
							<tr>
								<td width="65" id="attach_file_area" class="write_attach_file" valign="top">
									<input type="hidden" name="attach_count" id="attach_count" value="0">
									<script language="javascript" type="text/javascript">
										init_attach_file();
									</script>
								</td>
								<td class="write_input_pd">
									<div id="attach_list_area" class="write_file_area">
										<ul id="attach_list">
										</ul>
									</div>
								</td>
							</tr>
						</table>
					</td>
				</tr>
				<% } %>
			</table>
		</form>
    
		<div id="button">
			<span class="btn_sub" onclick="javascript:go_editor_save();"><img alt="" src="<%=IMG_ROOT%>/icons/btn_icon_ok.gif" /><a onfocus="this.blur();">등 록</a></span>
			<span class="btn_sub" onclick="javascript:go_list();"><img alt="" src="<%=IMG_ROOT%>/icons/btn_icon_cancel.gif" /><a onfocus="this.blur();">취  소</a></span>
		</div>

		<!--도움말 부분-->
		<%=function.getTipBoxTop(ADMIN_IMG)%>
			FAQ를 추가합니다.<br>
		<%=function.getTipBoxBottom()%>

	  	<form name="bForm" method="post" action="list.jsp">
			<input type="hidden" id="masBbsId" name="masBbsId" value="<%=MAS_BBS_ID%>">
			<input type="hidden" id="bbsId" name="bbsId" value="">
			<input type="hidden" id="no" name="no" value="">
			<input type="hidden" id="page" name="page" value="<%=curPage%>">
			<input type="hidden" id="searchType" name="searchType" value="<%=searchType%>">
			<input type="hidden" id="searchText" name="searchText" value="<%=searchText%>">
			<input type="hidden" id="vSection" name="vSection" value="<%=vSection%>">
		</form>
	</div>
	<script language="javascript" type="text/javascript">
		var oEditors = [];
		nhn.husky.EZCreator.createInIFrame({
			oAppRef: oEditors,
			elPlaceHolder: "ir1",
			sSkinURI: "<%=ROOT_DIR%>/smarteditor/SEditorSkin.html",
			fCreator: "createSEditorInIFrame"
		});
	
		function go_editor_save() {
			oEditors.getById["ir1"].exec("UPDATE_IR_FIELD", []);
			document.wForm.contents.value = oEditors.getById["ir1"].getIR();
			go_save();
		}
	</script>
</body>
</html>

