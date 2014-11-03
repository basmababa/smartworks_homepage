<%@ page language="java" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
<%@ page errorPage="/error/error_view.jsp" %>
<%@ include file="/common/inc/config.jsp" %>
<%@ include file="/include/counter.jsp" %>
<%@ page import="com.maninsoft.smart.homepage.request.*" %>
<%@ page import="com.maninsoft.smart.homepage.bbs.*" %>
<%@ page import="com.maninsoft.smart.homepage.util.ConvertText" %>
<%@ page import="java.util.ArrayList" %>
<%
	Request req = new Request(request);
	BbsManager bbsmanager = BbsManager.getInstance();
	ConvertText convert = ConvertText.getInstance();	
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title><%=SITE_TITLE %></title>
<meta http-equiv="imagetoolbar" content="no">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta name="Description" content="UCC기반의 중소기업 업무포털서비스 -스마트웍스 닷넷-">
<meta name="Keywords" content=" 스마트웍스닷넷, smartworks.net, 그룹웨어, group ware, 전자결제, 인트라넷, intra net, 업무처리, 클라우드, cloud, 사스, SaaS, BPM">
<link rel="stylesheet" type="text/css" href="<%=ROOT_DIR%>/common/css/common.css">
<link rel="stylesheet" type="text/css" href="<%=ROOT_DIR%>/common/css/tooltip/tooltip.css">
<script type="text/javascript" src="<%=ROOT_DIR%>/common/js/common.js"></script>
<script type="text/javascript" src="<%=ROOT_DIR%>/common/js/menu_action.js"></script>
<script type="text/javascript">

