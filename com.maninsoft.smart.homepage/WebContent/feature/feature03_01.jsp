<%@ page language="java" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
<%@ page errorPage="/error/error_view.jsp" %>
<%@ include file="/common/inc/config.jsp" %>
<%@ include file="info.jsp" %>
<%
	String PAGE_INFO = "menu02_sub03_01";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>
<%=SITE_TITLE %>
</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link href="<%=ROOT_DIR%>/common/css/common.css" rel="stylesheet" type="text/css">
<script language="javascript" type="text/javascript" src="<%=ROOT_DIR%>/common/js/common.js"></script>
<script language="javascript" type="text/javascript" src="<%=ROOT_DIR%>/common/js/menu_action.js"></script>
<script language="javascript" type="text/javascript">
</script>
</head>
<body>
	<jsp:include page="/include/hidden.jsp" flush="true"></jsp:include>
	<div id="cbody">
		<div id="wrap">
			<div id="header">
				<jsp:include page="/include/header.jsp" flush="true"></jsp:include>
			</div>
			<div id="mainwrap">
				<div id="left">
					<jsp:include page="/include/left.jsp" flush="true">
						<jsp:param name="category" value="<%=CATEGORY_SECTION %>" />
						<jsp:param name="pageInfo" value="<%=PAGE_INFO %>" />
					</jsp:include>
				</div>
				<div id="contents">
					<table width="770" border="0" cellspacing="0" cellpadding="0">
						<tr>
						    <td colspan="2"><img src="<%=IMG_ROOT%>/function_title.jpg" width="769" height="86" alt="주요기능"></td>
						</tr>
						<tr>
							<td colspan="2" align="right">
								<table width="500" border="0" cellspacing="0" cellpadding="0">
									<tr>
										<td width="486" align="right">
											<a href="javascript:go_home();"><strong>HOME</strong></a> &gt;
											<a href="javascript:menu02_sub01();">주요기능</a> &gt;
											작업공간 (메인화면)
										</td>
								        <td width="14">&nbsp;</td>
									</tr>
								</table>
							</td>
						</tr>
						<tr>
							<td colspan="2"><img src="<%=IMG_ROOT%>/function_stitle_03_001.jpg" width="295" height="18" alt="작업공간 (메인화면)"></td>
						</tr>
						<tr>
							<td height="20" colspan="2">&nbsp;</td>
						</tr>
						<tr>
							<td width="31">&nbsp;</td>
							<td width="739">
								<table width="710" border="0" cellspacing="0" cellpadding="0">
									<tr>
										<td width="14" valign="top"><img src="<%=IMG_ROOT%>/bullet_01.jpg" width="11" height="10" alt=""></td>
										<td>
											스마트웍스 <strong>작업공간</strong>은 실제로 사용자들이 해당 업무를 수행하는 곳입니다. 
											작업공간은 스마트웍스닷넷의 기본 사상인 참여와 공유, UCC가 구현되어 있습니다. 
											수행 또는 조회되는 업무에 대하여 쉽게 참여하고 전달, 또는 필요 시 결재를 수행할 수 있으며 사용자공간을 창조할 수도 있습니다.
										</td>
									</tr>
								</table>
							</td>
						</tr>
						<tr>
							<td width="31">&nbsp;</td>
							<td>&nbsp;</td>
						</tr>
						<tr>
							<td width="31" rowspan="3">&nbsp;</td>
							<td>
								<table width="700" border="0" cellspacing="0" cellpadding="0">
									<tr>
										<td width="14">&nbsp;</td>
										<td width="686" align="left">
											<img src="<%=IMG_ROOT%>/function_tt_02_001.jpg" width="70" height="26" alt="" align="top">
											<img src="<%=IMG_ROOT%>/function_mouseinfo.jpg" alt="" align="top">
										</td>
									</tr>
								</table>
							</td>
						</tr>
						<tr>
							<td height="5"></td>
						</tr>
						<tr>
							<td align="center">
								<script type="text/javascript">
									var voEmbed = new setEmbed();
									voEmbed.init("flash", "<%=SWF_ROOT%>/function_003_01.swf", "654", "617");
									voEmbed.parameter("wmode", "transparent");
									voEmbed.show();
								</script>
							</td>
						</tr>
					</table>
				</div>
				<div id="right">
					<jsp:include page="/include/quickMenu.jsp" flush="true"></jsp:include>
				</div>
			</div>
			<div id="footer">
		    	<jsp:include page="/include/footer.jsp" flush="true"></jsp:include>
			</div>
		</div>
	</div>
</body>
</html>
