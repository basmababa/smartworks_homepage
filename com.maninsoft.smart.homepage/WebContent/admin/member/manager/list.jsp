<%@ page language="java" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
<%@ include file="/common/inc/config.jsp" %>
<%@ include file="/admin/include/check_admin.jsp" %>
<%@ page import="com.maninsoft.smart.homepage.request.*" %>
<%@ page import="com.maninsoft.smart.homepage.member.*" %>
<%@ page import="com.maninsoft.smart.homepage.member.level.*" %>
<%@ page import="com.maninsoft.smart.homepage.admin.function.Function" %>
<%@ page import="java.util.ArrayList" %>
<%
	Function function = Function.getInstance();
	MemberManager manager = MemberManager.getInstance();
	LevelManager levelmanager = LevelManager.getInstance();
	Request req = new Request(request);
	
	//공통인수의 초기화
	int curPage = 1;
	String option_type = "last_login";
	String option_order = "desc";
	int pageSize = 20;
	String option_status = "";
	String search_keyword = "";
	String search_type = "";

	//페이징을 위한 공통 Parameter
	if (request.getParameter("page") != null) {
		curPage = Integer.parseInt(request.getParameter("page"));
	}
	if (request.getParameter("option_type") != null) {
		option_type = request.getParameter("option_type");
	}
	if (request.getParameter("option_order") != null) {
		option_order = request.getParameter("option_order");
	}
	if (request.getParameter("option_size") != null) {
		pageSize = Integer.parseInt(request.getParameter("option_size"));
	}
	if (request.getParameter("option_status") != null) {
		option_status = request.getParameter("option_status");
	}
	if (request.getParameter("search_keyword") != null) {
		search_keyword = request.getParameter("search_keyword");
	}
	if (request.getParameter("search_type") != null) {
		search_type = request.getParameter("search_type");
	}

	int totalCount = 0;
	String strWhere = "";
	String strOrder = "";
	
	//선택 회원등급처리
	if (option_status.equals("")) { 			//전체 : 탈퇴회원 포함
		//strWhere = strWhere;
	} else if (option_status.equals("a")) {	//가입회원 : 탈퇴회원 제외
		strWhere += " where lev_id != '999'";
	} else {
		strWhere += " where lev_id = '" + option_status + "'";
	}
	
	//검색어 처리
	if (option_status.equals("")) {
		if (!search_keyword.equals("") && !search_type.equals("")) {
			strWhere += " where " + search_type + " like '%" + search_keyword + "%'";
		}
	} else {
		if (!search_keyword.equals("") && !search_type.equals("")) {
			strWhere += " and " + search_type + " like '%" + search_keyword + "%'";
		}
	}

	//정렬 타입, 정렬 옵션 처리
	strOrder = " order by " + option_type + " " + option_order;

	totalCount = manager.getMemberListCount(strWhere);

	ArrayList memberArray = null;
	memberArray = manager.getMemberList(req, strWhere, strOrder);

	//사용중인 레벨들을 가져온다
	ArrayList levelArray = levelmanager.getUseLevelList();