/*
	var popupOk = true;
	var winPopup;
	function winOpenPopup() {	//popup090914
		if (!getCookie("win_popup_090914")) {
			var url = rootDir + "/dm/popup/090914/popup.html";
			winPopup = window.open(url, "popup", "width=600,height=571,top=150, left=30");
		}
	}
	function goLink01() {
		location.href = "http://www.smartworks.net/purchase/purchase02.jsp";
		winPopup.close();
	}
	function goLink02() {
		location.href = "http://www.smartworks.net/bbs/list.jsp?masBbsId=bbs_proposal";
		winPopup.close();
	}
	function winClosePopup() {
		var todayDate = new Date();
		todayDate.setTime(todayDate.getTime() + (24*60*60*1000));
		// cookie setting
		setCookie("win_popup_090914", "090914", todayDate, "/");
		winPopup.close();
	}
*/
/*
	var popupOk = true;
	function winOpenPopup() {	//popup090914
		if (!getCookie("win_popup_090914")) {
			$("win_popup_090914").style.display = "block";
		}
	}
	function goLink01() {
		location.href = "http://www.smartworks.net/purchase/purchase02.jsp";
	}
	function goLink02() {
		location.href = "http://www.smartworks.net/bbs/list.jsp?masBbsId=bbs_proposal";
	}
	function winClosePopup() {
		var todayDate = new Date();
		todayDate.setTime(todayDate.getTime() + (24*60*60*1000));
		// cookie setting
		setCookie("win_popup_090914", "090914", todayDate, "/");
		$("win_popup_090914").style.display = "none";
	}	
*/
</script>
</head>
<body>
	<jsp:include page="/include/hidden.jsp" flush="true"></jsp:include>
	<div id="mbody">
		<div id="wrap">
			<div id="header_m">
				<div id="header_wrap">
					<div id="header_logo">
						<%--<a href="javascript:go_home();"><img src="<%=IMG_ROOT%>/logo_smartworks.jpg" width="172" height="81" border="0" alt="smartworks.net logo image"></a>--%>
						<script type="text/javascript">
							var voEmbed = new setEmbed();
							voEmbed.init("flash", "<%=SWF_ROOT%>/top_logo.swf", "171", "80");
							voEmbed.parameter("wmode", "transparent");
							voEmbed.show();
						</script>
					</div>
					<div id="header_menu">
						<div id="header_top_menu">
							<span class="txblue">
								<a href="<%=APPSTORE_URL%>" target="_blank"><img src="<%=IMG_ROOT %>/gl_menu01.gif" alt="앱스토어"></a>
								<%-- | <strong>MY</strong>스마트웍스닷넷 --%>
							</span>
						</div>
						<div id="header_main_menu_area">
							<div id="header_main_menu">
								<!-- top menu-->
								<div id="header_flash_menu">
									<script type="text/javascript">
										var voEmbed = new setEmbed();
										voEmbed.init("flash", "<%=SWF_ROOT%>/top_menu.swf", "598", "80");
										voEmbed.parameter("wmode", "transparent");
										voEmbed.show();
									</script>
								</div>
							</div>
							<div id="header_search_area_m">					
								<form name="appstoreSearchForm" method="post" action="<%=APPSTORE_URL %>/" target="_blank">
									<fieldset>
										<legend>Appstore Search</legend>
										<div id="header_search_field"><input type="text" id="search" name="search" class="search" onkeyup="if (event.keyCode==13) { appstore_search(); }"></div>
										<div id="header_search_button"><img src="<%=IMG_ROOT%>/btn_search.jpg" width="18" height="20" alt="search button" onclick="appstore_search();" style="cursor:pointer;"></div>
									</fieldset>
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div id="mainwrap_m">
				<div id="contents_m">
					<table width="941" border="0" cellpadding="0" cellspacing="0">
						<tr>
							<td width="727" height="355" valign="top">
								<script type="text/javascript">
									var voEmbed = new setEmbed();
									voEmbed.init("flash", "<%=SWF_ROOT%>/main_flash.swf", "727", "348");
									voEmbed.parameter("wmode", "transparent");
									voEmbed.show();
								</script>
							</td>
							<td width="214" align="center" valign="top">
								<%
									//Notice
									String strWhere = " where bbs_notice = '0' and mas_bbs_id = 'bbs_notice'";
									String strOrder = " order by bbs_id desc";
									ArrayList bbsArray = bbsmanager.getBbsList(req, "bbs_notice", 5, strWhere, strOrder);
								%>
								<table width="205" border="0" cellspacing="0" cellpadding="0">
									<tr>
										<td height="31" valign="bottom"><img class="png24" src="<%=IMG_ROOT %>/top_tnews.png" width="204" height="14" onclick="menu04_sub01()" style="cursor:pointer;" alt=""></td>
									</tr>
									<tr>
										<td>
											<table width="203" border="0" cellspacing="0" cellpadding="0">
												<tr>
													<td width="8"><img src="<%=IMG_ROOT %>/news_li01.jpg" width="8" height="8" alt=""></td>
													<td width="187" style="background:url(<%=IMG_ROOT %>/news_li05.jpg);"></td>
													<td width="8" align="right"><img src="<%=IMG_ROOT %>/news_li02.jpg" width="8" height="8" alt=""></td>
												</tr>
												<tr>
													<td style="background:url(<%=IMG_ROOT %>/news_li08.jpg);">&nbsp;</td>
													<td bgcolor="#FFFFFF">
														<table width="185" border="0" cellspacing="0" cellpadding="0">
															<% 
																if (bbsArray.size() == 0) { 
															%>
															<tr>
																<td width="7" align="left" valign="middle"><img src="<%=IMG_ROOT %>/news_bullet.gif" width="2" height="2" alt=""></td>
																<td width="178" height="17" align="left">공지사항이 없습니다.</td>
															</tr>
															<tr>
																<td height="68">&nbsp;</td>
																<td>&nbsp;</td>
															</tr>
															<% 
																} else {
																	int no = 1;
																	for (int i = 0; i < bbsArray.size(); i++) {
																		BbsBean board = new BbsBean();
																		board = (BbsBean) bbsArray.get(i);
																		
																		int intBbsId = board.getBbsId();
																		String strTitle = board.getBbsTitle();//convert.convertStringText(board.getBbsTitle());
																		String strSliceTitle = convert.strLengthSlice(strTitle, 15, "..");
															%>
															<tr>
																<td width="7" align="left" valign="middle"><img src="<%=IMG_ROOT %>/news_bullet.gif" width="2" height="2" alt=""></td>
																<td width="178" height="17" align="left">
																	<a href="javascript:goBbsView('bbs_notice','<%=intBbsId%>','<%=no%>')">
																		<%=strSliceTitle %>
																	</a>
																</td>
															</tr>
															<%
																		no++;
																	} //for (int i = 0; i < bbsArray.size(); i++) {
																} //if (bbsArray.size() > 0) {
															%>
														</table>
													</td>
													<td style="background:url(<%=IMG_ROOT %>/news_li06.jpg);">&nbsp;</td>
												</tr>
												<tr>
													<td><img src="<%=IMG_ROOT %>/news_li04.jpg" width="8" height="8" alt=""></td>
													<td style="background:url(<%=IMG_ROOT %>/news_li07.jpg);"></td>
													<td align="right"><img src="<%=IMG_ROOT %>/news_li03.jpg" width="8" height="8" alt=""></td>
												</tr>
											</table>
										</td>
									</tr>
								</table>
							</td>
						</tr>
					</table>
					<table width="941" border="0" cellspacing="0" cellpadding="0">
						<tr>
							<td width="4" rowspan="3">&nbsp;</td>
							<td width="147" rowspan="3" valign="top">
								<table width="147" border="0" cellpadding="0" cellspacing="0">
									<tr>
										<td width="147" height="6" valign="top"></td>
									</tr>
									<tr>
										<td>
											<a href="javascript:menu03_sub02()">
												<img src="<%=IMG_ROOT %>/left_nban01.jpg" align="top" alt="스마트웍스닷넷 설치하기" title="스마트웍스닷넷 설치하기">
											</a>
										</td>
									</tr>
									<tr>
										<td>
											<a href="javascript:menu03_sub04()">
												<img src="<%=IMG_ROOT %>/left_nban02.jpg" align="top" alt="스마트웍스닷넷 체험시스템" title="스마트웍스닷넷 체험시스템">
											</a>
										</td>
									</tr>
									<tr>
										<td>
											<a href="javascript:menu03_sub02()">
												<img src="<%=IMG_ROOT %>/left_nban03.jpg" align="top" alt="스마트웍스닷넷 설치하기" title="스마트웍스닷넷 설치하기">
											</a>
										</td>
									</tr>
									<tr>
										<td height="5"></td>
									</tr>
									<tr>
										<td height="66" valign="top"><img src="<%=IMG_ROOT %>/left_ban02.jpg" alt=""></td>
									</tr>
									<tr>
										<td height="5"></td>
									</tr>
									<tr>
										<td>
											<a href="javascript:menu03_sub03();">
												<img src="<%=IMG_ROOT %>/left_ban04.jpg" align="top" alt="">
											</a>
										</td>
									</tr>
								</table>
							</td>
							<td width="11" rowspan="3">&nbsp;</td>
							<td width="564" height="71" valign="top">
								<script type="text/javascript">
									var voEmbed = new setEmbed();
									voEmbed.init("flash", "<%=SWF_ROOT%>/checkpoint.swf", "564", "153");
									voEmbed.parameter("wmode", "transparent");
									voEmbed.show();
								</script>
							</td>
							<td width="215" rowspan="3" align="right" valign="top">
								<img src="<%=IMG_ROOT %>/right_bann01.jpg" width="215" height="153" align="top" alt="Animation으로 보는 스마트웍스닷넷" onclick="menu01_sub02()" style="cursor:pointer;">
								<img src="<%=IMG_ROOT %>/right_bann02.jpg" width="215" height="164" align="top" alt="스마트웍스닷넷 Easy 체험" onclick="easyani()" style="cursor:pointer;">
							</td>
						</tr>
						<tr>
							<td height="7"></td>
						</tr>
						<tr>
							<td valign="top">
								<div id="best" style="padding-left:3px;">
									<iframe id="best_list" frameborder="0" scrolling="no" width="564" height="154" src="<%=APPSTORE_URL%>/main/bestList.jsp"></iframe>
									<%--<jsp:include page="/include/best.jsp" flush="true"></jsp:include>--%>
								</div>
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
	<jsp:include page="/include/popup.jsp" flush="true"></jsp:include>
<%-- 	
	<div id="win_popup_090914" onmousedown="initializedrag('win_popup_090914', event)" style="position:absolute;left:156px;top:94px;width:600px;height:571px;z-index:10;display:none;">
		<table width="100%" border="0" cellspacing="0" cellpadding="0">
			<tr>
				<td>
					<table width="100%" border="0" cellpadding="0" cellspacing="0" bgcolor="#ffffff">
						<tr>
							<td colspan="2" align="center">
								<img src="<%=ROOT_DIR %>/dm/popup/090914/pop_event.jpg" alt="" border="0" align="top" usemap="#PopupMap">
							</td>
						</tr>
					</table>
				</td>
			</tr>
		</table>
	</div>
	<map name="PopupMap" id="PopupMap">
		<area shape="rect" coords="239,309,397,376" href="javascript:goLink01();" alt="">
		<area shape="rect" coords="231,430,405,480" href="javascript:goLink02();" alt="">
		<area shape="rect" coords="481,552,594,569" href="javascript:winClosePopup();" alt="">
	</map>
--%>
</body>
</html>
