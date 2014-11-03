<%@ page language="java" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
<%@ page errorPage="/error/error_view.jsp" %>
<%@ include file="/common/inc/config.jsp" %>
<%@ include file="info.jsp" %>
<%@ page import="com.maninsoft.smart.homepage.request.*" %>
<%@ page import="com.maninsoft.smart.homepage.bbs.*" %>
<%@ page import="com.maninsoft.smart.homepage.bbs.master.*" %>
<%@ page import="com.maninsoft.smart.homepage.bbs.attach.*" %>
<%@ page import="com.maninsoft.smart.homepage.util.Paging" %>
<%@ page import="com.maninsoft.smart.homepage.util.ConvertText" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Calendar" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%

	Request req = new Request(request);
	MasterManager masmanager = MasterManager.getInstance();
	BbsManager bbsmanager = BbsManager.getInstance();
	BbsCommentManager cmtmanager = BbsCommentManager.getInstance();
	Paging paging = Paging.getInstance();
	AttachManager filemanager = AttachManager.getInstance();
	
	//MAS_BBS_ID parameter
	String MAS_BBS_ID = "bbs_faq";//req.getString("masBbsId");
	
	String boardName = masmanager.getBoardName(MAS_BBS_ID);
	if (boardName == null || boardName.equals("")) {
		response.sendRedirect(ROOT_DIR);
	}
	
	String accessLevel = masmanager.getAccessLevel(MAS_BBS_ID, S_ID, S_LEVEL);
	String boardConfig = masmanager.getConfig(MAS_BBS_ID);
	
	//접근권한 체크(리스트 페이지)
	if (accessLevel.indexOf("L") < 0) {
		response.sendRedirect(ROOT_DIR);
	}
	
	//page info
	String PAGE_INFO = "menu04_sub02";
	//String strBbsImg = "customer_notic_01.jpg";
	//if (MAS_BBS_ID.equals("bbs_notice")) {
	//	PAGE_INFO = "menu04_sub01";
	//	strBbsImg = "customer_notic_01.jpg";
	//} else if (MAS_BBS_ID.equals("bbs_qna")) {
	//	PAGE_INFO = "menu04_sub03";
	//	strBbsImg = "customer_qna_01.jpg";
	//} else if (MAS_BBS_ID.equals("bbs_proposal")) {
	//	PAGE_INFO = "menu04_sub04";
	//	strBbsImg = "customer_proposal_01.jpg";
	//}
	
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
	
	String strTapHomeImg = "customer_tab_home.jpg";
	String strTapAppImg = "customer_tab_app.jpg";
	String strTapSmartImg = "customer_tab_smart.jpg";
	String strTapAllImg = "customer_tab_allist.jpg";
	
	if (vSection.equals("0")) {
		strTapAllImg = "customer_tab_allist_w.jpg";
	} else if (vSection.equals("1")) {
		strTapHomeImg = "customer_tab_home_w.jpg";
	} else if (vSection.equals("2")) {
		strTapAppImg = "customer_tab_app_w.jpg";
	} else if (vSection.equals("3")) {
		strTapSmartImg = "customer_tab_smart_w.jpg";
	}
	
	//해당 페이지의 알림글 리스트를 받아온다.
	//ArrayList noticeArray = bbsmanager.getNoticeList(MAS_BBS_ID);
	
	String strWhere = " where bbs_notice = '0' and mas_bbs_id = '" + MAS_BBS_ID + "'";
	if (!searchText.equals("") && !searchType.equals("")) {
	    strWhere += " and " + searchType + " like '%" + searchText + "%'";
	}
	if (!vSection.equals("0")) {
		strWhere += " and bbs_section = '" + vSection + "'";
	}
	String strOrder = " order by bbs_id desc";
	
	//전체 게시물의 개수를 받아온다.
	int totalCount = 0;
	totalCount = bbsmanager.getBbsListCount(MAS_BBS_ID, strWhere);
	
	//전체 페이지의수
	int pageCount = (totalCount - 1) / pageSize + 1;
	
	//해당 페이지의 리스트를 받아온다.
	ArrayList bbsArray = bbsmanager.getBbsList(req, MAS_BBS_ID, pageSize, strWhere, strOrder);
	
	//ConvertText
	ConvertText convert = ConvertText.getInstance();
	
	//현재 날짜의 일주일 전 날짜를 가져온다.
	Calendar calen = Calendar.getInstance();
	calen.add(Calendar.DATE, -7);
	Date date = calen.getTime();
	
	SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
	String strOldDate = sdf.format(date);    //일주일전 날짜다.
	int intOldDate = Integer.parseInt(strOldDate);
	
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
	function showContents(psBbsId) {
		var contentsObj01 = document.getElementById("contents01_" + psBbsId);
		var contentsObj02 = document.getElementById("contents02_" + psBbsId);
		if (contentsObj01.style.display == "none") {
			contentsObj01.style.display = "";
			contentsObj02.style.display = "";
		} else {
			contentsObj01.style.display = "none";
			contentsObj02.style.display = "none";
		}
	}
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
							<td colspan="2"><img src="<%=IMG_ROOT %>/popmain_stitle05_02.jpg" align="top" alt="<%=boardName %>"></td>
						</tr>
						<tr>
							<td>&nbsp;</td>
						</tr>
						<tr>
							<td>
								<table width="731" border="0" cellspacing="0" cellpadding="0">
									<tr align="left">
										<td width="81"><img src="<%=IMG_ROOT%>/<%=strTapHomeImg %>" alt="" onclick="viewSection('1')" style="cursor:pointer;"></td>
										<td width="75"><img src="<%=IMG_ROOT%>/<%=strTapAppImg %>" alt="" onclick="viewSection('2')" style="cursor:pointer;"></td>
										<td width="108"><img src="<%=IMG_ROOT%>/<%=strTapSmartImg %>" alt="" onclick="viewSection('3')" style="cursor:pointer;"></td>
										<td width="467"><img src="<%=IMG_ROOT%>/<%=strTapAllImg %>" alt="" onclick="viewSection('0')" style="cursor:pointer;"></td>
									</tr>
									<tr>
										<td height="22" colspan="4" background="<%=IMG_ROOT%>/customer_faq_li01.jpg">&nbsp;</td>
									</tr>
									<tr align="center">
										<td colspan="4">
											<table width="700" border="0" cellspacing="0" cellpadding="0">
												<% if (bbsArray.size() == 0) { %>
												<tr>
													<td height="60">등록된 게시물(검색조건에 만족하는) 이 없습니다.</td>
												</tr>
												<tr>
													<td height="1" background="<%=IMG_ROOT%>/dotline.gif"></td>
												</tr>
												<%
													} else {
														int no = totalCount - (curPage-1) * pageSize;	 //목록에 보여줄 번호
														for (int i = 0; i < bbsArray.size(); i++) {
															BbsBean board = new BbsBean();
															board = (BbsBean) bbsArray.get(i);
					
															int intBbsId = board.getBbsId();
															String strTitle = board.getBbsTitle();
															//String strSliceTitle = convert.strSlice(strTitle, 42, "..");
															String strWriter = board.getBbsUsrName();
															String strUsrId = board.getBbsUsrId();
															int strRefer = board.getBbsRefer();
															int strGood = board.getBbsGood();
															Date wdate = board.getBbsWdate();
															String strWdate = wdate.toString().substring(0,10);
															String tempdate = sdf.format( wdate );
															int intWdate = Integer.parseInt(tempdate);
															int intDepth = board.getBbsDepth();
															String strSecret = board.getBbsSecret();
															String strSection = board.getBbsSection();
															
															String flagHtml = board.getBbsHtml();
															String strContents = board.getBbsContents();
															
															//if (flagHtml.equals("0")) {		//스트링 형식
															//	strContents = convert.convertStringText(strContents);
															//} else {						//HTML 형식
															//	strContents = convert.convertTagText(strContents);
															//}
															
															//if (strSection == null) { strSection = "0"; }
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
															
															String strBgcolor = "";
															if (no % 2 == 0) {
																strBgcolor = "#ffffff";
															} else {
																strBgcolor = "#fff6e6";
															}
															
															String displayStyle = "display:none;";
															if (i == 0) {
																 displayStyle = "";
															}
												%>
												<tr>
													<td height="25" align="left">
														<img src="<%=IMG_ROOT%>/customer_btn_q.jpg" width="12" height="12" alt="" align="middle">
														<a href="javascript:showContents('<%=intBbsId%>');"><%=strTitle %></a>
													</td>
												</tr>
												<tr>
													<td height="1" background="<%=IMG_ROOT%>/dotline.gif"></td>
												</tr>							
												<tr id="contents01_<%=intBbsId%>" style="<%=displayStyle %>">
													<td height="25" align="left">
														<table width="700" border="0" cellpadding="0" cellspacing="8" bgcolor="#fff6e6">
															<tr>
	 															<td class="smartOutput">
	 																<img src="<%=IMG_ROOT%>/customer_btn_a.jpg" width="12" height="12" alt="" align="middle">
	 																<%=strContents %>
	 															</td>
															</tr>
														</table>
													</td>
												</tr>
												<tr id="contents02_<%=intBbsId%>" style="<%=displayStyle %>">
													<td height="1" background="<%=IMG_ROOT%>/dotline.gif"></td>
												</tr>
												<%
															no = no - 1;
														} //for (int i = 0; i < bbsArray.size(); i++) {
													} //if (bbsArray.size() == 0) {
												%>
											</table>
										</td>
									</tr>
									<tr>
										<td colspan="4">
											<table width="700" height="30" border="0" cellpadding="0" cellspacing="0">
												<tr>
													<td width="686" height="40" align="center" valign="bottom">
														<%=paging.postPageIndex(IMG_ROOT, totalCount, pageSize, curPage, "go_page") %>
													</td>
													<td width="14" rowspan="2" align="right" valign="bottom">&nbsp;</td>
												</tr>
												<tr>
													<td align="right" valign="bottom">&nbsp;</td>
												</tr>
												<tr>
													<td align="right" valign="bottom">
														<% if (accessLevel.indexOf("W") >= 0) { %>
															<img src="<%=IMG_ROOT %>/btn_write.jpg" width="50" height="23" onclick="go_write();" style="cursor:pointer;">
														<% } %>
													</td>
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
		<input type="hidden" id="masBbsId" name="masBbsId" value="<%=MAS_BBS_ID%>">
		<input type="hidden" id="bbsId" name="bbsId" value="">
		<input type="hidden" id="no" name="no" value="">
		<input type="hidden" id="page" name="page" value="<%=curPage%>">
		<input type="hidden" id="searchType" name="searchType" value="<%=searchType%>">
		<input type="hidden" id="searchText" name="searchText" value="<%=searchText%>">
		<input type="hidden" name="bbsPass" value="">
		<input type="hidden" id="vSection" name="vSection" value="<%=vSection%>">
	</form>
</body>
</html>
