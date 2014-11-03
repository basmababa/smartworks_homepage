<%@ page language="java" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
<%@ page errorPage="/error/error_view.jsp" %>
<%@ include file="/common/inc/config.jsp" %>
<%@ include file="info.jsp" %>
<%
	String PAGE_INFO = "menu01_sub03";
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
	function changeContents(psId) {
		for (var i = 1; i <= 8; i++) {
			document.getElementById("info03_0" + i).style.display = "none";
		}
		document.getElementById("info03_0" + psId).style.display = "block";
	}
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
										<td width="610"><img src="<%=IMG_ROOT%>/intro_003_f01.jpg" width="572" height="32" alt="" onclick="changeContents('1')" style="cursor:pointer;"></td>
									</tr>
									<tr>
										<td><img src="<%=IMG_ROOT%>/intro_003_f02.jpg" width="572" height="29" alt="" onclick="changeContents('2')" style="cursor:pointer;"></td>
									</tr>
									<tr>
										<td valign="top"><img src="<%=IMG_ROOT%>/intro_003_f03.jpg" width="572" height="30" alt="" onclick="changeContents('3')" style="cursor:pointer;"></td>
									</tr>
									<tr>
										<td rowspan="2"><img src="<%=IMG_ROOT%>/intro_003_02.jpg" width="108" height="95" alt=""></td>
										<td width="610" height="33" valign="bottom"><img src="<%=IMG_ROOT%>/intro_003_f04.jpg" width="572" height="33" alt="" onclick="changeContents('4')" style="cursor:pointer;"></td>
									</tr>
									<tr>
										<td valign="top"><img src="<%=IMG_ROOT%>/intro_003_f05.jpg" width="572" height="30" alt="" onclick="changeContents('5')" style="cursor:pointer;"></td>
									</tr>
									<tr>
										<td rowspan="3"><img src="<%=IMG_ROOT%>/intro_003_03.jpg" width="108" height="95" alt=""></td>
										<td width="610"><img src="<%=IMG_ROOT%>/intro_003_f06.jpg" width="572" height="30" alt="" onclick="changeContents('6')" style="cursor:pointer;"></td>
									</tr>
									<tr>
										<td><img src="<%=IMG_ROOT%>/intro_003_f07.jpg" width="572" height="27" alt="" onclick="changeContents('7')" style="cursor:pointer;"></td>
									</tr>
									<tr>
										<td valign="top"><img src="<%=IMG_ROOT%>/intro_003_f08.jpg" width="572" height="27" alt="" onclick="changeContents('8')" style="cursor:pointer;"></td>
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
					<div id="info03_01" style="position:relative; display:block">
						<table width="703" height="61" border="0" cellpadding="0" cellspacing="0" bgcolor="#ffffff">
							<tr>
								<td colspan="3"><img src="<%=IMG_ROOT%>/intro_003_f0101.jpg" width="476" height="45" alt=""></td>
							</tr>
							<tr>
								<td height="8" colspan="3"></td>
						    </tr>
							<tr>
								<td width="23" rowspan="3">&nbsp;</td>
								<td valign="top"><img src="<%=IMG_ROOT%>/bullet_01.jpg" width="11" height="10" alt=""></td>
								<td>스마트웍스닷넷은 프로세스맵의 기능을 제공하여 업무처리 및 진행현황과 업무의 역할과 책임을 쉽게 파악할 수 있습니다.</td>
							</tr>
							<tr>
								<td height="5" colspan="2" valign="top"></td>
							</tr>
							<tr>
								<td width="14" valign="top"><img src="<%=IMG_ROOT%>/bullet_01.jpg" width="11" height="10" alt=""></td>
								<td width="663"> 업무 처리시 작성된 데이터를 활용한 각종 보고서의 자동 생성으로 대시보드를 제공하여 경영자는 쉽게 업무 현황을 파악할 수 있습니다.</td>
							</tr>
							<tr>
								<td colspan="3"><img src="<%=IMG_ROOT%>/intro_003_f0102.jpg" width="690" height="721" alt=""></td>
							</tr>
						</table>
					</div>
					<div id="info03_02" style="position:relative; display:none">
						<table width="703" height="61" border="0" cellpadding="0" cellspacing="0" bgcolor="#ffffff">
							<tr>
								<td colspan="3"><img src="<%=IMG_ROOT%>/intro_003_f0201.jpg" width="446" height="45" alt=""></td>
							</tr>
							<tr>
								<td height="8" colspan="3"></td>
							</tr>
							<tr>
								<td width="37" rowspan="3">&nbsp;</td>
								<td><img src="<%=IMG_ROOT%>/bullet_01.jpg" width="11" height="10" alt=""></td>
								<td> 전사적 업무의 지식을 공유함으로서 직원들 개개인의 업무 이해도 향상</td>
							</tr>
							<tr>
								<td valign="top"><img src="<%=IMG_ROOT%>/bullet_01.jpg" width="11" height="10" alt=""></td>
								<td width="650"> 업무들을 매뉴얼하고 정해진 절차에 의해 처리되도록 업무 처리 절차를 자동화하여 업무 처리 오류를 사전에 방지</td>
							</tr>
							<tr>
								<td width="14" valign="top"><img src="<%=IMG_ROOT%>/bullet_01.jpg" width="11" height="10" alt=""></td>
								<td> 처리된 업무들은 모두 기록되고 저장되어 기업의 자산으로 활용하는 지식경영 (Knowledge Management)이 됩니다.</td>
							</tr>
							<tr>
								<td colspan="3">&nbsp;</td>
							</tr>
							<tr align="center">
								<td colspan="3"><img src="<%=IMG_ROOT%>/intro_003_f0202.jpg" width="564" height="281" alt=""></td>
							</tr>
						</table>
					</div>
					<div id="info03_03" style="position:relative; display:none">
						<table width="703" height="61" border="0" cellpadding="0" cellspacing="0" bgcolor="#ffffff">
							<tr>
								<td colspan="3"><img src="<%=IMG_ROOT%>/intro_003_f0301.jpg" width="516" height="45" alt=""></td>
							</tr>
							<tr>
								<td height="8" colspan="3"></td>
							</tr>
							<tr>
								<td width="37" rowspan="2">&nbsp;</td>
								<td valign="top"><img src="<%=IMG_ROOT%>/bullet_01.jpg" width="11" height="10" alt=""></td>
								<td> 시스템 내 모든 업무와 자료들을 편하게 전달, 또는 공개할 수 있으며</td>
							</tr>
							<tr>
								<td width="14" valign="top"><img src="<%=IMG_ROOT%>/bullet_01.jpg" width="11" height="10" alt=""></td>
								<td width="663"> 의견달기, 댓글을 통한 공유, 공동 참여 기반의 업무처리가 가능합니다.</td>
							</tr>
							<tr>
								<td colspan="3">&nbsp;</td>
							</tr>
							<tr align="center">
								<td colspan="3"><img src="<%=IMG_ROOT%>/intro_003_f0302.jpg" width="648" height="457" alt=""></td>
							</tr>
						</table>
					</div>
					<div id="info03_04" style="position:relative; display:none">
						<table width="703" height="61" border="0" cellpadding="0" cellspacing="0" bgcolor="#ffffff">
							<tr>
								<td colspan="3"><img src="<%=IMG_ROOT%>/intro_003_f0401.jpg" width="687" height="45" alt=""></td>
							</tr>
							<tr>
								<td height="8" colspan="3"></td>
							</tr>
							<tr>
								<td width="37" rowspan="2">&nbsp;</td>
								<td valign="top"><img src="<%=IMG_ROOT%>/bullet_01.jpg" width="11" height="10" alt=""></td>
								<td> 업무 앱스토어를 통하여 인터넷이 가능한 어느곳에서도 필요업무를 검색, 다운 및 시스템 배치.적용이 가능합니다.</td>
							</tr>
							<tr>
								<td width="14" valign="top"><img src="<%=IMG_ROOT%>/bullet_01.jpg" width="11" height="10" alt=""></td>
								<td width="663"> 업무 앱스토어를 통하면 Best Practice 업무 확보가 가능하여 업무 개선 등을 위한 고가의 컨설팅 등의 고민을 해결할 수 있습니다.</td>
							</tr>
							<tr>
								<td colspan="3">&nbsp;</td>
							</tr>
							<tr align="center">
								<td colspan="3"><img src="<%=IMG_ROOT%>/intro_003_f0402.jpg" width="650" height="347" alt=""></td>
							</tr>
						</table>
					</div>
					<div id="info03_05" style="position:relative; display:none">
						<table width="703" height="61" border="0" cellpadding="0" cellspacing="0" bgcolor="#ffffff">
							<tr>
								<td colspan="3"><img src="<%=IMG_ROOT%>/intro_003_f0501.jpg" width="713" height="45" alt=""></td>
							</tr>
							<tr>
								<td height="8" colspan="3"></td>
							</tr>
							<tr>
								<td width="37" rowspan="2">&nbsp;</td>
								<td valign="top"><img src="<%=IMG_ROOT%>/bullet_01.jpg" width="11" height="10" alt=""></td>
								<td> 파워포인트, 워드를 사용하 듯 편하게 코딩없이 업무를 직접 만들어 쓸 수 있습니다.</td>
							</tr>
							<tr>
								<td width="14" valign="top"><img src="<%=IMG_ROOT%>/bullet_01.jpg" width="11" height="10" alt=""></td>
								<td width="663"> 업무 앱스토어를 통해 다운 받은 업무들도 쉽게 수정 및 편집하여 회사에 맞게 수정이 가능합니다.</td>
							</tr>
							<tr>
								<td colspan="3">&nbsp;</td>
							</tr>
							<tr align="center">
								<td colspan="3"><img src="<%=IMG_ROOT%>/intro_003_f0502.jpg" width="738" height="404" alt=""></td>
							</tr>
						</table>
					</div>
					<div id="info03_06" style="position:relative; display:none">
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
								<td> 스마트웍스닷넷은 월 사용료 만으로 항상 최신 버전의 제품을 사용할 수 있으며 커스토마이제이션, 유지/관리비 등의 추가 부담을 절감할 수 있습니다.</td>
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
					<div id="info03_07" style="position:relative; display:none">
						<table width="703" height="61" border="0" cellpadding="0" cellspacing="0" bgcolor="#ffffff">
							<tr>
								<td colspan="3"><img src="<%=IMG_ROOT%>/intro_003_f0701.jpg" width="663" height="45" alt=""></td>
							</tr>
							<tr>
								<td height="8" colspan="3"></td>
							</tr>
							<tr>
								<td width="37" rowspan="2">&nbsp;</td>
								<td valign="top"><img src="<%=IMG_ROOT%>/bullet_01.jpg" width="11" height="10" alt=""></td>
								<td> 스마트웍스닷넷을 통하여 다양한 업무시스템의 생성 및 활용이 가능하여 중복 투자 불필요</td>
							</tr>
							<tr>
								<td width="14" valign="top"><img src="<%=IMG_ROOT%>/bullet_01.jpg" width="11" height="10" alt=""></td>
								<td width="663"> 생성된 업무들의 데이터를 통합하여 활용이 가능한 SOA의 사상 실현</td>
							</tr>
							<tr>
								<td colspan="3">&nbsp;</td>
							</tr>
							<tr align="center">
								<td colspan="3"><img src="<%=IMG_ROOT%>/intro_003_f0702.jpg" width="738" height="444" alt=""></td>
							</tr>
						</table>
					</div>
					<div id="info03_08" style="position:relative; display:none">
						<table width="703" height="61" border="0" cellpadding="0" cellspacing="0" bgcolor="#ffffff">
							<tr>
								<td colspan="3"><img src="<%=IMG_ROOT%>/intro_003_f0801.jpg" width="447" height="45" alt=""></td>
							</tr>
							<tr>
								<td height="8" colspan="3"></td>
							</tr>
							<tr>
								<td width="38" rowspan="2">&nbsp;</td>
								<td valign="top"><img src="<%=IMG_ROOT%>/bullet_01.jpg" width="11" height="10" alt=""></td>
								<td> 업무앱스토어에서 다운 받은 업무들과 빌더를 통해 생성된 업무들은 스마스웍스 업무관리소에서 바로 실행 및 배치하여 사용할 수 있습니다.</td>
							</tr>
							<tr>
								<td width="14" valign="top"><img src="<%=IMG_ROOT%>/bullet_01.jpg" width="11" height="10" alt=""></td>
								<td width="677"> 도입 즉시 실제 업무로 사용하여 업무 개선의 효과를 바로 확인할 수 있습니다.</td>
							</tr>
							<tr>
								<td colspan="3">&nbsp;</td>
							</tr>
							<tr align="center">
								<td colspan="3"><img src="<%=IMG_ROOT%>/intro_003_f0802.jpg" width="729" height="422" alt=""></td>
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
