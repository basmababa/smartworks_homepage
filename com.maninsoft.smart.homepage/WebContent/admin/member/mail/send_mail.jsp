<%@ page language="java" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
<%@ include file="/common/inc/config.jsp" %>
<%@ include file="/admin/include/check_admin.jsp" %>
<%@ page import="com.maninsoft.smart.homepage.admin.function.Function" %>
<%@ page import="com.maninsoft.smart.homepage.member.*" %>
<%
	Function function = Function.getInstance();

	String mail_to = "";
	if (request.getParameter("mail_to") != null) {
		mail_to = request.getParameter("mail_to");
	}
	
	String strMemId = "";
	String strMemEmail = "";
	String strMemName = "";
	
	MemberBean member = new MemberBean();
	MemberManager manager = MemberManager.getInstance();
	member = manager.getAdmin();
	
	strMemId = member.getMemId();
	strMemEmail = member.getMemEmail();
	strMemName = member.getMemName();
%>
<html>
<head>
<title>
<%= SITE_TITLE_ADMIN %>
</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link href="<%=ROOT_DIR%>/common/css/admin/common.css" rel="stylesheet" type="text/css">
<script language="javascript" type="text/javascript" src="<%=ROOT_DIR%>/common/js/common.js"></script>
<script language="javascript" type="text/javascript">

	function goSave() {
		if(checkForm(document.wForm.mail_to, "받는 사람")) return;
		if(checkForm(document.wForm.mail_from,"보내는 사람")) return;
		if(checkForm(document.wForm.mail_title, "제목")) return;
		if(checkForm(document.wForm.mail_contents, "내용")) return;
		document.wForm.submit();
	}

	function goCancel() {
		document.sForm.action = "send_mail.jsp";
		document.sForm.submit();
	}

</script>
</head>
<body>
	<div id="conTents">
		<form name="wForm" method="post" action="send_mail_ok.jsp">
			<%=function.getTitleBox(ADMIN_IMG, "메일발송")%>
			<table width="100%" cellSpacing="0" cellPadding="0" border="0" class="t_b_bottom">
				<tr>
					<td width="15%" class="t_thC">받는 사람</td>
					<td width="85%" bgcolor="#FFFFFF" class="t_tdL">
						<input class="input" type="text" name="mail_to" style="width:40%" value="<%=mail_to %>">
						(여러명에게 보낼 경우에는 <b><font color="red"> ; </font></b> 를 구분자로 사용하세요.)
					</td>
				</tr>
				<tr>
					<td width="15%" class="t_thC">보내는 사람</td>
					<td width="85%" bgcolor="#FFFFFF" class="t_tdL">
						<input class="input" type="text" name="mail_from" style="width:40%" value="<%=strMemEmail %>">
						(예; 홍길동&lt;xxx@xxx.com&gt;)
					</td>
				</tr>
				<tr>
					<td width="15%" class="t_thC">제목</td>
					<td width="85%" bgcolor="#FFFFFF" class="t_tdL">
						<input class="input" type="text" name="mail_title" style="width:60%">
						(예; 문의하신 사항입니다.)
					</td>
				</tr>
				<tr>
					<td width="15%" class="t_thC">내용</td>
					<td width="85%" bgcolor="#FFFFFF" class="t_tdL">
						<textarea class="input" name="mail_contents" rows="14" style="width:90%"></textarea>
					</td>
				</tr>
			</table>
	
			<!-- 버튼 -->
			<div id="button">
				<span class="btn_sub" onclick="javascript:goSave();"><img alt="" src="<%=IMG_ROOT%>/icons/btn_icon_ok.gif" /><a onfocus="this.blur();">확 인</a></span>
				<span class="btn_sub" onclick="javascript:goCancel();"><img alt="" src="<%=IMG_ROOT%>/icons/btn_icon_cancel.gif" /><a onfocus="this.blur();">취  소</a></span>
			</div>
	
			<!--도움말 부분-->
			<%=function.getTipBoxTop(ADMIN_IMG)%>
				메일을 발송합니다.<br>
			<%=function.getTipBoxBottom()%>
		</form>
		<form name="sForm" method="post" action=""></form>
	</div>
</body>
</html>