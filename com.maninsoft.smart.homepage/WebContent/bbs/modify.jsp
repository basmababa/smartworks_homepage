<%@ page language="java" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
<%@ page errorPage="/error/error_view.jsp" %>
<%@ include file="/common/inc/config.jsp" %>
<%@ include file="info.jsp" %>
<%@ page import="com.maninsoft.smart.homepage.request.*" %>
<%@ page import="com.maninsoft.smart.homepage.bbs.master.*" %>
<%@ page import="com.maninsoft.smart.homepage.bbs.*" %>
<%@ page import="com.maninsoft.smart.homepage.bbs.attach.*" %>
<%@ page import="com.maninsoft.smart.homepage.util.ConvertText" %>
<%@ page import="java.util.ArrayList" %>
<%
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
	
	//page info
	String PAGE_INFO = "menu04_sub01";
	String strBbsImg = "popmain_stitle05_01.jpg";
	if (MAS_BBS_ID.equals("bbs_notice")) {
		PAGE_INFO = "menu04_sub01";
		strBbsImg = "popmain_stitle05_01.jpg";
	} else if (MAS_BBS_ID.equals("bbs_qna")) {
		PAGE_INFO = "menu04_sub03";
		strBbsImg = "popmain_stitle05_03.jpg";
	} else if (MAS_BBS_ID.equals("bbs_proposal")) {
		PAGE_INFO = "menu04_sub04";
		strBbsImg = "popmain_stitle05_04.jpg";
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
	String strHp = board.getBbsHp();
	if (strHp == null) { strHp = ""; }
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
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>
<%=SITE_TITLE %>
</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link rel="stylesheet" type="text/css" href="<%=ROOT_DIR%>/common/css/common.css">
<link rel="stylesheet" type="text/css" href="<%=ROOT_DIR%>/common/css/bbs/board.css">
<link rel="stylesheet" type="text/css" href="<%=ROOT_DIR%>/common/css/tooltip/tooltip.css">
<script language="javascript" type="text/javascript" src="<%=ROOT_DIR%>/common/js/common.js"></script>
<script language="javascript" type="text/javascript" src="<%=ROOT_DIR%>/common/js/menu_action.js"></script>
<script language="javascript" type="text/javascript" src="<%=ROOT_DIR%>/common/js/bbs/board.js"></script>
<link rel="stylesheet" type="text/css" href="<%=ROOT_DIR%>/smarteditor/css/default.css">
<script language="javascript" type="text/javascript" src="<%=ROOT_DIR%>/smarteditor/js/HuskyEZCreator.js" charset="utf-8"></script>
<script language="javascript" type="text/javascript">
</script>
</head>
<body>
	<jsp:include page="/include/hidden.jsp" flush="true"></jsp:include>
	<div id="cbody">
		<div id="wrap">
			<div id="header">
				<jsp:include page="/include/header.jsp" flush="true"></jsp:include>
			</div>
			<div id="mainwrap">
				<div id="left">
					<jsp:include page="/include/left.jsp" flush="true">
						<jsp:param name="category" value="<%=CATEGORY_SECTION %>" />
						<jsp:param name="pageInfo" value="<%=PAGE_INFO %>" />
					</jsp:include>
				</div>
				<div id="contents">
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
						<table width="770" border="0" cellspacing="0" cellpadding="0">
							<tr>
								<td colspan="2"><img src="<%=IMG_ROOT %>/customer_title.jpg" width="769" height="86" alt="고객센터"></td>
							</tr>
							<tr>
								<td colspan="2" align="right">
									<table width="500" border="0" cellspacing="0" cellpadding="0">
										<tr>
											<td width="486" align="right">
												<a href="javascript:go_home();"><strong>HOME</strong></a> &gt;
												<a href="javascript:menu04_sub01();">고객센터</a> &gt;
												<%=boardName %>
											</td>
											<td width="14">&nbsp;</td>
										</tr>
									</table>
								</td>
							</tr>
							<tr>
								<td colspan="2"><img src="<%=IMG_ROOT %>/<%=strBbsImg %>" align="top" alt="<%=boardName %>"></td>
							</tr>
							<tr>
								<td>&nbsp;</td>
							</tr>
							<tr>
								<td>
									<table width="731" border="0" cellspacing="0" cellpadding="0">
										<tr align="center">
											<td width="731" height="20" background="<%=IMG_ROOT %>/customer_faq_li01.jpg">&nbsp;</td>
										</tr>
										<tr align="center">
											<td>
												<table width="682" border="0" cellspacing="0" cellpadding="0">
													<tr>
														<td align="center" height="1" background="<%=IMG_ROOT %>/dotline.gif"></td>
													</tr>
													<tr>
														<td align="center" height="5"></td>
													</tr>
												</table>
												<table width="682" border="0" cellpadding="0" cellspacing="1">
													<tr>
														<td width="86" height="25" align="center" bgcolor="#8cb2e3" class="txwhiteb">제 목 </td>
														<td width="2" align="center" class="txwhiteb">&nbsp;</td>
														<td colspan="4" align="left" bgcolor="#FFFFFF">
															<input type="text" name="title" style="width:99.5%;border:1px solid #d4cfcc;" value="<%=strTitle%>">
														</td>
													</tr>
													<tr>
														<td width="86" height="25" align="center" bgcolor="#8cb2e3" class="txwhiteb">작성자</td>
														<td width="2" height="25" align="center" class="txwhiteb">&nbsp;</td>
														<td width="262" align="left" bgcolor="#FFFFFF">
															<input type="text" name="name"  value="<%=strUserName%>" style="width:94%;border:1px solid #d4cfcc;">
														</td>
														<td width="74" align="center" bgcolor="#8cb2e3" class="txwhiteb">이메일</td>
														<td width="2" align="center" class="txwhiteb">&nbsp;</td>
														<td width="248" align="left" bgcolor="#FFFFFF">
															<input type="text" name="email" value="<%=strUserEmail %>" style="width:99%;border:1px solid #d4cfcc;">
														</td>
													</tr>
													<%
														if (accessLevel.indexOf("S") > 0 || (!S_ID.equals("") && S_ID.equals(strUserId))) {  //글쓴이가 같거나 관리자의 경우는 바로 수정
				                                    	} else {
													%>
													<tr>
														<td width="86" height="25" align="center" bgcolor="#8cb2e3" class="txwhiteb">비밀번호</td>
														<td width="2" height="25" align="center" class="txwhiteb">&nbsp;</td>
														<td align="left" bgcolor="#FFFFFF">
															<input type="password" name="password" style="width:94%;border:1px solid #d4cfcc;">
														</td>
														<td align="center" bgcolor="#8cb2e3"><span class="txwhiteb">연락처</span></td>
														<td width="2" align="center">&nbsp;</td>
														<td align="left" bgcolor="#FFFFFF">
															<input type="text" name="hp" style="width:99%;border:1px solid #d4cfcc;" value="<%=strHp %>">
														</td>
													</tr>
													<% } %>
													<tr>
														<td width="86" height="25" align="center" bgcolor="#8cb2e3" class="txwhiteb">구 분 </td>
														<td width="2" height="25" align="center" class="txwhiteb">&nbsp;</td>
														<td colspan="4" align="left" bgcolor="#FFFFFF">
															<table width="400" border="0" cellspacing="0" cellpadding="0">
																<tr>
																	<td bgcolor="#e7f3ff" style="padding-left:2px;">
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
															</table>
														</td>
													</tr>
													<tr>
														<td width="86" height="25" align="center" bgcolor="#8cb2e3" class="txwhiteb">옵 션 </td>
														<td width="2" height="25" align="center" class="txwhiteb">&nbsp;</td>
														<td colspan="4" align="left" bgcolor="#FFFFFF">
															<table width="400" border="0" cellspacing="0" cellpadding="0">
																<tr>
																	<td width="399" bgcolor="#e7f3ff">
																		<input type="checkbox" name="secret" value="1" onclick="change_secret()" <% if (flagSecret.equals("1")) { out.println("checked='checked'"); } %>> 비밀글&nbsp;&nbsp;
																		<% if (accessLevel.indexOf("S") > 0) { %>
																			<% if (isChangeNotice == 1) {%> 
																			<input type="checkbox" name="notice" value="1" onclick="change_notice()" <%if (flagNotice.equals("1")){ out.println("checked");}%>> 알림글&nbsp;&nbsp;
																			<% } %>
																			<%--<input type="checkbox" name="html" value="1" onclick="change_html()" <% if (flagHtml.equals("1")) { out.println("checked='checked'"); } %>> HTML --%>
																		<% } //if (accessLevel.indexOf("S") > 0) { %>
																	</td>
																</tr>
															</table>
														</td>
													</tr>
													<tr>
														<td width="86" height="25" align="center" bgcolor="#8cb2e3" class="txwhiteb">내용</td>
														<td width="2" height="25" align="center" class="txwhiteb">&nbsp;</td>
														<td colspan="4" align="left" bgcolor="#FFFFFF">
															<textarea name="ir1" id="ir1" style="width:99%; height:220px; display:none;"><%=strContents%></textarea>
															<textarea name="contents" id="contents" style="display:none;"></textarea>
														</td>
													</tr>
													<% if (boardConfig.indexOf("F") >= 0) {%>
													<tr>
														<td width="86" height="25" align="center" bgcolor="#8cb2e3" class="txwhiteb">기존파일</td>
														<td width="2" height="25" align="center" class="txwhiteb">&nbsp;</td>
														<td colspan="4" align="left" bgcolor="#FFFFFF">
															<div class="write_file_area" style="width:99%;">
																<%
																	//등록된 파일을 가져온다.
																	ArrayList fileArray = filemanager.getSimpleFileList(req, MAS_BBS_ID);
																	int orgFileCount = 0;
																%>
																<ul style="list-style:none;">
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
														<td width="86" height="25" align="center" bgcolor="#8cb2e3" class="txwhiteb">첨부파일</td>
														<td width="2" height="25" align="center" class="txwhiteb">&nbsp;</td>
														<td colspan="4" align="left" bgcolor="#FFFFFF">
															<table width="99%" border="0" cellspacing="0" cellpadding="0">
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
												<table width="682" border="0" cellspacing="0" cellpadding="0">   
													<tr>
														<td align="center" height="5"></td>
													</tr>
													<tr>
														<td align="center" height="1" background="<%=IMG_ROOT%>/dotline.gif"></td>
													</tr>
												</table>
											</td>
										</tr>
										<tr align="center">
											<td height="22" background="<%=IMG_ROOT%>/customer_faq_bli01.jpg">&nbsp;</td>
										</tr>
										<tr align="center">
											<td>
												<table width="700" height="30" border="0" cellpadding="0" cellspacing="0">
													<tr>
														<td width="686" align="right" valign="bottom">
															<img src="<%=IMG_ROOT%>/btn_confirm.jpg" width="54" height="23" alt="" onclick="go_editor_save()" style="cursor:pointer;">
															<img src="<%=IMG_ROOT%>/btn_list.jpg" width="50" height="23" alt="" onclick="go_list();" style="cursor:pointer;">
														</td>
														<td width="14" align="right" valign="bottom">&nbsp;</td>
													</tr>
												</table>
											</td>
										</tr>
									</table>
								</td>
							</tr>
						</table>
					</form>
				</div>
				<div id="right">
					<jsp:include page="/include/quickMenu.jsp" flush="true"></jsp:include>
				</div>
			</div>
			<div id="footer">
		    	<jsp:include page="/include/footer.jsp" flush="true"></jsp:include>
			</div>
		</div>
	</div>
	<form name="bForm" method="post" action="list.jsp">
		<input type="hidden" id="masBbsId" name="masBbsId" value="<%=MAS_BBS_ID%>">
		<input type="hidden" id="bbsId" name="bbsId" value="">
		<input type="hidden" id="no" name="no" value="">
		<input type="hidden" id="page" name="page" value="<%=curPage%>">
		<input type="hidden" id="searchType" name="searchType" value="<%=searchType%>">
		<input type="hidden" id="searchText" name="searchText" value="<%=searchText%>">
		<input type="hidden" id="vSection" name="vSection" value="<%=vSection%>">
	</form>
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
