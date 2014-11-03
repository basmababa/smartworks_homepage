<%@ page language="java" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
<%@ include file="/common/inc/config.jsp" %>
<%@ include file="/admin/include/check_admin.jsp" %>
<html>
<head>
<title>
<%=SITE_TITLE_ADMIN %>
</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link href="<%=ROOT_DIR%>/common/css/admin/common.css" rel="stylesheet" type="text/css">
<script language="javascript" type="text/javascript" src="<%=ROOT_DIR%>/common/js/common.js"></script>
<script language="javascript" type="text/javascript" src="<%=ROOT_DIR%>/common/js/admin/menu_action.js"></script>
<script language="javascript" type="text/javascript" src="<%=ROOT_DIR%>/common/js/ajax/ajax_action.js"></script>
<script language="javascript" type="text/javascript" src="<%=ROOT_DIR%>/common/js/ajax/ajax_event.js"></script>
<script language="javascript" type="text/javascript">
	//자바 스크립트 전역변수 설정//
	var rootDir = "<%=ROOT_DIR%>";
	var curDate = "";
	///////////////////////////
	
	window.onload = function () {
		main_page();
		ajax.Event.addListener(document.getElementById("contentsFrame"),"load",iframe_height);
	};
	
	function iframe_height() {
		 
		if(contentsFrame.document.getElementById("conTents")){
			document.getElementById("contentsFrame").style.height= '0px';
			document.getElementById("quickMenu").style.height= '0px';
			document.getElementById("subMenu").style.height= '0px';
		    
			var topOffsetHeight = document.body.clientHeight - (document.getElementById("topArea").offsetHeight + document.getElementById("info").offsetHeight) - 9;

			if (parent.document.getElementById("contentsFrame").contentWindow.document.body.scrollHeight > topOffsetHeight) {
				document.getElementById("contentsFrame").style.height = parent.document.getElementById("contentsFrame").contentWindow.document.body.scrollHeight + 'px'
				document.getElementById("quickMenu").style.height = parent.document.getElementById("contentsFrame").contentWindow.document.body.scrollHeight + document.getElementById("info").offsetHeight + 9 + 'px';
				document.getElementById("subMenu").style.height = parent.document.getElementById("contentsFrame").contentWindow.document.body.scrollHeight + 'px';
			} else {
				document.getElementById("contentsFrame").style.height = topOffsetHeight + 'px';
				document.getElementById("quickMenu").style.height = topOffsetHeight + document.getElementById("info").offsetHeight + 9 + 'px';
				document.getElementById("subMenu").style.height = topOffsetHeight +'px';
			}
		    //parent.document.getElementById("contentsFrame").contentWindow.document.body.scrollHeight = '0px';
		}
	}
</script>
</head>
<body>
	<table border="0" cellpadding="0" cellspacing="0" width="100%" height="100%">
		<tr>
			<td><!-- [s] top area -->
				<div id="topArea">
					<jsp:include page="/admin/include/top.jsp" flush="true"></jsp:include>
				</div>
			</td><!-- [e] top area -->
		</tr>
		<tr>
			<td height="100%" valign="top"><!-- [s] body area -->
				<table border="0" cellpadding="0" cellspacing="0" width="100%" height="100%"><!-- [s] body layout -->
					<tr>
						<td valign="top" height="100%"><!-- [s] left area --><!-- [s] Quick Menu -->
							<div id="quickMenu">
								<jsp:include page="/admin/include/quick_menu.jsp" flush="true"></jsp:include>
							</div>
						</td><!-- [e] Quick Menu -->
						<td valign="top"><!-- [s] Sub Menu -->
							<div id="subMenu"></div>
						</td><!-- [e] Sub Menu --><!-- [e] left area -->
						<td bgcolor="#f7f6f2" width="100%" height="100%" valign="top"><!-- [s] main area -->
							<table border="0" cellpadding="0" cellspacing="0" width="100%" height="100%">
								<tr>
									<td valign="top"><!-- [s] sub info -->
										<div id="info"></div>
									</td><!-- [e] sub info -->
								</tr>
								<tr>
									<td valign="top"><!-- [s] contents -->
										<iframe src="" name="contentsFrame" id="contentsFrame" frameborder="0" scrolling="no" style="width:100%; height:100%;"></iframe>
									</td><!-- [e] contents --><!-- [e] main area -->
								</tr>
							</table>
						</td>
					</tr>
				</table><!-- [e] body layout -->
			</td> <!-- [e] body area -->
		</tr>
	</table>
</body>
</html>
