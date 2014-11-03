<%@ page language="java" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
<%@ include file="/common/inc/config.jsp" %>
<%@ page import="com.maninsoft.smart.homepage.member.*" %>
<%
	MemberBean member = new MemberBean();
	MemberManager manager = MemberManager.getInstance();
	
	//관리자의 정보를 가져온다(email)
	member = manager.getAdmin();
	String admin_email = "admin@maninsoft.co.kr";
	
	if (member != null){
		admin_email = member.getMemEmail();
	}
%>
<html>
<head>
<title>
<%=SITE_TITLE_ADMIN %>
</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link rel="stylesheet" type="text/css" href="<%=ROOT_DIR%>/common/css/admin/common.css">
<script language="javascript" type="text/javascript" src="<%=ROOT_DIR%>/common/js/common.js"></script>
<script language="javascript" type="text/javascript">
<!--
function go_login() {
	if(loginForm.txtID.value == "") {
		alert("ID를 입력해주세요");
		loginForm.txtID.focus();
		return false;
	}
	if(loginForm.txtPassword.value == "") {
		alert("PW를 입력해주세요");
		loginForm.txtPassword.focus();
		return false;
	}
	return true;
}
//-->
</script>
</head>
<body style="background:#3a77b4 url(<%=ADMIN_IMG%>/login_bg.gif) repeat-x;" onload="document.loginForm.txtID.focus();">
	<form name="loginForm" method="post" action="login_ok.jsp"  onsubmit="return go_login();">
		<input type="hidden" name="loginURL" value="<%=CUR_PAGE%>">
		<table width="100%" height="100%" border="0" cellpadding="0" cellspacing="0">
			<tr>
				<td height="200"></td>
			</tr>
			<tr>
				<td align="center" valign="top">
					<table width="420" height="270" border="0" cellpadding="0" cellspacing="0" class="logBoxbg">
						<tr>
							<td height="75" valign="top" class="logTitle">
								<img src="<%=ADMIN_IMG%>/login_arrow.gif" alt="" onclick="location.href='<%=ROOT_DIR %>'"/>
								<img src="<%=ADMIN_IMG%>/login_title.gif" alt="" />
							</td>
						</tr>
						<tr>
							<td height="114" valign="top" class="logForm" align="center">
								<table border="0" cellspacing="0" cellpadding="0">
									<tr>
										<td style="padding-right:10px">
											<img src="<%=ADMIN_IMG%>/login_id.gif" alt="" />
										</td>
										<td>
											<input class="input" type="text" name="txtID" size="12" tabindex="1" style="padding-top:2px;width:150px; height:20px;" >
										</td>
										<td rowspan="3" style="padding-left:10px">
											<input type="image" src="<%=ADMIN_IMG%>/bt_login.gif" alt="" tabindex="3" align="top"/>
										</td>
									</tr>
									<tr>
										<td height="8"></td>
										<td></td>
									</tr>
									<tr>
										<td style="padding-right:10px">
											<img src="<%=ADMIN_IMG%>/login_pw.gif" alt="" />
										</td>
										<td>
											<input class="input" type="password" name="txtPassword" size="12" tabindex="2" style="padding-top:2px;width:150px; height:20px;" >
										</td>
									</tr>
								</table>
							</td>
						</tr>
						<tr>
							<td valign="top" class="logText">
								등록된 ID만 이용 가능합니다.<br />
								등록되지 않으신분은 관리자에게 연락바랍니다.<br />
								<span class="text_blu"><a href="mailto:<%=admin_email %>"><%=admin_email %></a></span>
							</td>
						</tr>
					</table>
				</td>
			</tr>
		</table>
	</form>
</body>
</html>
