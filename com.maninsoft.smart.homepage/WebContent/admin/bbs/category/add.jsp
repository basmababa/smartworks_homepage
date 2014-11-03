<%@ page language="java" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
<%@ include file="/common/inc/config.jsp" %>
<%@ include file="/admin/include/check_admin.jsp" %>
<%@ page import="com.maninsoft.smart.homepage.admin.function.Function" %>
<%
	Function function = Function.getInstance();
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
		if(checkForm(document.wForm.id, "카테고리 ID")) return;
		if(isNumber(document.wForm.id,"카테고리 ID")) return;
		if(checkForm(document.wForm.name, "카테고리 이름")) return;
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
		<form name="wForm" method="post" action="add_ok.jsp">
			<%=function.getTitleBox(ADMIN_IMG, "카테고리추가")%>
			<table width="100%" cellSpacing="0" cellPadding="0" border="0" class="t_b_bottom">
				<tr>
					<td width="15%" class="t_thC">카테고리 ID</td>
					<td width="85%" bgcolor="#FFFFFF" class="t_tdL">
						<input class="input" type="text" name="id" style="width:20%" maxlength="3">
					</td>
				</tr>
				<tr>
					<td width="15%" class="t_thC">카테고리 이름</td>
					<td width="85%" bgcolor="#FFFFFF" class="t_tdL">
						<input class="input" type="text" name="name" style="width:20%" maxlength="20">
					</td>
				</tr>
			</table>
	
			<!-- 버튼 -->
			<div id="button">
				<span class="btn_sub" onclick="javascript:goSave();"><img alt="" src="<%=IMG_ROOT%>/icons/btn_icon_ok.gif" /><a onfocus="this.blur();">추 가</a></span>
				<span class="btn_sub" onclick="javascript:goCancel();"><img alt="" src="<%=IMG_ROOT%>/icons/btn_icon_cancel.gif" /><a onfocus="this.blur();">취  소</a></span>
			</div>
	
			<!--도움말 부분-->
			<%=function.getTipBoxTop(ADMIN_IMG)%>
				사용할 카테고리를 생성할 수 있습니다.<br>
				<font color="red">카테고리 ID는 중복되지 않도록 해주세요!</font><br />
			<%=function.getTipBoxBottom()%>
		</form>
		<form name="sForm" method="post" action=""></form>
	</div>
</body>
</html>