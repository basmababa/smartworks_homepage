<%@ page language="java" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
<%@ include file="/common/inc/config.jsp" %>
<%@ include file="/admin/include/check_admin.jsp" %>
<%@ page import="com.maninsoft.smart.homepage.request.*" %>
<%@ page import="com.maninsoft.smart.homepage.admin.function.Function" %>
<%@ page import="com.maninsoft.smart.homepage.admin.db.install.*" %>
<%
	Function function = Function.getInstance();
	InstallManager insmanager = InstallManager.getInstance();
	InstallBean install = new InstallBean();
	
	String strInsIdx = "";
	if (request.getParameter("chkSel") != null) {
		strInsIdx = request.getParameter("chkSel");
	}
	
	install = insmanager.getInstall(strInsIdx);
	
    String strInsCompany = install.getInsCompany();
    String strInsName = install.getInsName();
    String strInsEmail = install.getInsEmail();
    String strInsHp = install.getInsHp();
    int intInsStaffNumber = install.getInsStaffNumber();
    int intInsUserNumber = install.getInsUserNumber();
    String strInsItem = install.getInsItem();
    String strInsBusiness = install.getInsBusiness();
    String strInsServerLocation = install.getInsServerLocation();
    String strInsNetwork = install.getInsNetwork();
%>
<html>
<head>
<title>
<%=SITE_TITLE_ADMIN %>
</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link href="<%=ROOT_DIR%>/common/css/admin/common.css" rel="stylesheet" type="text/css">
<script language="javascript" type="text/javascript" src="<%=ROOT_DIR%>/common/js/common.js"></script>
<script language="javascript" type="text/javascript">

	function goSave() {
		if(checkForm(document.wForm.company, "회사명")) return;
		if(checkForm(document.wForm.name, "담당자")) return;
		if(checkForm(document.wForm.email, "이메일")) return;
		if(!isEMail(document.wForm.email)) return;
		if(checkForm(document.wForm.hp, "연락처")) return;
		if(checkForm(document.wForm.staff_number, "직원수")) return;
		if(isNumber(document.wForm.staff_number, "직원수")) return;
		if(checkForm(document.wForm.user_number, "사용자수")) return;
		if(isNumber(document.wForm.user_number, "사용자수")) return;
		if(checkForm(document.wForm.item, "업종")) return;
		if(checkForm(document.wForm.business, "업태")) return;

		document.wForm.submit();
	}

	function goCancel() {
		document.sForm.action = "list.jsp";
		document.sForm.submit();
	}

</script>
</head>
<body>
	<div id="conTents">
		<form name="wForm" method="post" action="modify_ok.jsp">
			<input type="hidden" name="chkSel" value="<%=strInsIdx %>">
			<input type="hidden" name="page" value="<%=request.getParameter("page")%>">
			<input type="hidden" name="searchType" value="<%=request.getParameter("searchType")%>">
			<input type="hidden" name="searchText" value="<%=request.getParameter("searchText")%>">
			
			<%=function.getTitleBox(ADMIN_IMG, "설치신청 수정")%>
			<table width="100%" border="0" cellpadding="0" cellspacing="0" class="t_b_bottom">
				<tr>
					<td width="15%" class="t_thC">회사명</td>
					<td width="35%" class="t_tdL">
						<input class="input" name="company" type="text" value="<%=strInsCompany %>" style="width:60%;">
					</td>
					<td width="15%" class="t_thC">담당자</td>
					<td width="35%" class="t_tdL">
						<input class="input" name="name" type="text" value="<%=strInsName %>" style="width:60%;">
					</td>
				</tr>
				<tr>
					<td width="15%" class="t_thC">이메일</td>
					<td width="35%" class="t_tdL">
						<input class="input" name="email" type="text" value="<%=strInsEmail %>" style="width:60%;">	
					</td>
					<td width="15%" class="t_thC">연락처</td>
					<td width="35%" class="t_tdL">
						<input class="input" name="hp" type="text" value="<%=strInsHp %>" style="width:60%;">	
					</td>
				</tr>
				<tr>
					<td width="15%" class="t_thC">직원수</td>
					<td width="35%" class="t_tdL">
						<input class="input" name="staff_number" type="text" value="<%=intInsStaffNumber %>" style="width:60%;">	
					</td>
					<td width="15%" class="t_thC">사용자수</td>
					<td width="35%" class="t_tdL">
						<input class="input" name="user_number" type="text" value="<%=intInsUserNumber %>" style="width:60%;">	
					</td>
				</tr>
				<tr>
					<td width="15%" class="t_thC">업종</td>
					<td width="35%" class="t_tdL">
						<input class="input" name="item" type="text" value="<%=strInsItem %>" style="width:60%;">	
					</td>
					<td width="15%" class="t_thC">업태</td>
					<td width="35%" class="t_tdL">
						<input class="input" name="business" type="text" value="<%=strInsBusiness %>" style="width:60%;">	
					</td>
				</tr>
				<tr>
					<td width="15%" class="t_thC">서버위치</td>
					<td width="35%" class="t_tdL">
						<input type="radio" name="server_location" value="1" <% if (strInsServerLocation.equals("1")) { out.println("checked='checked'"); } %>>
						회사 내
						<input type="radio" name="server_location" value="2" <% if (strInsServerLocation.equals("2")) { out.println("checked='checked'"); } %>>
						IDC
						<input type="radio" name="server_location" value="0" <% if (strInsServerLocation.equals("0")) { out.println("checked='checked'"); } %>>
						기타 
					</td>
					<td width="15%" class="t_thC">네트워크 환경</td>
					<td width="35%" class="t_tdL">
						<input type="radio" name="network" value="1" <% if (strInsNetwork.equals("1")) { out.println("checked='checked'"); } %>>
						전용선
						<input type="radio" name="network" value="2" <% if (strInsNetwork.equals("2")) { out.println("checked='checked'"); } %>>
						DSL/광랜
						<input type="radio" name="network" value="0" <% if (strInsNetwork.equals("0")) { out.println("checked='checked'"); } %>>
						기타	
					</td>
				</tr>
			</table>
	
			<div id="button">
				<span class="btn_sub" onclick="javascript:goSave();"><img alt="" src="<%=IMG_ROOT%>/icons/btn_icon_ok.gif" /><a onfocus="this.blur();">수 정</a></span>
				<span class="btn_sub" onclick="javascript:goCancel();"><img alt="" src="<%=IMG_ROOT%>/icons/btn_icon_cancel.gif" /><a onfocus="this.blur();">취  소</a></span>
			</div>
	
			<!--도움말 부분-->
			<%=function.getTipBoxTop(ADMIN_IMG)%>
				설치신청 정보를 수정합니다.
			<%=function.getTipBoxBottom()%>
		</form>
		<form name="sForm" method="post" action="">
			<input type="hidden" name="page" value="<%=request.getParameter("page")%>">
			<input type="hidden" name="searchType" value="<%=request.getParameter("searchType")%>">
			<input type="hidden" name="searchText" value="<%=request.getParameter("searchText")%>">
		</form>
	</div>
</body>
</html>
