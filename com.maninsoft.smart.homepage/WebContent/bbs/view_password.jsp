<%@ page language="java" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
<%@ page errorPage="/error/error_view.jsp" %>
<%@ include file="/common/inc/config.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>
<%=SITE_TITLE_ADMIN %>
</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link href="<%=ROOT_DIR%>/common/css/common.css" rel="stylesheet" type="text/css">
<script language="javascript" type="text/javascript" src="<%=ROOT_DIR%>/common/js/common.js"></script>
<script language="javascript" type="text/javascript">
	var rootDir = "<%=ROOT_DIR%>";
</script>
</head>
<body>
	<div id="id_check" class="darkborder_dropS">
		<form name="passForm" method="post" action="" onsubmit="return false;">
			<fieldset>
				<legend>BBS Password Check Form</legend>
				<div id="info" class="darkborder">
					<div class="info_title" onmousedown="initializedrag('dialoglayer', event)" style="cursor:pointer;">BBS Password Check</div>
					<div class="info_sub">
						<span style="font-weight:bold;">패스워드</span>
						<span><input type="password" class="input" name="bbsPass" onKeyPress="check_view_password(event);"></span>
						<div id="button" class="right">
							<input type="button" class="dark_btn" value=" 확 인 " onclick="view_password();" style="cursor:pointer;">
							<input type="button" class="dark_btn" value=" 취 소 " onclick="voPopupCtrl.dialog_close();" style="cursor:pointer;">
						</div>
					</div>
				</div>
			</fieldset>
		</form>
	</div>
</body>
</html>
