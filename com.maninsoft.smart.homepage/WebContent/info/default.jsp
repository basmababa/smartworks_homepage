<%@ page language="java" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
<%@ page errorPage="/error/error_view.jsp" %>
<%@ include file="/common/inc/config.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>
<%=SITE_TITLE %>
</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link rel="stylesheet" type="text/css" href="<%=ROOT_DIR%>/common/css/common.css">
<link rel="stylesheet" type="text/css" href="<%=ROOT_DIR%>/common/css/tooltip/tooltip.css">
<script type="text/javascript" src="<%=ROOT_DIR%>/common/js/common.js"></script>
<script type="text/javascript" src="<%=ROOT_DIR%>/common/js/menu_action.js"></script>
<script language="javascript" type="text/javascript">
	var rootDir = "<%=ROOT_DIR%>";
</script>
</head>
<body>
	<table width="960" border="0" cellspacing="0" cellpadding="0">
		<tr>
			<td align="center" valign="top">
				<table width="167" border="0" cellspacing="0" cellpadding="0">
					<tr>
						<td><img src="<%=IMG_ROOT%>/popleft_01.jpg" width="167" height="72" alt="SmartWorks.net Logo"></td>
					</tr>
				</table>
			</td>
			<td width="793" height="72" align="right" valign="top" background="<%=IMG_ROOT%>/popmain_bg.jpg">
				<%-- 
				<table width="290" border="0" cellspacing="0" cellpadding="0">
					<tr>
						<td height="5" align="right"></td>
						<td width="5" rowspan="2">&nbsp;</td>
					</tr>
					<tr>
						<td align="right"><span class="txblue">스마트웍스닷넷 <strong>홈</strong> | 앱스토어 |<strong> MY</strong>스마트웍스닷넷</span></td>
					</tr>
				</table>
				--%>
			</td>
		</tr>
		<tr>
			<td valign="top">
				<table width="167" border="0" cellspacing="0" cellpadding="0">
					<tr>
						<td><br></td>
					</tr>
					<tr>
						<td>
							<table width="167" border="0" cellspacing="0" cellpadding="0" background="<%=IMG_ROOT%>/popleft_bg.jpg">
								<tr>
									<td><img src="<%=IMG_ROOT%>/popleft_02.jpg" width="167" height="50" alt=""></td>
								</tr>
								<tr>
									<td><img src="<%=IMG_ROOT%>/popleft_03.jpg" width="167" height="26" alt="" onclick="javascript:pop_menu01();" style="cursor:pointer"></td>
								</tr>
								<tr>
									<td><img src="<%=IMG_ROOT%>/popleft_04.jpg" width="167" height="26" alt="" onclick="javascript:pop_menu02();" style="cursor:pointer"></td>
								</tr>
								<tr>
									<td><img src="<%=IMG_ROOT%>/popleft_05.jpg" width="167" height="22" alt="" onclick="javascript:pop_menu03();" style="cursor:pointer"></td>
								</tr>
								<tr>
									<td><img src="<%=IMG_ROOT%>/popleft_06.jpg" width="167" height="22" alt="" onclick="javascript:pop_menu04();" style="cursor:pointer"></td>
								</tr>
								<tr>
									<td height="19">&nbsp;</td>
								</tr>
								<tr>
									<td>
										<img src="<%=IMG_ROOT%>/popleft_07.jpg" width="167" height="33" alt="" onclick="javascript:pop_menu05();" style="cursor:pointer">
									</td>
								</tr>
								<tr>
									<td height="19">&nbsp;</td>
								</tr>
								<tr>
									<td>
										<img src="<%=IMG_ROOT%>/popleft_08.jpg" width="167" height="33" alt="" onclick="javascript:pop_menu06();" style="cursor:pointer">
									</td>
								</tr>
								<tr>
									<td height="19">&nbsp;</td>
								</tr>
								<tr>
									<td>
										<img src="<%=IMG_ROOT%>/popleft_09.jpg" width="167" height="33" alt="" onclick="javascript:pop_menu07();" style="cursor:pointer">
									</td>
								</tr>
								<tr>
									<td height="19">&nbsp;</td>
								</tr>
								<tr>
									<td>
										<img src="<%=IMG_ROOT%>/popleft_10.jpg" width="167" height="33" alt="" onclick="javascript:pop_menu08();" style="cursor:pointer">
									</td>
								</tr>
								<tr>
									<td><img src="<%=IMG_ROOT%>/popleft_11.jpg" width="167" height="31" alt=""></td>
								</tr>
							</table>
						</td>
					</tr>
				</table>
			</td>
			<td width="793" valign="top" bgcolor="#FFFFFF"><!-- contents area start -->
				
			</td><!-- contents area end -->
		</tr>
		<tr>
			<td height="20"></td>
		</tr>
	</table>
</body>
</html>
