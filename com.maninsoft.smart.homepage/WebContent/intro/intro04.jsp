<%@ page language="java" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
<%@ page errorPage="/error/error_view.jsp" %>
<%@ include file="/common/inc/config.jsp" %>
<%@ include file="info.jsp" %>
<%
	String PAGE_INFO = "menu01_sub04";
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
<script language="javascript" type="text/javascript" src="<%=ROOT_DIR%>/common/js/floater/floater.js"></script>
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
							<td colspan="2"><img src="<%=IMG_ROOT%>/intro_title.jpg" width="769" height="86" alt="스마트웍스 소개"></td>
						</tr>
						<tr>
							<td colspan="2" align="right">
								<table width="500" border="0" cellspacing="0" cellpadding="0">
									<tr>
										<td width="486" align="right">
											<a href="javascript:go_home();"><strong>HOME</strong></a> &gt;
											<a href="javascript:menu01_sub01();">스마트웍스닷넷 소개</a> &gt;
											타시스템과 차이점
										</td>
										<td width="14">&nbsp;</td>
									</tr>
								</table>
							</td>
						</tr>
						<tr>
							<td colspan="2"><img src="<%=IMG_ROOT%>/intro_stitle_04.jpg" width="287" height="18" alt="타시스템과 차이점"></td>
						</tr>
						<tr>
							<td rowspan="3">&nbsp;</td>
							<td height="20">&nbsp;</td>
						</tr>
						<tr>
							<td height="5">
								<table width="710" border="0" cellspacing="0" cellpadding="0">
									<tr>
										<td width="14" valign="top"><img src="<%=IMG_ROOT%>/bullet_01.jpg" width="11" height="10" alt=""></td>
										<td> 최근 정부의 중소기업 경쟁력 확보 일환으로 ERP(기업자산관리)와 CRM(영업관리 등), 그룹웨어가 중소기업 정보화의 주요 어플리케이션으로 널리 확산되어 있습니다.&#13;</td>
									</tr>
									<tr>
										<td height="5" colspan="2" valign="top"></td>
									</tr>
									<tr>
										<td valign="top"><img src="<%=IMG_ROOT%>/bullet_01.jpg" width="11" height="10" alt=""></td>
										<td width="686"> 도입된 ERP, CRM, 그룹웨어의 대부분이 공급사에서 제공된 기능만 사용할 수 있으며 생성된 데이터의 활용도 제한적이나,</td>
									</tr>
									<tr>
										<td height="5" colspan="2" valign="top"></td>
									</tr>
									<tr>
										<td valign="top"><img src="<%=IMG_ROOT%>/bullet_01.jpg" width="11" height="10" alt=""></td>
										<td> <strong>스마트웍스닷넷 </strong>은 사용자가 필요한 업무를 사용자가 직접 제작하여 자유롭게 추가할 수 있으며, 생성된 데이터를 이용한 보고서 생성 등의 활용이 가능하여 분석 기능을 가지고 있으며, </td>
									</tr>
									<tr>
										<td height="5" colspan="2" valign="top"></td>
									</tr>
									<tr>
										<td valign="top"><img src="<%=IMG_ROOT%>/bullet_01.jpg" width="11" height="10" alt=""></td>
										<td> 타 어플리케이션들이 Static한 Data정보만을 제공하는데 비해 Dynamic한 프로세스도 제공하여 2차원적인 경영이 아닌 3차원적인 경영 정보를 제공합니다. </td>
									</tr>
								</table>
							</td>
						</tr>
						<tr>
							<td height="5">&nbsp;</td>
						</tr>
						<tr>
							<td width="31" rowspan="3">&nbsp;</td>
							<td width="739" align="left"><img src="<%=IMG_ROOT%>/intro_004_01.jpg" width="733" height="664" alt=""></td>
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
