<%@ page language="java" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
<%@ page errorPage="/error/error_view.jsp" %>
<%@ include file="/common/inc/config.jsp" %>
<%@ include file="/admin/include/check_admin.jsp" %>
<%@ page import="com.maninsoft.smart.homepage.admin.function.Function" %>
<%@ page import="com.maninsoft.smart.homepage.request.*" %>
<%@ page import="com.maninsoft.smart.homepage.bbs.master.*" %>
<%@ page import="com.maninsoft.smart.homepage.bbs.attach.*" %>
<%@ page import="com.maninsoft.smart.homepage.bbs.*" %>
<%@ page import="com.maninsoft.smart.homepage.util.ConvertText" %>
<%@ page import="java.util.ArrayList" %>
<%
	Function function = Function.getInstance();
	Request req = new Request(request);
	MasterManager masmanager = MasterManager.getInstance();
	BbsManager bbsmanager = BbsManager.getInstance();
	BbsBean board = new BbsBean();
	AttachManager filemanager = AttachManager.getInstance();

	//MAS_BBS_ID parameter
	String MAS_BBS_ID = req.getString("masBbsId");

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

	int curPage = 1;
	int pageSize = 10;
	String searchType = "";
	String searchText = "";
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
	
	String strBbsId = req.getParameter("bbsId");

	board = bbsmanager.bbsView(req, MAS_BBS_ID);
	String strTitle = board.getBbsTitle();
	String strContents = board.getBbsContents();
	String strUserId = board.getBbsUsrId();
	String strUserName = board.getBbsUsrName();
	String strUserEmail = board.getBbsUsrEmail();
	String strSection = board.getBbsSection();
	int intDepth = board.getBbsDepth();

	String flagHtml = board.getBbsHtml();
	if (flagHtml == null) { flagHtml = "0"; }
	String flagNotice = board.getBbsNotice();
	if (flagNotice == null) { flagNotice = "0"; }
	String flagSecret = board.getBbsSecret();
	if (flagNotice == null) { flagNotice = "0"; }

	int isChangeNotice = bbsmanager.isChangeNotice(req);

	//ConvertText TEXT
	ConvertText convert = ConvertText.getInstance();
	strTitle = convert.convertEditText(strTitle);
	strContents = convert.convertEditText(strContents);

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
		<%=function.getTitleBox(ADMIN_IMG, "FAQ 수정")%>
		<form name="wForm" method="post" action="modify_ok.jsp?masBbsId=<%=MAS_BBS_ID%>" enctype="multipart/form-data">
			<input type="hidden" name="id" value="<%=strUserId%>">
			<input type="hidden" name="oldHtml" value="<%=flagHtml%>">
			<input type="hidden" name="oldNotice" value="<%=flagNotice%>">
			<input type="hidden" name="oldSecret" value="<%=flagSecret%>">
			<input type="hidden" name="masBbsId" value="<%=MAS_BBS_ID%>">
			<input type="hidden" name="bbsId" value="<%=strBbsId%>">
			<input type="hidden" name="depth" value="<%=intDepth%>">
			<input type="hidden" name="no" value="">
			<input type="hidden" name="page" value="<%=curPage%>">
			<input type="hidden" name="searchType" value="<%=searchType%>">
			<input type="hidden" name="searchText" value="<%=searchText%>">
			<input type="hidden" id="vSection" name="vSection" value="<%=vSection%>">
			<table width="100%" border="0" cellpadding="0" cellspacing="0" class="t_b_bottom">
				<tr>
					<td width="13%" class="t_thC">작성자</td>
					<td width="" class="t_tdL">
						<input class="input" type="text" name="name" value="<%=strUserName%>" style="width:25%" maxlength="100">
					</td>
				</tr>
				<tr>
					<td width="13%" class="t_thC">이메일</td>
					<td width="" class="t_tdL">
						<input class="input" type="text" name="email" value="<%=strUserEmail%>" style="width:25%" maxlength="100">
					</td>
				</tr>
				<tr>
					<td width="13%" class="t_thC">제목</td>
					<td width="" class="t_tdL">
						<input class="input" type="text" name="title" value="<%=strTitle %>" style="width:60%" maxlength="100">
						<% if (isChangeNotice == 1) {%> 
						<input type="checkbox" name="notice" value="1" onclick="change_notice()" <%if (flagNotice.equals("1")){ out.println("checked");}%>> 알림글&nbsp;&nbsp;
						<% } %>
						<%--<input type="checkbox" name="html" value="1" onclick="change_html()" <% if (flagHtml.equals("1")) { out.println("checked='checked'"); } %>> HTML --%>
					</td>
				</tr>
				<tr>
					<td width="13%" class="t_thC">구분</td>
					<td width="" class="t_tdL">
						<input type="radio" name="section" value="0" <% if (strSection.equals("0")) { out.println("checked='checked'"); } %>>
						전체
						<input type="radio" name="section" value="1" <% if (strSection.equals("1")) { out.println("checked='checked'"); } %>>
						홈페이지
						<input type="radio" name="section" value="2" <% if (strSection.equals("2")) { out.println("checked='checked'"); } %>>
						앱스토어
						<input type="radio" name="section" value="3" <% if (strSection.equals("3")) { out.println("checked='checked'"); } %>>
						스마트웍스닷넷
					</td>
				</tr>
				<tr>
					<td width="13%" class="t_thC">내용</td>
					<td width="" class="t_tdL">
						<textarea name="ir1" id="ir1" style="width:97%; height:220px; display:none;"><%=strContents%></textarea>
						<textarea name="contents" id="contents" style="display:none;"></textarea>
					</td>
				</tr>
				<% if (boardConfig.indexOf("F") >= 0) {%>
				<tr>
					<td width="13%" class="t_thC">기존파일</td>
					<td width="" class="t_tdL">
						<div class="write_file_area">
							<%
								//등록된 파일을 가져온다.
								ArrayList fileArray = filemanager.getSimpleFileList(req, MAS_BBS_ID);
								int orgFileCount = 0;
							%>
							<ul>
							<%
								for (int i = 1; i <= fileArray.size(); i++) {
									orgFileCount = orgFileCount + 1;
									AttachBean attach = new AttachBean();
									attach = (AttachBean) fileArray.get(i-1);
									int achIdx = attach.getAchIdx();
									String fileName = attach.getAchFileName();
									String filePath = attach.getAchFilePath();
									String fileSize = attach.getAchFileSize();
							%>
								<li class="write_file_list1"><%=fileName%>
									<input type="hidden" name="orgFile<%=i%>" value="<%=fileName%>">
                                  					<input type="hidden" name="fileId<%=i%>" value="<%=achIdx%>">
									<span class="write_file_delete_check">삭제 <input type="checkbox" name="delFlag<%=i%>" value="1"></span>
								</li>
							<%
								} //for (int i = 1; i <= fileArray.size(); i++) {
							%>
							</ul>
							<input type="hidden" name="orgfile_count" value="<%=orgFileCount%>">
						</div>
					</td>
				</tr>
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
			<span class="btn_sub" onclick="javascript:go_editor_save();"><img alt="" src="<%=IMG_ROOT%>/icons/btn_icon_ok.gif" /><a onfocus="this.blur();">수 정</a></span>
			<span class="btn_sub" onclick="javascript:go_list();"><img alt="" src="<%=IMG_ROOT%>/icons/btn_icon_cancel.gif" /><a onfocus="this.blur();">취  소</a></span>
		</div>

		<!--도움말 부분-->
		<%=function.getTipBoxTop(ADMIN_IMG)%>
			FAQ를 수정합니다.<br>
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

