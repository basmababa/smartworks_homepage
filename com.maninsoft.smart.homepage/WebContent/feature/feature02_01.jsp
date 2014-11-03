<%@ page language="java" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
<%@ page errorPage="/error/error_view.jsp" %>
<%@ include file="/common/inc/config.jsp" %>
<%@ include file="info.jsp" %>
<%
	String PAGE_INFO = "menu02_sub02_01";
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
											앱스토어 (메인화면)
										</td>
										<td width="14">&nbsp;</td>
									</tr>
								</table>
							</td>
						</tr>
						<tr>
							<td colspan="2"><img src="<%=IMG_ROOT%>/function_stitle_02_001.jpg" width="295" height="18" alt="앱스토어 (메인화면)"></td>
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
											스마트웍스 <strong>업무 앱스토어</strong>는 개발자나 공급사에 의존하지 않고 고객이 회사에서 필요한 업무를 검색, 
											조회하여 내려 받을 수 있습니다. 업종별/기능별로 인기도(다운로드), 최신, 평점, 조회순으로 조회가 가능하여 
											현재 필요한 업무를 전문적인 컨설턴트의 도움 없이도 실제 사용자가 평가한 Best Practice 업무를 
											확보하여 회사의 업무로 사용할 수 있습니다.
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
									voEmbed.init("flash", "<%=SWF_ROOT%>/function_002_01.swf", "654", "741");
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
