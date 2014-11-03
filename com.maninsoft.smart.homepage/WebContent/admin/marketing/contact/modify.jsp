<%@ page language="java" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
<%@ include file="/common/inc/config.jsp" %>
<%@ include file="/admin/include/check_admin.jsp" %>
<%@ page import="com.maninsoft.smart.homepage.request.*" %>
<%@ page import="com.maninsoft.smart.homepage.admin.function.Function" %>
<%@ page import="com.maninsoft.smart.homepage.admin.db.contact.*" %>
<%
	Function function = Function.getInstance();
	ContactManager conmanager = ContactManager.getInstance();
	ContactBean contact = new ContactBean();
	
	String strConIdx = "";
	if (request.getParameter("chkSel") != null) {
		strConIdx = request.getParameter("chkSel");
	}
	
	contact = conmanager.getContact(strConIdx);
	
	String strConTitle =  contact.getConTitle();
    String strConCompany = contact.getConCompany();
    String strConName = contact.getConName();
    String strConHp = contact.getConHp();
    String strConEmail = contact.getConEmail();
    String strConContents = contact.getConContents();
%>
<html>
<head>
<title>
<%=SITE_TITLE_ADMIN %>
</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link href="<%=ROOT_DIR%>/common/css/admin/common.css" rel="stylesheet" type="text/css">
<script language="javascript" type="text/javascript" src="<%=ROOT_DIR%>/common/js/common.js"></script>
<link rel="stylesheet" type="text/css" href="<%=ROOT_DIR%>/smarteditor/css/default.css">
<script language="javascript" type="text/javascript" src="<%=ROOT_DIR%>/smarteditor/js/HuskyEZCreator.js" charset="utf-8"></script>
<script language="javascript" type="text/javascript">

	function goSave() {

		oEditors.getById["ir1"].exec("UPDATE_IR_FIELD", []);
		document.wForm.contents.value = oEditors.getById["ir1"].getIR();
		
		if(checkForm(document.wForm.title, "문의제목")) return;
		if(checkForm(document.wForm.company, "회사명")) return;
		if(checkForm(document.wForm.name, "담당자")) return;
		if(checkForm(document.wForm.hp, "연락처")) return;
		if(checkForm(document.wForm.email, "이메일")) return;
		if(!isEMail(document.wForm.email, "이메일")) return;
		if(checkForm(document.wForm.contents, "문의내용")) return;

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
			<input type="hidden" name="chkSel" value="<%=strConIdx %>">
			<input type="hidden" name="page" value="<%=request.getParameter("page")%>">
			<input type="hidden" name="searchType" value="<%=request.getParameter("searchType")%>">
			<input type="hidden" name="searchText" value="<%=request.getParameter("searchText")%>">
			
			<%=function.getTitleBox(ADMIN_IMG, "설치신청 수정")%>
			<table width="100%" border="0" cellpadding="0" cellspacing="0" class="t_b_bottom">
				<tr>
					<td width="15%" class="t_thC">문의제목</td>
					<td colspan="3" width="" class="t_tdL">
						<input class="input" name="title" type="text" value="<%=strConTitle %>" style="width:60%;">
					</td>
				</tr>
				<tr>
					<td width="15%" class="t_thC">회사명</td>
					<td width="35%" class="t_tdL">
						<input class="input" name="company" type="text" value="<%=strConCompany %>" style="width:60%;">	
					</td>
					<td width="15%" class="t_thC">담당자</td>
					<td width="35%" class="t_tdL">
						<input class="input" name="name" type="text" value="<%=strConName %>" style="width:60%;">	
					</td>
				</tr>
				<tr>
					<td width="15%" class="t_thC">연락처</td>
					<td width="35%" class="t_tdL">
						<input class="input" name="hp" type="text" value="<%=strConHp %>" style="width:60%;">	
					</td>
					<td width="15%" class="t_thC">이메일</td>
					<td width="35%" class="t_tdL">
						<input class="input" name="email" type="text" value="<%=strConEmail %>" style="width:60%;">	
					</td>
				</tr>
				<tr>
					<td width="15%" class="t_thC">문의내용</td>
					<td colspan="3" width="" class="t_tdL">
						<textarea name="ir1" id="ir1" style="width:97%; height:220px; display:none;"><%=strConContents%></textarea>
						<textarea name="contents" id="contents" style="display:none;"></textarea>
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
	<script language="javascript" type="text/javascript">
		var oEditors = [];
		nhn.husky.EZCreator.createInIFrame({
			oAppRef: oEditors,
			elPlaceHolder: "ir1",
			sSkinURI: "<%=ROOT_DIR%>/smarteditor/SEditorSkin.html",
			fCreator: "createSEditorInIFrame"
		});
	</script>
</body>
</html>
