<%@ page language="java" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
<%@ page errorPage="/error/error_view.jsp" %>
<%@ include file="/common/inc/config.jsp" %>
<%@ include file="/admin/include/check_admin.jsp" %>
<%@ page import="com.maninsoft.smart.homepage.request.*" %>
<%@ page import="com.maninsoft.smart.homepage.admin.function.Function" %>
<%@ page import="com.maninsoft.smart.homepage.bbs.*" %>
<%@ page import="com.maninsoft.smart.homepage.bbs.master.*" %>
<%@ page import="com.maninsoft.smart.homepage.bbs.attach.*" %>
<%@ page import="com.maninsoft.smart.homepage.util.ConvertText" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Calendar" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%
	Function function = Function.getInstance();
	Request req = new Request(request);
	MasterManager masmanager = MasterManager.getInstance();
	BbsManager bbsmanager = BbsManager.getInstance();
	BbsCommentManager cmtmanager = BbsCommentManager.getInstance();
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
	ArrayList noticeArray = bbsmanager.getNoticeList(MAS_BBS_ID);
	
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
<html>
<head>
<title>
<%= SITE_TITLE_ADMIN %>
</title>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<link href="<%=ROOT_DIR%>/common/css/admin/common.css" rel="stylesheet" type="text/css">
<script language="javascript" type="text/javascript" src="<%=ROOT_DIR%>/common/js/common.js"></script>
<script language="javascript" type="text/javascript" src="<%=ROOT_DIR%>/common/js/bbs/board.js"></script>
<link rel="stylesheet" type="text/css" href="<%=ROOT_DIR%>/smarteditor/css/style.css">
<script language="JavaScript" type="text/JavaScript">
<!--

	function goModify() {
		var chkObj = document.getElementsByName("chkSel");
		// check box 있을경우
		if (chkObj.length > 0) {	
			var count = 0;
			var check_cnt;
			for (var i = 0; i < chkObj.length; i++) {	// check 된 항목의 개수
				if(chkObj[i].checked) {
					check_cnt = i;
					count++;
				}
			}
			if (count == 0) {
				alert("수정할 항목을 선택해주세요.");
				return;
			}
			if (count > 1) {	// 두개 이상이 선택된 경우
				alert("수정할 항목을 하나만 선택해주세요.");
				return;
			}
	
		} else {
			alert("수정할 항목이 없습니다.");
			return;
		}
		document.bForm.bbsId.value = chkObj[check_cnt].value;
		go_modify();
	}
	
	function goDelete() {
		var chkObj = document.getElementsByName("chkSel");
		// check box 있을경우
		if (chkObj.length > 0) {
			var count = 0;
			var check_cnt;
			for (var i = 0; i < chkObj.length; i++) {	// check 된 항목의 개수
				if(chkObj[i].checked) {
					check_cnt = i;
					count++;
				}
			}
			if(count == 0) {
				alert("삭제할 항목을 선택해주세요.");
				return;
			}
			if (count > 1) {	// 두개 이상이 선택된 경우
				alert("삭제할 항목을 하나만 선택해주세요.");
				return;
			}
		} else {
			alert("삭제할 항목이 없습니다.");
			return;
		}
		
		document.bForm.bbsId.value = chkObj[check_cnt].value;
		go_delete_ok();
		
	}

	function showContents(psBbsId) {
		var contentsObj = document.getElementById("contents_" + psBbsId);
		if (contentsObj.style.display == "none") {
			contentsObj.style.display = "";
		} else {
			contentsObj.style.display = "none";
		}
		top.iframe_height();
	}
