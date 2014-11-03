<%@ page language="java" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
<%@ include file="/common/inc/config.jsp" %>
<%@ include file="/admin/include/check_admin.jsp" %>
<%@ page import="com.maninsoft.smart.homepage.request.*"%>
<%@ page import="com.maninsoft.smart.homepage.bbs.category.*" %>
<%@ page import="com.maninsoft.smart.homepage.admin.function.Function" %>
<%
	Request req = new Request(request);
	Function function = Function.getInstance();
	CategoryManager categorymanager = CategoryManager.getInstance();
	CategoryBean category = new CategoryBean();
	category = categorymanager.getCategory(req);

	String strCategoryId = category.getCatId();
	String strCategoryName = category.getCatName();
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
		<form name="wForm" method="post" action="modify_ok.jsp">
			<input type="hidden" name="rec_id" value="<%=req.getString("chkSel")%>">
			<%=function.getTitleBox(ADMIN_IMG, "카테고리수정")%>
			<table width="100%" cellSpacing="0" cellPadding="0" border="0" class="t_b_bottom">
				<tr>
					<td width="15%" class="t_thC">카테고리 ID</td>
					<td width="85%" bgcolor="#FFFFFF" class="t_tdL">
						<input class="input" type="text" name="id" style="width:20%" maxlength="3" value="<%=strCategoryId%>">
					</td>
				</tr>
				<tr>
					<td width="15%" class="t_thC">카테고리 이름</td>
					<td width="85%" bgcolor="#FFFFFF" class="t_tdL">
						<input class="input" type="text" name="name" style="width:20%" maxlength="20" value="<%=strCategoryName%>">
					</td>
				</tr>
			</table>
	
			<!-- 버튼 -->
			<div id="button">
				<span class="btn_sub" onclick="javascript:goSave();"><img alt="" src="<%=IMG_ROOT%>/icons/btn_icon_ok.gif" /><a onfocus="this.blur();">수 정</a></span>
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
