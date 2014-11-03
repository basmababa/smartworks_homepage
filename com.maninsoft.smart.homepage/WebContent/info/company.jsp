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
									<td>
										<img src="<%=IMG_ROOT%>/popleft_07.jpg" alt="" onclick="javascript:pop_menu05();" style="cursor:pointer">
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
				<table width="793" border="0" cellspacing="0" cellpadding="0">
					<tr>
						<td colspan="2"><img src="<%=IMG_ROOT%>/popmain_title01.jpg" width="793" height="76" alt="About Company"></td>
					</tr>
					<tr>
						<td height="5" colspan="2"></td>
					</tr>
					<tr>
						<td colspan="2"><img src="<%=IMG_ROOT%>/popmain_stitle01.jpg" width="187" height="26" alt="회사소개"></td>
					</tr>
					<tr>
						<td height="12" colspan="2">&nbsp;</td>
					</tr>
					<tr>
						<td width="34">&nbsp;</td>
						<td width="759" align="left">
							<table width="720" border="0" cellpadding="0" cellspacing="0">
								<tr>
									<td width="271" rowspan="2" valign="top" bgcolor="#ffffff">
										<img src="<%=IMG_ROOT%>/company_01.jpg" width="252" height="262" alt="">
									</td>
									<td valign="top" bgcolor="#ffffff">
										<img src="<%=IMG_ROOT%>/company_02.jpg" width="449" height="64" alt="">
										안녕하십니까?<br><br>
										 맨인소프트 대표이사 정윤식입니다.<br>
										2001년부터 BPM(Business Process Management)에 관심을 두고 관련 솔루션을 개발한
										맨인소프트는 고객의 요구를 충족시키며 시장에서 인정받는 기업으로 성장했습니다. <br><br>
										최근 빠르게 변화하고 있는 환경 속에서 많은 기업들은 기업 가치의 향상을 위해 자신들에
										맞는 기업업무 자동화와 정보화에 관심을 가지고 있으며 이를 위한 최적의 솔루션과 시스템에 
										대하여 고민하던 중 사용이 간편하고 개발자 중심이 아닌 사용자 중심에서 기업 업무 컨텐츠
										확보가 가능한 솔루션이 필요하다는 생각에서 출발하여 ‘ Web2.0 및 BPM 기반의 중소기업용
										업무처리 시스템을 <strong>SaaS</strong>로 서비스하고 상거래하는 시스템인 SmartWorks를 개발하여
										여러분에게 소개하게 되었습니다.<br><br>
										스마트웍스에 대해 많은 관심을 가져 주시기 바라며 고객만족을 실현하기 위해서
										계속 열심히 노력하겠습니다.<br><br>
										고맙습니다.<br>
									</td>
								</tr>
								<tr>
									<td align="right" valign="top" bgcolor="#ffffff"> 맨인소프트 대표이사&nbsp;<img src="<%=IMG_ROOT%>/company_03.jpg" width="111" height="29" align="bottom" alt="">&nbsp;</td>
								</tr>
								<tr align="center">
									<td colspan="2" bgcolor="#ffffff"></td>
								</tr>
								<tr align="center">
									<td height="20" colspan="2" bgcolor="#ffffff">&nbsp; </td>
								</tr>
								<tr>
									<td colspan="2" bgcolor="#ffffff" >
										<table width="700" border="0" cellspacing="0" cellpadding="0">
											<tr>
												<td width="17" rowspan="2">&nbsp;</td>
												<td width="683"><img src="<%=IMG_ROOT%>/company_04_01.jpg" width="528" height="30" alt=""></td>
											</tr>
											<tr>
												<td>
													<table width="527" border="0" cellspacing="0" cellpadding="0">
														<tr>
															<td width="80">&nbsp;</td>
															<td width="447">&nbsp;</td>
														</tr>
														<tr>
															<td><img src="<%=IMG_ROOT%>/company_04_02.jpg" width="68" height="19" alt=""></td>
															<td height="30"> (주)맨인소프트 (MANinSOFT Inc.) </td>
														</tr>
														<tr>
															<td><img src="<%=IMG_ROOT%>/company_04_03.jpg" width="68" height="19" alt=""></td>
															<td height="30"> 정 윤 식 </td>
														</tr>
														<tr>
															<td><img src="<%=IMG_ROOT%>/company_04_04.jpg" width="68" height="19" alt=""></td>
															<td height="30"> 2006년 </td>
														</tr>
														<tr>
															<td><img src="<%=IMG_ROOT%>/company_04_05.jpg" width="68" height="19" alt=""></td>
															<td height="30"> 경기도 성남시 분당구 수내동 16-2 동부루트 801호 </td>
														</tr>
														<tr>
															<td><img src="<%=IMG_ROOT%>/company_04_06.jpg" width="68" height="19" alt=""></td>
															<td height="30"> S/W 개발 및 유통, 용역 정보처리시스템 및 네트워크 개발</td>
														</tr>
														<tr>
															<td height="6" colspan="2"></td>
														</tr>
														<tr>
															<td valign="top"><img src="<%=IMG_ROOT%>/company_04_07.jpg" width="68" height="19" alt=""></td>
															<td height="35">
																스마트웍스닷넷(중소기업용 업무처리 시스템) <br>
																비즈니스프로세스관리 시스템(BPM- Business Process Management System) <br>
																기업애플리케이션통합 솔루션(EAI- Enterprise Application Integration)
															</td>
														</tr>
													</table>
												</td>
											</tr>
										</table>
									</td>
								</tr>
							</table>
						</td>
					</tr>
				</table>
			</td><!-- contents area end -->
		</tr>
		<tr>
			<td height="20"></td>
		</tr>
	</table>
</body>
</html>