//-->
</script>
</head>
<body>
	<div id="conTents">
		<%=function.getTitleBox(ADMIN_IMG, "FAQ 관리(" + totalCount + ")")%>
		<table width="100%" border="0" cellpadding="0" cellspacing="0" class="t_b_bottom">
			<tr height="50">
				<td colspan="17" width="100%">
					<div id="search">
						<table cellSpacing="0" cellPadding="0" border="0">
							<tr>
								<th class="text_blu" style="padding-right:10px;">검&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;색</th>
								<td>
									<select name="searchType">
										<option value="bbs_title" <%if (searchType.equals("bbs_title")) { out.println("selected"); }%>>제목</option>
										<option value="bbs_contents" <%if (searchType.equals("bbs_contents")) { out.println("selected"); }%>>내용</option>
										<option value="bbs_usr_name" <%if (searchType.equals("bbs_usr_name")) { out.println("selected"); }%>>작성자</option>
									</select>
									<input type="text" class="input" name="searchText" size="20" value="<%=searchText%>" onKeyPress="javascript:setFindEnterKey();">
									<input type="button" class="btn_nomal" name="" value=" 검 색 " onClick="javascript:go_search();" />
									<input type="button" class="btn_nomal" name="" value=" 검색취소 " onClick="javascript:go_all_list('<%=MAS_BBS_ID %>');" />
								</td>
							</tr>
						</table>
					</div>
				</td>
			</tr>
			<tr>
				<td colspan="17">
					<table width="731" border="0" cellspacing="0" cellpadding="0">
						<tr align="left">
							<td width="81"><img src="<%=IMG_ROOT%>/<%=strTapHomeImg %>" alt="" onclick="viewSection('1')" style="cursor:pointer;"></td>
							<td width="75"><img src="<%=IMG_ROOT%>/<%=strTapAppImg %>" alt="" onclick="viewSection('2')" style="cursor:pointer;"></td>
							<td width="108"><img src="<%=IMG_ROOT%>/<%=strTapSmartImg %>" alt="" onclick="viewSection('3')" style="cursor:pointer;"></td>
							<td width="467"><img src="<%=IMG_ROOT%>/<%=strTapAllImg %>" alt="" onclick="viewSection('0')" style="cursor:pointer;"></td>
						</tr>
					</table>
				</td>
			</tr>
			<tr height="25">
				<th width="5%" class="t_th">선택</th>
				<th width="5%" class="t_th">번호</th>
				<th width="10%" class="t_th">구분</th>
				<th class="t_th">제목</th>
				<th width="10%" class="t_th">작성자</th>
				<th width="20%" class="t_th">작성일</th>
          		<% if (boardConfig.indexOf("F") >= 0) { %>
				<th width="10%" class="t_th">첨부</th>
				<% } %>
				<%--<th width="10%" class="t_th">조회</th> --%>
			</tr>
			<!-- 알림글 리스트 -->
			<%
				if (noticeArray.size() > 0) {
				int noticeNo = 1;
				for (int i = 0; i < noticeArray.size(); i++) {        //알림글 리스트
					BbsBean board = new BbsBean();
					board = (BbsBean) noticeArray.get(i);
					
					int intBbsId = board.getBbsId();
					String strTitle = board.getBbsTitle();
					//String strSliceTitle = convert.strSlice(strTitle, 42, "..");
					String strUsrId = board.getBbsUsrId();
					String strWriter = board.getBbsUsrName();
					int strRefer = board.getBbsRefer();
					int strGood = board.getBbsGood();
					Date wdate = board.getBbsWdate();
					String strWdate = wdate.toString().substring(0,16);
					String tempdate = sdf.format( wdate );
					int intWdate = Integer.parseInt(tempdate);
					int intDepth = board.getBbsDepth();
					String flagHtml = board.getBbsHtml();
					String strContents = board.getBbsContents();
				
					//if (flagHtml.equals("0")) {		//스트링 형식
					//	strContents = convert.convertStringText(strContents);
					//} else {						//HTML 형식
					//	strContents = convert.convertTagText(strContents);
					//}
			%>
				<tr bgcolor="ghostWhite">
					<td class="t_tdFirst">
						<input type="checkbox" name="chkSel" value="<%=intBbsId%>">
					</td>
					<td class="t_td">
						<%=noticeNo %>
					</td>
					<td class="t_td">
						<img src="<%=IMG_ROOT%>/bbs/icon_notice.gif" width="30" height="16" alt="알림글">
					</td>
					<td class="t_tdL">
		            	<%
							if (intDepth != 0) {
								for (int j = 0; j < intDepth; j++) {
									out.println("&nbsp;&nbsp;");
								}
								out.println("<img src='"+IMG_ROOT+"/bbs/icon_re.gif'> ");
							}
						%>
						<% if (accessLevel.indexOf("V") >= 0) { %>
							<a href="javascript:showContents('<%=intBbsId%>')"><%=strTitle %></a>
						<% } else { %>
							<%=strTitle %>
						<% } %>
						<%
							if (boardConfig.indexOf("C") >= 0) {
								int commentCount = cmtmanager.getCommentCount(intBbsId, MAS_BBS_ID);
								if (commentCount != 0) {
						%>
									<span class="text_99_11">[<%=commentCount%>]</span>
						<%
								} //if (commentCount != 0) {
							} //if (boardConfig.indexOf("C") >= 0) {
						%>
						<% if (intWdate >= intOldDate) { //글쓴날짜가 오늘날짜의 일주일전보다 크다면 %>
							<img src="<%=IMG_ROOT%>/bbs/icon_new.gif" width="15" height="5" align="top" alt="new">
						<% } %>
					</td>
					<td class="t_td"><%=strWriter %></td>
					<td class="t_td"><%=strWdate %></td>
					<% if (boardConfig.indexOf("F") >= 0) { %>
					<td class="t_td">
						<%
							int attachCount = filemanager.getAttachCount(intBbsId, MAS_BBS_ID);
							if (attachCount > 0) {
						%>
							<img src="<%=IMG_ROOT%>/bbs/icon_disk.gif" align="top" alt="disk">
						<% } else { %>
							&nbsp;
						<% } %>
					</td>
					<% } %>
					<%--<td class="t_td"><%=strRefer %></td> --%>
				</tr>
				<tr bgcolor="ghostWhite" id="contents_<%=intBbsId%>" class="smartOutput" style="display:none;">
					<td class="t_tdFirst" style="vertical-align:top;padding-top:10px;padding-bottom:10px;height:150px;"><b>내용</b></td>
					<td class="t_tdL" colspan="10" style="vertical-align:top;padding-top:10px;padding-bottom:10px;height:150px;"><%=strContents%></td>
		        </tr>
			<%
						noticeNo++;
					} //for (int i = 0; i < noticeArray.size(); i++) {
				} //if (noticeArray.size() > 0) {
			%>
                
			<!-- 게시물 리스트 -->
			<% if (bbsArray.size() == 0) { %>
				<tr>
					<td class="t_tdFirst" colSpan="17" height="200">
						<img src="<%=ADMIN_IMG%>/title_empty_result.gif" width="332" height="81">
					</td>
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
						int strRefer = board.getBbsRefer();
						int strGood = board.getBbsGood();
						Date wdate = board.getBbsWdate();
						String strWdate = wdate.toString().substring(0,16);
						String tempdate = sdf.format( wdate );
						int intWdate = Integer.parseInt(tempdate);
						int intDepth = board.getBbsDepth();
						String flagHtml = board.getBbsHtml();
						String strContents = board.getBbsContents();
						String strSection = board.getBbsSection();
						
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
						
						//if (flagHtml.equals("0")) {		//스트링 형식
						//	strContents = convert.convertStringText(strContents);
						//} else {						//HTML 형식
						//	strContents = convert.convertTagText(strContents);
						//}
        	%>       
				<tr>
					<td class="t_tdFirst"><input type="checkbox" name="chkSel" value="<%=intBbsId%>"></td>
					<td class="t_td"><%=no %></td>
					<td class="t_td"><%=strMsgSection %></td>
					<td class="t_tdL">
            			<%
							if (intDepth != 0) {
								for (int j = 0; j < intDepth; j++) {
									out.println("&nbsp;&nbsp;");
								}
								out.println("<img src='"+IMG_ROOT+"/bbs/icon_re.gif'> ");
							}
						%>
						<% if (accessLevel.indexOf("V") >= 0) { %>
							<a href="javascript:showContents('<%=intBbsId%>')"><%=strTitle %></a>
						<% } else { %>
							<%=strTitle %>
						<% } %>
						<%
							if (boardConfig.indexOf("C") >= 0) {
								int commentCount = cmtmanager.getCommentCount(intBbsId, MAS_BBS_ID);
								if (commentCount != 0) {
						%>
									<span class="text_99_11">[<%=commentCount%>]</span>
						<%
								} //if (commentCount != 0) {
							} //if (boardConfig.indexOf("C") >= 0) {
						%>
						<% if (intWdate >= intOldDate) { //글쓴날짜가 오늘날짜의 일주일전보다 크다면 %>
							<img src="<%=IMG_ROOT%>/bbs/icon_new.gif" width="15" height="5" align="top" alt="new">
						<% } %>
					</td>
					<td class="t_td"><%=strWriter %></td>
					<td class="t_td"><%=strWdate %></td>
					<% if (boardConfig.indexOf("F") >= 0) { %>
					<td class="t_td">
						<%
							int attachCount = filemanager.getAttachCount(intBbsId, MAS_BBS_ID);
							if (attachCount > 0) {
						%>
						<img src="<%=IMG_ROOT%>/bbs/icon_disk.gif" align="top" alt="disk">
						<% } else { %>
							&nbsp;
						<% } %>
					</td>
					<% } %>
					<%--<td class="t_td"><%=strRefer %></td> --%>
				</tr>
				<tr id="contents_<%=intBbsId%>" class="smartOutput" style="display:none;">
					<td class="t_tdFirst" style="vertical-align:top;padding-top:10px;padding-bottom:10px;height:150px;"><b>내용</b></td>
					<td class="t_tdL" colspan="10" style="vertical-align:top;padding-top:10px;padding-bottom:10px;height:150px;"><%=strContents%></td>
		        </tr>
			<%
						no = no - 1;
					} //for (int i = 0; i < bbsArray.size(); i++) {
				} //if (bbsArray.size() == 0) {
			%>
		</table>
		<div id="paging">
			<%=function.postPageIndex(ROOT_DIR, totalCount, pageSize, curPage, "go_page") %>
		</div>
		
		<!-- 버튼 -->
		<div id="button">
			<span class="btn_sub" onclick="javascript:go_write();"><img alt="" src="<%=IMG_ROOT%>/icons/btn_icon_add2.gif" /><a onfocus="this.blur();">추 가</a></span>
			<span class="btn_sub" onclick="javascript:goModify();"><img alt="" src="<%=IMG_ROOT%>/icons/btn_icon_edit.gif" /><a onfocus="this.blur();">수 정</a></span>
    		<span class="btn_sub" onclick="javascript:goDelete();"><img alt="" src="<%=IMG_ROOT%>/icons/btn_icon_del.gif" /><a onfocus="this.blur();">삭 제</a></span>
		</div>

		<!--도움말 부분-->
		<%=function.getTipBoxTop(ADMIN_IMG)%>
			FAQ를 관리합니다.<br>
			제목을 클릭하면 상세정보를 보실 수 있습니다.<br>
		<%=function.getTipBoxBottom()%>
		<form name="bForm" method="post" action="list.jsp">
			<input type="hidden" id="masBbsId" name="masBbsId" value="<%=MAS_BBS_ID%>">
			<input type="hidden" id="bbsId" name="bbsId" value="">
			<input type="hidden" name="depth" value="0">
			<input type="hidden" id="no" name="no" value="">
			<input type="hidden" id="page" name="page" value="<%=curPage%>">
			<input type="hidden" id="searchType" name="searchType" value="<%=searchType%>">
			<input type="hidden" id="searchText" name="searchText" value="<%=searchText%>">
			<input type="hidden" id="vSection" name="vSection" value="<%=vSection%>">
		</form>
	</div>
</body>
</html>

