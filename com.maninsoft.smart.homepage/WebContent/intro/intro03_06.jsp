<%@ page language="java" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
<%@ page errorPage="/error/error_view.jsp" %>
<%@ include file="/common/inc/config.jsp" %>
<%@ include file="info.jsp" %>
<%
	String PAGE_INFO = "menu01_sub03_06";
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
											주요특징
										</td>
										<td width="14">&nbsp;</td>
									</tr>
								</table>
							</td>
						</tr>
						<tr>
							<td colspan="2"><img src="<%=IMG_ROOT%>/intro_stitle_03.jpg" width="287" height="18" alt="주요특징"></td>
						</tr>
						<tr>
							<td>&nbsp;</td>
							<td height="20">&nbsp;</td>
						</tr>
						<tr>
							<td width="31" rowspan="3">&nbsp;</td>
							<td width="739" align="left">
								<table width="700" border="0" cellspacing="0" cellpadding="0">
									<tr>
										<td width="90" rowspan="3"><img src="<%=IMG_ROOT%>/intro_003_01.jpg" width="108" height="102" alt=""></td>
										<td width="610"><img id="intro_03_01" src="<%=IMG_ROOT%>/intro_003_f01_w.jpg" width="572" height="32" alt="" onmouseover="MM_swapImage('intro_03_01','','<%=IMG_ROOT%>/intro_003_f01.jpg',1)" onmouseout="MM_swapImgRestore()" onclick="sti03_01()" style="cursor:pointer;"></td>
									</tr>
									<tr>
										<td><img id="intro_03_02" src="<%=IMG_ROOT%>/intro_003_f02_w.jpg" width="572" height="29" alt="" onmouseover="MM_swapImage('intro_03_02','','<%=IMG_ROOT%>/intro_003_f02.jpg',1)" onmouseout="MM_swapImgRestore()" onclick="sti03_02()" style="cursor:pointer;"></td>
									</tr>
									<tr>
										<td valign="top"><img id="intro_03_03" src="<%=IMG_ROOT%>/intro_003_f03_w.jpg" width="572" height="30" alt="" onmouseover="MM_swapImage('intro_03_03','','<%=IMG_ROOT%>/intro_003_f03.jpg',1)" onmouseout="MM_swapImgRestore()" onclick="sti03_03()" style="cursor:pointer;"></td>
									</tr>
									<tr>
										<td rowspan="2"><img src="<%=IMG_ROOT%>/intro_003_02.jpg" width="108" height="95" alt=""></td>
										<td width="610" height="33" valign="bottom"><img id="intro_03_04" src="<%=IMG_ROOT%>/intro_003_f04_w.jpg" width="572" height="33" alt="" onmouseover="MM_swapImage('intro_03_04','','<%=IMG_ROOT%>/intro_003_f04.jpg',1)" onmouseout="MM_swapImgRestore()" onclick="sti03_04()" style="cursor:pointer;"></td>
									</tr>
									<tr>
										<td valign="top"><img id="intro_03_05" src="<%=IMG_ROOT%>/intro_003_f05_w.jpg" width="572" height="30" alt="" onmouseover="MM_swapImage('intro_03_05','','<%=IMG_ROOT%>/intro_003_f05.jpg',1)" onmouseout="MM_swapImgRestore()" onclick="sti03_05()" style="cursor:pointer;"></td>
									</tr>
									<tr>
										<td rowspan="3"><img src="<%=IMG_ROOT%>/intro_003_03.jpg" width="108" height="95" alt=""></td>
										<td width="610"><img id="intro_03_06" src="<%=IMG_ROOT%>/intro_003_f06.jpg" width="572" height="30" alt="" onmouseover="MM_swapImage('intro_03_06','','<%=IMG_ROOT%>/intro_003_f06.jpg',1)" onmouseout="MM_swapImgRestore()" onclick="sti03_06()" style="cursor:pointer;"></td>
									</tr>
									<tr>
										<td><img id="intro_03_07" src="<%=IMG_ROOT%>/intro_003_f07_w.jpg" width="572" height="27" alt="" onmouseover="MM_swapImage('intro_03_07','','<%=IMG_ROOT%>/intro_003_f07.jpg',1)" onmouseout="MM_swapImgRestore()" onclick="sti03_07()" style="cursor:pointer;"></td>
									</tr>
									<tr>
										<td valign="top"><img id="intro_03_08" src="<%=IMG_ROOT%>/intro_003_f08_w.jpg" width="572" height="27" alt="" onmouseover="MM_swapImage('intro_03_08','','<%=IMG_ROOT%>/intro_003_f08.jpg',1)" onmouseout="MM_swapImgRestore()" onclick="sti03_08()" style="cursor:pointer;"></td>
									</tr>
								</table>
							</td>
						</tr>
						<tr>
							<td align="left">&nbsp;</td>
						</tr>
						<tr>
							<td align="left"></td>
						</tr>
					</table>
					<div id="info03_06" style="position:relative; display:block">
						<table width="703" height="61" border="0" cellpadding="0" cellspacing="0" bgcolor="#ffffff">
							<tr>
								<td colspan="3"><img src="<%=IMG_ROOT%>/intro_003_f0601.jpg" width="508" height="45" alt=""></td>
							</tr>
							<tr>
								<td height="8" colspan="3"></td>
							</tr>
							<tr>
								<td width="37" rowspan="3">&nbsp;</td>
								<td valign="top"><img src="<%=IMG_ROOT%>/bullet_01.jpg" width="11" height="10" alt=""></td>
								<td> 스마트웍스닷넷은 월 사용료 만으로 항상 최신 버전의 제품을 사용할 수 있으며 커스터마이제이션, 유지/관리비 등의 추가 부담을 절감할 수 있습니다.</td>
							</tr>
							<tr>
								<td width="14" valign="top"><img src="<%=IMG_ROOT%>/bullet_01.jpg" width="11" height="10" alt=""></td>
								<td width="663"> 스마트웍스닷넷은 전통 방식의 시스템 도입 방식인 패키지/SI 방식은 물론 ASP 방식보다도 경제적으로 이용할 수 있습니다.</td>
							</tr>
							<tr>
								<td valign="top"><img src="<%=IMG_ROOT%>/bullet_01.jpg" width="11" height="10" alt=""></td>
								<td> SaaS(스마트웍스닷넷) 방식으로 정보시스템을 이용하면 전통적인 시스템 이용방식의 최소 10%, 최대 1.3%의 수준으로 이용 가능. (정보시스템 이용에 있어 전통적인 방식과 SaaS의 TCO비교, 한국소프트웨어진흥원, 2008.12) </td>
							</tr>
							<tr>
								<td colspan="3">&nbsp;</td>
							</tr>
							<tr align="center">
								<td colspan="3"><img src="<%=IMG_ROOT%>/intro_003_f0602.jpg" width="690" height="207" alt=""></td>
							</tr>
						</table>
					</div>
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
