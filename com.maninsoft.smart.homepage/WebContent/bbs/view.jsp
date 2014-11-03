<%@ page language="java" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
<%@ page errorPage="/error/error_view.jsp" %>
<%@ include file="/common/inc/config.jsp" %>
<%@ include file="info.jsp" %>
<%@ page import="com.maninsoft.smart.homepage.request.*" %>
<%@ page import="com.maninsoft.smart.homepage.bbs.*" %>
<%@ page import="com.maninsoft.smart.homepage.bbs.master.*" %>
<%@ page import="com.maninsoft.smart.homepage.bbs.attach.*" %>
<%@ page import="com.maninsoft.smart.homepage.util.ConvertText" %>
<%@ page import="com.maninsoft.smart.homepage.util.ImageManager" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.io.File" %>
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

	//접근권한 체크(View 페이지)
	if (accessLevel.indexOf("V") < 0) {
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
	String strNo = req.getParameter("no");
	
	//ConvertText
	ConvertText convert = ConvertText.getInstance();
	
	//Read Count 증가
	bbsmanager.addCount(req, MAS_BBS_ID);
	//View Page의 정보를 가져온다.
	board = bbsmanager.bbsView(req, MAS_BBS_ID);
		
	int intDepth = board.getBbsDepth();
	String strTitle = convert.convertStringText(board.getBbsTitle());
	String strUsrName = convert.convertStringText(board.getBbsUsrName());
	String strUsrId = board.getBbsUsrId();
	String strUsrEmail =  convert.convertStringText(board.getBbsUsrEmail());
	String strWdate = board.getBbsWdate().toString().substring(0,16);
	int readCount = board.getBbsRefer();
	int intGood = board.getBbsGood();
	String strContents = board.getBbsContents();
	String strHostIp = board.getBbsHost();
	String strSecret = board.getBbsSecret();
	String strSection = board.getBbsSection();
	String strHp = board.getBbsHp();
	if (strHp == null) { strHp = ""; }
	
	String strBbsPass = req.getParameter("bbsPass");

	int viewOk = 0;
	if (accessLevel.indexOf("S") > 0 || (!S_ID.equals("") && S_ID.equals(strUsrId))) {  //관리자 이거나 글쓴이일 경우
	} else {
		if (strSecret.equals("1")) {
			viewOk = bbsmanager.checkBoardPass(strBbsId, MAS_BBS_ID, strBbsPass);
			if (viewOk == 0) {
				out.println("<script language='javascript' type='text/javascript'>");
				out.println("alert('비밀번호가 일치하지 않습니다.');");
				out.println("history.back();");
				out.println("</script>");
			}
		}
	}

	String strMsgSection = "";
	if (strSection.equals("0")) {
		strMsgSection = "공통";
	} else if (strSection.equals("1")) {
		strMsgSection = "홈페이지";
	} else if (strSection.equals("2")) {
		strMsgSection = "앱스토어";
	} else if (strSection.equals("3")) {
		strMsgSection = "스마트웍스닷넷";
	}
	
	String flagNotice = board.getBbsNotice();
	String flagHtml = board.getBbsHtml();
	if (flagHtml == null) { flagHtml = "0"; }

	//if (flagHtml.equals("0")) {		//스트링 형식
	//	strContents = convert.convertStringText(strContents);
	//} else {						//HTML 형식
	//	strContents = convert.convertTagText(strContents);
	//}
	//strContents = convert.convertTagText(strContents);
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
<link rel="stylesheet" type="text/css" href="<%=ROOT_DIR%>/smarteditor/css/style.css">
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
										<td width="731" height="20" background="<%=IMG_ROOT%>/customer_faq_li01.jpg">&nbsp;</td>
									</tr>
									<tr align="center">
										<td>
											<table width="682" border="0" cellspacing="0" cellpadding="0">
												<tr>
													<td align="center" height="1" background="<%=IMG_ROOT%>/dotline.gif"></td>
												</tr>
												<tr>
													<td align="center" height="5"></td>
												</tr>
											</table>
											<table width="682" border="0" cellpadding="0" cellspacing="2">
												<tr>
													<td width="90" height="25" align="center" bgcolor="#8cb2e3" class="txwhiteb">제 목 </td>
													<td width="2" align="center" class="txwhiteb">&nbsp;</td>
													<td width="590" colspan="4" align="left" bgcolor="#FFFFFF"><%=strTitle %></td>
												</tr>
												<tr>
													<td align="center" height="1" colspan="6" background="<%=IMG_ROOT%>/dotline.gif"></td>
												</tr>
												<tr>
													<td width="90" height="25" align="center" bgcolor="#8cb2e3" class="txwhiteb">작성자</td>
													<td width="2" height="25" align="center" class="txwhiteb">&nbsp;</td>
													<td width="230" align="left" bgcolor="#FFFFFF"><%=strUsrName%></td>
													<td width="91" align="center" bgcolor="#8cb2e3" class="txwhiteb">이메일</td>
													<td width="2" align="center" class="txwhiteb">&nbsp;</td>
													<td width="267" align="left" bgcolor="#FFFFFF"><%=strUsrEmail%></td>
												</tr>
												<tr>
													<td align="center" height="1" colspan="6" background="<%=IMG_ROOT%>/dotline.gif"></td>
												</tr>
												<% if (accessLevel.indexOf("S") > 0) { %>
												<tr>
													<td width="90" height="25" align="center" bgcolor="#8cb2e3" class="txwhiteb">연락처</td>
													<td width="2" height="25" align="center" class="txwhiteb">&nbsp;</td>
													<td width="230" align="left" bgcolor="#FFFFFF"><%=strHp%></td>
													<td width="91" align="center" bgcolor="#8cb2e3" class="txwhiteb">HOST IP</td>
													<td width="2" align="center" class="txwhiteb">&nbsp;</td>
													<td width="267" align="left" bgcolor="#FFFFFF"><%=strHostIp%></td>
												</tr>
												<tr>
													<td align="center" height="1" colspan="6" background="<%=IMG_ROOT%>/dotline.gif"></td>
												</tr>
												<% } %>
												<tr>
													<td width="90" height="25" align="center" bgcolor="#8cb2e3" class="txwhiteb">구 분</td>
													<td width="2" height="25" align="center" class="txwhiteb">&nbsp;</td>
													<td colspan="4" width="590" align="left" bgcolor="#FFFFFF"><%=strMsgSection %> </td>
												</tr>
												<tr>
													<td align="center" height="1" colspan="6" background="<%=IMG_ROOT%>/dotline.gif"></td>
												</tr>
												<%
													if (boardConfig.indexOf("F") >= 0) {
														ArrayList fileArray = filemanager.getSimpleFileList(req, MAS_BBS_ID); //등록된 파일을 가져온다.
												%>
												<tr>
													<td width="90" height="25" align="center" bgcolor="#8cb2e3" class="txwhiteb">첨부파일</td>
													<td width="2" height="25" align="center" class="txwhiteb">&nbsp;</td>
													<td colspan="4" width="590" align="left" bgcolor="#FFFFFF">
														<table width="400" border="0" cellspacing="0" cellpadding="0">
														<%
															for (int i = 0; i < fileArray.size(); i++) {
																AttachBean attach = new AttachBean();
																attach = (AttachBean) fileArray.get(i);
																int achIdx = attach.getAchIdx();
																String fileName = attach.getAchFileName();
																String filePath = attach.getAchFilePath();
																String fileSize = attach.getAchFileSize();
																//int intFileSize = Integer.parseInt(fileSize) / 1024;
														 %>
															<tr>
																<td style="padding-left:2px;">
																	<a href="<%=ROOT_DIR%>/servlet/AttachmentDownloadServlet?DATA_DIR=<%=DATA_DIR %>&achIdx=<%=achIdx%>&masBbsId=<%=MAS_BBS_ID%>">
																		<img src="<%=IMG_ROOT%>/bbs/icon_disk.gif" alt="첨부파일 다운" align="middle"> <%=fileName%> (<%=fileSize%> byte)
																	</a>
																</td>
															</tr>
														<% } %>
														</table>
													</td>
												</tr>
												<tr>
													<td align="center" height="1" colspan="6" background="<%=IMG_ROOT%>/dotline.gif"></td>
												</tr>
												<%
													}
												%>
												<tr>
													<td width="90" height="25" align="center" bgcolor="#8cb2e3" class="txwhiteb">내용</td>
													<td width="2" height="25" align="center" class="txwhiteb">&nbsp;</td>
													<td colspan="4" width="590" align="left" height="120" valign="top" bgcolor="#FFFFFF" class="smartOutput" style="padding:2px 2px 2px 0px;">
														<%--
														<% if (flagHtml.equals("0")) { //html mode가 아닐경우%>
														<%
															ArrayList imgArray = filemanager.getSimpleFileList(req, MAS_BBS_ID);
			
															//ImageManager
															ImageManager imgmanager = ImageManager.getInstance();
			
															for (int i=0 ; i<imgArray.size() ; i++) {
																AttachBean attach = new AttachBean();
																attach = (AttachBean) imgArray.get(i);
			
																int imgId = attach.getAchIdx();
																String imgName = attach.getAchFileName();
																String imgPath = ROOT_DIR + DATA_URL + attach.getAchFilePath();
																String strMidThumbNail = imgName.substring(0,imgName.lastIndexOf(".")) + "_thumb.jpg";
			
																String imgType = imgName.substring(imgName.lastIndexOf(".")+1,imgName.length()).toUpperCase();
																if (imgType.equals("GIF") || imgType.equals("JPG") || imgType.equals("JPEG") || imgType.equals("PNG")) {
																	MRequest mReq = new MRequest();
																	String fileFullPath = DATA_ROOT + "/BBS/" + MAS_BBS_ID + "/" + imgName;
																	File realFile = new File(fileFullPath);
			
																	int imgWidth = imgmanager.getImgWidth(realFile);
																	int imgHeight = imgmanager.getImgHeight(realFile);
			
														%>
														<a href="javascript:view_img('<%=imgId%>','<%=MAS_BBS_ID %>','<%=imgWidth%>','<%=imgHeight%>');">
															<img src="<%=imgPath%>mid_thumbnail/<%=strMidThumbNail%>" alt="클릭하시면 원래크기의 이미지를 보실수 있습니다." style="padding-bottom:4px;"><br>
														</a>
														<%
																}
															}
														%>
														<% } //if (flagHtml.equals("0")) {%>
														 --%>
														<%=strContents%>
													</td>
												</tr>
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
									<tr align="center" >
										<td height="22" background="<%=IMG_ROOT%>/customer_faq_bli01.jpg">&nbsp;</td>
									</tr>
									<% if (boardConfig.indexOf("C") >= 0) {%>
									<tr>
										<td height="10"></td>
									</tr>
									<tr>
										<td style="background-color:#f6f6f6" class="pd_10">
											<iframe id="comment_list" frameborder="0" scrolling="no" width="100%" src="<%=ROOT_DIR%>/bbs/comment/comment_list.jsp?bbsId=<%=strBbsId%>&masBbsId=<%=MAS_BBS_ID%>"></iframe>
										</td>
									</tr>
									<% } %>
									<tr align="center">
										<td>
											<table width="700" height="30" border="0" cellpadding="0" cellspacing="0">
												<tr>
													<td width="686" align="right" valign="bottom">
														<% if (accessLevel.indexOf("W") >= 0) { %>
															<img src="<%=IMG_ROOT%>/btn_write.jpg" width="50" height="23" alt="" onclick="go_write()" style="cursor:pointer;">
														<% if (boardConfig.indexOf("R") >= 0 && flagNotice.equals("0")) { %>
															<img src="<%=IMG_ROOT%>/btn_reply.jpg" width="54" height="23" alt="" onclick="go_reply();" style="cursor:pointer;">
														<% } %>
														<% if (S_LEVEL.equals("1") || S_LEVEL.equals("2") || (!S_ID.equals("") && S_ID.equals(strUsrId))) { %>
														<img src="<%=IMG_ROOT%>/btn_delet.jpg" width="50" height="23" alt="" onclick="go_delete_ok();" style="cursor:pointer;">
														<% } else { %>
														<img src="<%=IMG_ROOT%>/btn_delet.jpg" width="50" height="23" alt="" onclick="delete_password_win();" style="cursor:pointer;">
														<% } %>
														<img src="<%=IMG_ROOT%>/btn_modify.jpg" width="50" height="23" alt="" onclick="go_modify();" style="cursor:pointer;">
														<% } //if (accessLevel.indexOf("W") >= 0) { %>
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
		<input type="hidden" name="masBbsId" value="<%=MAS_BBS_ID%>">
		<input type="hidden" name="bbsId" value="<%=strBbsId%>">
		<input type="hidden" name="depth" value="<%=intDepth%>">
		<input type="hidden" name="no" value="<%=strNo%>">
		<input type="hidden" name="page" value="<%=curPage%>">
		<input type="hidden" name="searchType" value="<%=searchType%>">
		<input type="hidden" name="searchText" value="<%=searchText%>">
		<input type="hidden" name="bbsPass" value="">
		<input type="hidden" id="vSection" name="vSection" value="<%=vSection%>">
	</form>
</body>
</html>
