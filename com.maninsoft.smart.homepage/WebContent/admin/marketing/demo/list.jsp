<%@ page language="java" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
<%@ include file="/common/inc/config.jsp" %>
<%@ include file="/admin/include/check_admin.jsp" %>
<%@ page import="com.maninsoft.smart.homepage.request.*" %>
<%@ page import="com.maninsoft.smart.homepage.admin.function.Function" %>
<%@ page import="com.maninsoft.smart.homepage.admin.db.demo.*" %>
<%@ page import="com.maninsoft.smart.homepage.util.ConvertText" %>
<%@ page import="java.util.ArrayList" %>
<%
	Function function = Function.getInstance();
	Request req = new Request(request);
	DemoManager demmanager = DemoManager.getInstance();
	
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
	
	String strWhere = "";
	if (!searchText.equals("") && !searchType.equals("")) {
	    strWhere += " where " + searchType + " like '%" + searchText + "%'";
	}
	String strOrder = " order by dem_idx desc";
	
	//전체 게시물의 개수를 받아온다.
	int totalCount = 0;
	totalCount = demmanager.getDemoListCount(strWhere);
	
	//전체 페이지의수
	int pageCount = (totalCount - 1) / pageSize + 1;
	
	//해당 페이지의 리스트를 받아온다.
	ArrayList demArray = demmanager.getDemoList(req, pageSize, strWhere, strOrder);
	
	//ConvertText
	ConvertText convert = ConvertText.getInstance();
