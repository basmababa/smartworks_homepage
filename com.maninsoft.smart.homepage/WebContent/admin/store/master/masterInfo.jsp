<%@ page language="java" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
<%@ include file="/common/inc/config.jsp" %>
<%@ include file="/admin/include/check_admin.jsp" %>
<%@ page import="com.maninsoft.smart.homepage.admin.function.Function" %>
<%@ page import="com.maninsoft.smart.homepage.member.*" %>
<%
	Function function = Function.getInstance();
	MemberManager memmanager = MemberManager.getInstance();
	MemberBean member = new MemberBean();

	//관리자의 정보
	member = memmanager.getAdmin();
	int intRecId = member.getMemIdx();
	String strId = member.getMemId();
	String strName = member.getMemName();
	String strPass = member.getMemPass();
	String strEmail = member.getMemEmail();
%>
<html>
<head>
<title>
<%= SITE_TITLE_ADMIN %>
</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link href="<%=ROOT_DIR%>/common/css/admin/common.css" rel="stylesheet" type="text/css">
<script language="javascript" type="text/javascript" src="<%=ROOT_DIR%>/common/js/common.js"></script>
<script  type="text/JavaScript" language="javascript">

	function goModify_Admin() {
		if(checkForm(mForm.member_id, "관리자 아이디")) return;
        if(checkForm(mForm.member_name, "관리자 이름")) return;
		if(checkForm(mForm.member_email, "관리자 Email")) return;
        if(checkForm(mForm.member_pwd, "관리자 Pass")) return;

	if (document.mForm.member_pwd.value != document.mForm.member_pwd_repeat.value){
		alert("패스워드가 같지 않습니다\n다시기입하여주십시요.");
		document.mForm.member_pwd.focus();
		return;
	}

	document.mForm.action = "masterInfo_modify_ok.jsp";
	document.mForm.submit();
}

</script>
</head>
<body>
	<div id="conTents">
		<form name="mForm" method="post">
			<input type="hidden" name="rec_id" value="<%=intRecId%>">
			<%=function.getTitleBox(ADMIN_IMG, "마스터관리자")%>
			<table width="100%" border="0" cellpadding="0" cellspacing="0" class="t_b_bottom">
				<tr>
					<td width="20%" class="t_thC">마스터 ID</td>
					<td width="80%" class="t_tdL">
						<input class="input" type="text" name="member_id" maxlength="13" value="<%=strId%>">
						<img src="<%=ADMIN_IMG%>/icon_info.gif" align="middle"> 마스터의 기본정보를 변경합니다.
					</td>
				</tr>
				<tr>
					<td width="20%" class="t_thC">마스터 이름</td>
					<td width="80%" class="t_tdL">
						<input class="input" type="text" name="member_name" maxlength="13" value="<%=strName%>">
					</td>
				</tr>
				<tr>
					<td width="20%" class="t_thC">마스터 E-mail</td>
					<td width="80%" class="t_tdL">
						<input class="input" type="text" name="member_email" size="30" maxlength="" value="<%=strEmail%>">
					</td>
				</tr>
				<tr>
					<td width="20%" class="t_thC">패스워드</td>
					<td width="80%" class="t_tdL">
						<input class="input" type="password" name="member_pwd" maxlength="13" value="<%=strPass%>">
					</td>
				</tr>
				<tr>
					<td width="20%" class="t_thC">패스워드 확인</td>
					<td width="80%" class="t_tdL">
						<input class="input" type="password" name="member_pwd_repeat" maxlength="13" value="">
					</td>
				</tr>
			</table>
			<div id="button">
				관리자정보를 변경합니다.<span class="btn_sub" onclick="javascript:goModify_Admin();"><img alt="" src="<%=IMG_ROOT%>/icons/btn_icon_ok.gif" /><a onfocus="this.blur();">수 정</a></span>
			</div>
			<!--도움말 부분-->
			<%=function.getTipBoxTop(ADMIN_IMG)%>
			관리자의 정보를 수정할수 있습니다.
			<%=function.getTipBoxBottom()%>
		</form>
	</div>
</body>
</html>