%>
<html>
<head>
<title>
<%=SITE_TITLE_ADMIN %>
</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link href="<%=ROOT_DIR%>/common/css/admin/common.css" rel="stylesheet" type="text/css">
<link href="<%=ROOT_DIR%>/common/css/tooltip/tooltip.css" rel="stylesheet" type="text/css">
<script language="javascript" type="text/javascript" src="<%=ROOT_DIR%>/common/js/common.js"></script>
<script language="javascript" type="text/javascript">

	function search_exe(){
		if (document.LForm.search_type.value == "") {
			alert("검색조건을 선택하세요.");
			return;
		}
		if (document.LForm.search_keyword.value == "") {
			alert("검색값을 선택하세요.");
			return;
		}
		goList();
	}
	
	function goList() {
		document.LForm.action = "list.jsp";
		document.LForm.submit();
	}
	
	function goLevel() {
		var chkObj = document.getElementsByName("chkSel");
		// check box 있을경우
		if(chkObj.length > 0 ) {
			var count = 0;
			for (var i = 0; i < chkObj.length; i++) {	// check 된 항목의 개수
				if (chkObj[i].checked) {
					count++;
				}
			}
			if(count == 0) {
				alert("적용할 항목을 선택해주세요.");
				return;
			}
		} else {
			alert("적용할 항목이 없습니다.");
			return;
		}
	
		document.LForm.action = "modify_level_ok.jsp";
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
	
	function go_page(page) {
		document.LForm.page.value = page;
		document.LForm.action = "list.jsp";
		document.LForm.submit();
	}
	
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
	
	function search_cancel() {
		location.href = "list.jsp";
	}
	
	function goAdd() {
		document.LForm.action = "add.jsp";
		document.LForm.submit();
	}
</script>
</head>
<body>
	<div id="conTents">
		<!-- tooltip start -->
		<div id="dhtmltooltip"></div>
		<script type="text/javascript" src="<%=ROOT_DIR%>/common/js/tooltip/tooltip.js"></script>
		<!-- tooltip end -->
		<form name="LForm" method="post" action="list.jsp">
			<input type="hidden" name="page" value="<%=curPage%>">
			<%=function.getTitleBox(ADMIN_IMG, "회원 관리(" + totalCount + ")")%>
			<table width="100%" border="0" cellpadding="0" cellspacing="0" class="t_b_bottom">
				<tr height="50">
					<td colspan="17" width="100%">
						<div id="search">
							<table cellSpacing="0" cellPadding="0" border="0">
								<tr>
									<th class="text_blu" style="padding-right:10px;">출력옵션</th>
									<th>
										<select name="option_type">
											<option value="mem_register" <%if (option_type.equals("mem_register")) { out.println("selected"); }%>>회원등록일</option>
											<option value="last_login" <%if (option_type.equals("last_login")) { out.println("selected"); }%>>마지막로그인</option>
											<option value="mem_id" <%if (option_type.equals("mem_id")) { out.println("selected"); }%>>회원ID</option>
											<option value="mem_name" <%if (option_type.equals("mem_name")) { out.println("selected"); }%>>이름</option>
										</select>
										<select name="option_order">
											<option value="desc" <%if (option_order.equals("desc")) { out.println("selected"); }%>>내림차순</option>
											<option value="asc" <%if (option_order.equals("asc")) { out.println("selected"); }%>>오름차순</option>
										</select>
										<select name="option_size">
											<option value="5" <%if (pageSize == 5) { out.println("selected"); }%>>5 항목</option>
											<option value="10" <%if (pageSize == 10) { out.println("selected"); }%>>10항목</option>
											<option value="15" <%if (pageSize == 15) { out.println("selected"); }%>>15항목</option>
											<option value="20" <%if (pageSize == 20) { out.println("selected"); }%>>20항목</option>
											<option value="25" <%if (pageSize == 25) { out.println("selected"); }%>>25항목</option>
											<option value="30" <%if (pageSize == 30) { out.println("selected"); }%>>30항목</option>
											<option value="35" <%if (pageSize == 35) { out.println("selected"); }%>>35항목</option>
											<option value="40" <%if (pageSize == 40) { out.println("selected"); }%>>40항목</option>
											<option value="45" <%if (pageSize == 45) { out.println("selected"); }%>>45항목</option>
											<option value="50" <%if (pageSize == 50) { out.println("selected"); }%>>50항목</option>
										</select>
										<select name="option_status">
											<option value="" <%if (option_status.equals("")) { out.println("selected"); }%>>:: 전체회원권한 ::</option>
											<option value="a" <%if (option_status.equals("a")) { out.println("selected"); }%>>가입회원</option>
											<% 
												for(int i = 0; i < levelArray.size(); i++) {
													LevelBean level = new LevelBean();
													level = (LevelBean) levelArray.get(i);
													String lName = level.getLevName();
													String lId = level.getLevId();
											%>
											<option value="<%=lId%>" <%if (option_status.equals(lId)) { out.println("selected"); }%>><%=lName %></option>
											<% } %>
										</select>
										<input type="button" class="btn_nomal" name="" value=" 적 용 " onClick="javascript:goList();" />
									</th>
								</tr>
								<tr>
									<th class="text_blu" style="padding-right:10px;">검&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;색</th>
									<td>
										<select name="search_type">
											<option value="" <%if (search_type.equals("")) { out.println("selected"); }%>>::검색조건선택::</option>
											<option value="mem_id" <%if (search_type.equals("mem_id")) { out.println("selected"); }%>>회원ID</option>
											<option value="mem_name" <%if (search_type.equals("mem_name")) { out.println("selected"); }%>>이름</option>
											<option value="mem_email" <%if (search_type.equals("mem_email")) { out.println("selected"); }%>>Email</option>
											<option value="mem_hp" <%if (search_type.equals("mem_hp")) { out.println("selected"); }%>>휴대폰</option>
										</select>
										<input type="text" name="search_keyword" size="20" value="<%=search_keyword%>">
										<input type="button" class="btn_nomal" name="" value=" 검 색 " onClick="javascript:search_exe();" />
										<input type="button" class="btn_nomal" name="" value=" 검색취소 " onClick="javascript:search_cancel();" />
									</td>
								</tr>
							</table>
		            	</div>
					</td>
				</tr>
				<tr>
					<th width="1%" class="t_th">
						<input type="checkbox" id="allcheck" name="allcheck" onClick="allCheck()">
					</th>
					<th width="8%" class="t_th">회원ID</th>
					<th width="5%" class="t_th">성명</th>
					<th width="15%" class="t_th">email</th>
					<th width="10%" class="t_th">전화번호<br />(휴대폰번호)</th>
					<th class="t_th">주소</TH>
					<th width="6%" class="t_th">회원권한</th>
					<th width="7%" class="t_th">가입일</th>
					<th width="7%" class="t_th">Last Login</th>
		        </tr>
		        <% if (totalCount < 1) { %>
				<tr>
					<td class="t_tdFirst" colSpan="17" height="200">
						<img src="<%=ADMIN_IMG%>/title_empty_result.gif" width="332" height="81">
					</td>
		        </tr>
		        <% } else { %>
		        <%
					for(int i=0 ; i<memberArray.size() ; i++) {
			            MemberBean member = new MemberBean();
			            member = (MemberBean) memberArray.get(i);
			            int intRecId = member.getMemIdx();
			            String strId = member.getMemId();
			            String strName = member.getMemName();
			            String strEmail = member.getMemEmail();
			            String strTel = member.getMemTel();
			            String strHp = member.getMemHp();
			            String strAddress = member.getMemAddress();
			            String strZipcode = member.getMemZipCode();
			            String strLevelId = member.getMemLevId();
			            String strRegister = member.getMemRegister().toString();
			            String strLastLogin = member.getMemLastLogin().toString();
			            
			            String strLevelName = levelmanager.getLevelName(strLevelId);
		        %>
				<tr>
					<td class="t_tdFirst">
						<input type="checkbox" id="chkSel" name="chkSel" value="<%=strId %>">
					</td>
					<td class="t_td"><%=strId %></td>
					<td class="t_td"><%=strName %></td>
					<td class="t_td">
						<a href="javascript:top.send_mail('<%=strEmail %>');"><%=strEmail %></a>
					</td>
					<td class="t_td"><%=strTel %><br />(<%=strHp %>)</td>
					<td class="t_tdL">(<%=strZipcode %>) <%=strAddress %></td>
					<td class="t_td">
						<% if (strLevelId.equals("1")) {%>
							<font color="#dd77ff"><%=strLevelName %></font>
						<%} else if (strLevelId.equals("999")) {%>
							<font color="#ff9900"><%=strLevelName %></font>
						<% } else { %>
							<%=strLevelName %>
						<% } %>
					</td>
					<td class="t_td" style="cursor:pointer" onmouseover="javascript:ddrivetip('<%=strRegister%>','', 160);" onmouseout="javascript:hideddrivetip();">
						<%=strRegister.substring(0,10) %>
					</td>
					<td class="t_td" style="cursor:pointer" onmouseover="javascript:ddrivetip('<%=strLastLogin%>','', 160);" onmouseout="javascript:hideddrivetip();">
						<%=strLastLogin.substring(0,10) %>
					</td>
		        </tr>
				<%
						}
					}
				%>
			</table>
		    <div id="paging">
				<%=function.postPageIndex(ROOT_DIR, totalCount, pageSize, curPage, "go_page") %>
		    </div>
			<div id="button">
				선택한 회원의 <font color="blue"><b>권한</b></font>을 일괄
				<select id="level" name="level">
				<% 
					for(int i=0 ; i<levelArray.size() ; i++) {
						LevelBean level = new LevelBean();
						level = (LevelBean) levelArray.get(i);
						String lName = level.getLevName();
						String lId = level.getLevId();
				%>
					<option value="<%=lId%>"><%=lName %></option>
				<% } %>
				</select>
				으로
				<span class="btn_sub" onclick="javascript:goLevel();"><img alt="" src="<%=IMG_ROOT%>/icons/btn_icon_ok.gif" /><a onfocus="this.blur();">적용</a></span>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<span class="btn_sub" onclick="javascript:goAdd();"><img alt="" src="<%=IMG_ROOT%>/icons/btn_icon_add2.gif" /><a onfocus="this.blur();">추가</a></span>
				<span class="btn_sub" onclick="javascript:goModify();"><img alt="" src="<%=IMG_ROOT%>/icons/btn_icon_edit.gif" /><a onfocus="this.blur();">수 정</a></span>
				<span class="btn_sub" onclick="javascript:goDelete();"><img alt="" src="<%=IMG_ROOT%>/icons/btn_icon_del.gif" /><a onfocus="this.blur();">삭 제</a></span>
			</div>
			<!--도움말 부분-->
			<%=function.getTipBoxTop(ADMIN_IMG)%>
				일반회원의 검색 및 권한을 수정할 수 있습니다.
			<%=function.getTipBoxBottom()%>
		</form>
	</div>
</body>
</html>
		