%>
<html>
<head>
<title>
<%= SITE_TITLE_ADMIN %>
</title>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<link href="<%=ROOT_DIR%>/common/css/admin/common.css" rel="stylesheet" type="text/css">
<script language="javascript" type="text/javascript" src="<%=ROOT_DIR%>/common/js/common.js"></script>
<script language="JavaScript" type="text/JavaScript">
<!--

	function allCheck(){
		var chkObj = document.getElementsByName("chkSel");
		if (document.getElementById("allcheck").checked) {
			for (var i = 0; i < chkObj.length; i++) {	// check 된 항목의 개수
				chkObj[i].checked=true;
			}
		} else {
			for (var i = 0; i < chkObj.length; i++) {	// check 된 항목의 개수
				chkObj[i].checked=false;
			}
		}
	}
	
	function goModify() {
		var chkObj = document.getElementsByName("chkSel");
		// check box 있을경우
		if (chkObj.length > 0) {	
			var count = 0;
			for (var i = 0; i < chkObj.length; i++) {	// check 된 항목의 개수
				if(chkObj[i].checked) {
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
		document.LForm.action = "modify.jsp";
		document.LForm.submit();
	}

	function goDelete() {
		var chkObj = document.getElementsByName("chkSel");
		// check box 있을경우
		if (chkObj.length > 0) {
			var count = 0;
			for (var i = 0; i < chkObj.length; i++) {	// check 된 항목의 개수
				if(chkObj[i].checked) {
					count++;
				}
			}
			if(count == 0) {
				alert("삭제할 항목을 선택해주세요.");
				return;
			}
		} else {
			alert("삭제할 항목이 없습니다.");
			return;
		}
	
		if (confirm("정말 삭제하시겠습니까?")) {
			document.LForm.action = "delete_ok.jsp";
			document.LForm.submit();
		}
	}
	
	function search_cancel() {
		location.href = "list.jsp";
	}

	function go_page(page) {
		document.LForm.page.value = page;
		document.LForm.action = "list.jsp";
		document.LForm.submit();
	}

	function search_exe(){
		if (document.LForm.searchType.value == "") {
			alert("검색조건을 선택하세요.");
			return;
		}
		if (document.LForm.searchText.value == "") {
			alert("검색값을 선택하세요.");
			return;
		}
		goList();
	}
	
	function goList() {
		document.LForm.action = "list.jsp";
		document.LForm.submit();
	}
	
//-->
</script>
</head>
<body>
	<div id="conTents">
		<form name="LForm" method="post" action="list.jsp">
			<input type="hidden" name="page" value="<%=curPage%>">
			<%=function.getTitleBox(ADMIN_IMG, "데모신청 관리(" + totalCount + ")")%>
			<table width="100%" border="0" cellpadding="0" cellspacing="0" class="t_b_bottom">
				<tr height="50">
					<td colspan="17" width="100%">
						<div id="search">
							<table cellSpacing="0" cellPadding="0" border="0">
								<tr>
									<th class="text_blu" style="padding-right:10px;">검&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;색</th>
									<td>
										<select name="searchType">
											<option value="dem_company" <%if (searchType.equals("dem_company")) { out.println("selected"); }%>>회사명</option>
											<option value="dem_name" <%if (searchType.equals("dem_name")) { out.println("selected"); }%>>담당자</option>
											<option value="dem_email" <%if (searchType.equals("dem_email")) { out.println("selected"); }%>>이메일</option>
											<option value="dem_hp" <%if (searchType.equals("dem_hp")) { out.println("selected"); }%>>연락처</option>
										</select>
										<input type="text" class="input" name="searchText" size="20" value="<%=searchText%>">
										<input type="button" class="btn_nomal" name="" value=" 검 색 " onClick="javascript:search_exe();" />
										<input type="button" class="btn_nomal" name="" value=" 검색취소 " onClick="javascript:avascript:search_cancel();" />
									</td>
								</tr>
							</table>
						</div>
					</td>
				</tr>
				<tr height="25">
					<th width="1%" class="t_th"><input type="checkbox" id="allcheck" name="allcheck" onClick="allCheck()"></th>
					<th width="10%" class="t_th">회사명</th>
					<th width="8%" class="t_th">담당자</th>
					<th width="13%" class="t_th">이메일</th>
					<th width="10%" class="t_th">연락처</th>
					<th width="15%" class="t_th">직원수<b>/</b>사용자수</th>
					<th class="t_th">업종<b>/</b>업태</th>
					<th width="13%" class="t_th">신청일</th>
				</tr>
				<% if (demArray.size() == 0) { %>
					<tr>
						<td class="t_tdFirst" colSpan="17" height="200">
							<img src="<%=ADMIN_IMG%>/title_empty_result.gif" width="332" height="81">
						</td>
			        </tr>
	        	<%
					} else {
						int no = totalCount - (curPage-1) * pageSize;	 //목록에 보여줄 번호
						for (int i = 0; i < demArray.size(); i++) {
							DemoBean demo = new DemoBean();
							demo = (DemoBean) demArray.get(i);
		
							int intDemIdx = demo.getDemIdx();
							String strDemCompany = convert.convertStringText(demo.getDemCompany() != null ? demo.getDemCompany() : "");
							String strDemName = convert.convertStringText(demo.getDemName() != null ? demo.getDemName() : "");
							String strDemEmail = convert.convertStringText(demo.getDemEmail() != null ? demo.getDemEmail() : "");
							String strDemHp = convert.convertStringText(demo.getDemHp() != null ? demo.getDemHp() : "");
							int intDemStaffNumber = demo.getDemStaffNumber();
							int intDemUserNumber = demo.getDemUserNumber();
							String strDemItem = convert.convertStringText(demo.getDemItem() != null ? demo.getDemItem() : "");
							String strDemBusiness = convert.convertStringText(demo.getDemBusiness() != null ? demo.getDemBusiness() : "");
							String strDemWdate = demo.getDemWdate().toString().substring(0, 16);
														
	        	%>       
					<tr>
						<td class="t_tdFirst"><input type="checkbox" name="chkSel" value="<%=intDemIdx %>"></td>
						<td class="t_td"><%=strDemCompany %></td>
						<td class="t_td"><%=strDemName %></td>
						<td class="t_td">
							<a href="javascript:top.send_mail('<%=strDemEmail %>');"><%=strDemEmail %></a>
						</td>
						<td class="t_td"><%=strDemHp %></td>
						<td class="t_td"><%=intDemStaffNumber %><b>/</b><%=intDemUserNumber %></td>
						<td class="t_td"><%=strDemItem %><b>/</b><%=strDemBusiness %></td>
						<td class="t_td"><%=strDemWdate %></td>
					</tr>
				<%
						} //for (int i = 0; i < insArray.size(); i++) {
					} //if (insArray.size() == 0) {
				%>
			</table>
			<div id="paging">
				<%=function.postPageIndex(ROOT_DIR, totalCount, pageSize, curPage, "go_page") %>
			</div>
			
			<!-- 버튼 -->
			<div id="button">
				<span class="btn_sub" onclick="javascript:goModify();"><img alt="" src="<%=IMG_ROOT%>/icons/btn_icon_edit.gif" /><a onfocus="this.blur();">수 정</a></span>
	    		<span class="btn_sub" onclick="javascript:goDelete();"><img alt="" src="<%=IMG_ROOT%>/icons/btn_icon_del.gif" /><a onfocus="this.blur();">삭 제</a></span>
			</div>
	
			<!--도움말 부분-->
			<%=function.getTipBoxTop(ADMIN_IMG)%>
				데모신청을 관리합니다.<br>
			<%=function.getTipBoxBottom()%>
		</form>
	</div>
</body>
</html>

