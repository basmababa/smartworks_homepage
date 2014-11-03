<%@ page language="java" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
<%@ page errorPage="/error/error_view.jsp" %>
<%@ include file="/common/inc/config.jsp" %>
<%@ include file="info.jsp" %>
<%
	String PAGE_INFO = "menu03_sub02";
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
	function goInstall() {

		if (document.installForm.agreement[1].checked) {
			alert("이용약관에 동의하셔야 설치신청이 가능합니다.");
			document.installForm.agreement[0].focus();
			return;
		}

		if (document.installForm.privacy[1].checked) {
			alert("개인정보취급방침에 동의하셔야 설치신청이 가능합니다.");
			document.installForm.privacy[0].focus();
			return;
		}
		
		if(checkForm(document.installForm.company, "회사명")) return;
		if(checkForm(document.installForm.name, "담당자")) return;
		if(checkForm(document.installForm.email, "이메일")) return;
		if(!isEMail(document.installForm.email)) return;
		if(checkForm(document.installForm.hp, "연락처")) return;
		if(checkForm(document.installForm.staff_number, "직원수")) return;
		if(isNumber(document.installForm.staff_number, "직원수")) return;
		if(checkForm(document.installForm.user_number, "사용자수")) return;
		if(isNumber(document.installForm.user_number, "사용자수")) return;
		if(checkForm(document.installForm.item, "업종")) return;
		if(checkForm(document.installForm.business, "업태")) return;

		document.installForm.submit();
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
					<form name="installForm" method="post" action="purchase02_ok.jsp">
						<table width="770" border="0" cellspacing="0" cellpadding="0">
							<tr>
								<td colspan="2"><img src="<%=IMG_ROOT%>/purchase_title2.jpg" width="769" height="86" alt="구입안내"></td>
							</tr>
							<tr>
								<td colspan="2" align="right">
									<table width="500" border="0" cellspacing="0" cellpadding="0">
										<tr>
											<td width="486" align="right">
												<a href="javascript:go_home();"><strong>HOME</strong></a> &gt;
												<a href="javascript:menu03_sub01();">구입안내</a> &gt;
												설치가이드&설치하기
											</td>
											<td width="14">&nbsp;</td>
										</tr>
									</table>
								</td>
							</tr>
							<tr>
								<td colspan="2"><img src="<%=IMG_ROOT%>/purchase_stitle_02.jpg" width="287" height="18" alt="설치가이드&설치하기"></td>
							</tr>
							<tr>
								<td height="6" colspan="2">&nbsp;</td>
							</tr>
							<tr>
								<td width="31">&nbsp;</td>
								<td width="739" height="85" valign="top"><img src="<%=IMG_ROOT %>/purchase_tt_02_000.jpg" width="706" height="67"></td>
							</tr>
							<tr>
								<td width="31" rowspan="15">&nbsp;</td>
								<td width="739"><img src="<%=IMG_ROOT%>/purchase_tt_02_001.jpg" width="88" height="26" alt=""></td>
							</tr>
							<tr>
								<td height="5"></td>
							</tr>
							<tr>
								<td>
									<table width="700" border="0" cellspacing="0" cellpadding="0">
										<tr>
											<td width="332">
												<table width="332" border="0" cellspacing="0" cellpadding="0">
													<tr>
														<td><img src="<%=IMG_ROOT%>/purchase_02_01.jpg" width="332" height="43" alt=""></td>
													</tr>
													<tr>
														<td height="60" align="center" valign="top" background="<%=IMG_ROOT%>/purchase_02_02.jpg">
															<table width="290" border="0" cellspacing="0" cellpadding="0">
																<tr>
																	<td align="left"><img src="<%=IMG_ROOT%>/bullet_g.jpg" width="8" height="8" alt=""> 펜티엄4 이상</td>
																</tr>
																<tr>
																	<td align="left"><img src="<%=IMG_ROOT%>/bullet_g.jpg" width="8" height="8" alt=""> 메모리 1G 이상</td>
																</tr>
																<tr>
																	<td align="left">
																		<img src="<%=IMG_ROOT%>/bullet_g.jpg" width="8" height="8" alt=""> OS : window xp이상<br> 
																		&nbsp;&nbsp;&nbsp;(리눅스, 유닉스 등 환경은 추후 제공)
																	</td>
																</tr>
															</table>
														</td>
													</tr>
													<tr>
														<td><img src="<%=IMG_ROOT%>/purchase_02_03.jpg" width="332" height="23" alt=""></td>
													</tr>
												</table>
											</td>
											<td width="15">&nbsp;</td>
											<td width="353">
												<table width="332" border="0" cellspacing="0" cellpadding="0">
													<tr>
														<td><img src="<%=IMG_ROOT%>/purchase_02_04.jpg" width="332" height="43" alt=""></td>
													</tr>
													<tr>
														<td height="60" align="center" valign="top" background="<%=IMG_ROOT%>/purchase_02_02.jpg">
															<table width="290" border="0" cellspacing="0" cellpadding="0">
																<tr>
																	<td align="left"><img src="<%=IMG_ROOT%>/bullet_g.jpg" width="8" height="8" alt=""> 펜티엄4 이상&#13;</td>
																</tr>
																<tr>
																	<td align="left"><img src="<%=IMG_ROOT%>/bullet_g.jpg" width="8" height="8" alt=""> 메모리 1G 이상</td>
																</tr>
																<tr>
																	<td align="left">&nbsp;</td>
																</tr>
															</table>
														</td>
													</tr>
													<tr>
														<td><img src="<%=IMG_ROOT%>/purchase_02_03.jpg" width="332" height="23" alt=""></td>
													</tr>
												</table>
											</td>
										</tr>
									</table>
								</td>
							</tr>
							<tr>
								<td>&nbsp;</td>
							</tr>
							<tr>
								<td align="left"><img src="<%=IMG_ROOT%>/purchase_tt_02_002.jpg" width="87" height="26" alt=""></td>
							</tr>
							<tr>
								<td align="center"><img src="<%=IMG_ROOT%>/purchase_02_07.jpg" width="690" height="101" alt=""></td>
							</tr>
							<tr>
								<td align="center">&nbsp;</td>
							</tr>
							<tr>
								<td><img src="<%=IMG_ROOT%>/purchase_02_08.jpg" width="709" height="81" alt=""></td>
							</tr>
							<tr>
								<td background="<%=IMG_ROOT%>/purchase_02_13.jpg"></td>
							</tr>
							<tr>
								<td background="<%=IMG_ROOT%>/purchase_02_13.jpg">
									<table width="708" border="0" cellspacing="0" cellpadding="0">
										<tr>
											<td align="center">
												<table width="700" border="0" cellspacing="0" cellpadding="0">
													<tr>
														<td width="349">
															<table width="332" border="0" cellspacing="0" cellpadding="0">
																<tr>
																	<td background="<%=IMG_ROOT%>/purchase_02_11.jpg"><img src="<%=IMG_ROOT%>/purchase_02_09.jpg" width="349" height="43" alt=""></td>
																</tr>
																<tr>
																	<td height="60" align="center" valign="top" background="<%=IMG_ROOT%>/purchase_02_11.jpg">
																		<table width="325" border="0" cellspacing="0" cellpadding="0">
																			<tr>
																				<td align="left"> 
																					<div id="agreement_area" style="height:230px;overflow-y:auto;">
																						<strong>스마트웍스닷넷 소프트웨어 이용약관</strong><br><br>
					
																						이 약관은 ㈜맨인소프트가 제공하는 스마트웍스닷넷 소프트웨어(이하 &quot;서비스&quot;라 한다)를 이용함에 있어 이용자의 권리, 의무 및 책임사항을 
																						규정함을 목적으로 합니다. <br><br>
																						
																						<strong>용어의 정의</strong> <br>
																						&quot;스마트웍스닷넷 소프트웨어&quot;란 ㈜맨인소프트에서 제공하는 업무처리 소프트웨어를 말합니다. <br>
																						&quot;이용자&quot;란 스마트웍스닷넷 소프트웨어를 사용하는 개인기업 또는 법인기업을 말합니다. <br><br>
																						
																						<strong>이용약관의 변경</strong><br>&quot;㈜맨인소프트&quot;는 약관의 규제 등에 관한 법률, 전자거래기본법, 전자서명법, 정보통신망이용 촉진 및 정보보호 등에 관한 법률,
																						소비자보호법 등 관련법을 위배하지 않는 범위에서 이 약관을 개정할 수 있으며, 이용자는 본 서비스를 계속 사용함으로써 이용약관의 변경사항에
																						동의하는 것으로 합니다. 본 서비스를 업데이트 하거나 개선하는 경우, 달리 명시되지 않는 한 본 이용약관의 적용을 받습니다. <br><br>
																						
																						<strong>저작권</strong><br>
																						본 패키지에 포함된 소프트웨어와 모든 부속물에 대한 저작권, 지적소유권, 판매 및 배포권은 모두 ㈜맨인소프트가 보유하고 있으며, 대한민국 
																						저작권법, 프로그램 등록법과 국제 저작권 협약에 의해 보호 받고 있습니다. 사용자에게 허락 되어지는 것은 계약된 소프트웨어에 한정한 
																						사용권만을  가집니다. <br><br>
																						
																						<strong>서비스 사용 제한 및 기타 권리 제한 </strong><br>      
																						본 제품의 사용권은 이용자가 지정한 서버에 설치하고 스마트웍스닷넷 이용신청서에 기재된 이용자수의 인원수까지 사용할 수 있습니다.
																						저작권자의 사전 서면 승인 없이는 소프트웨어와 부속 인쇄물에 대해서 수정, 변형, 복사, 대여, 임대, 재판매, 배포, 이전을 할 수 없습니다. <br><br>
																						
																						<strong>이용/접속제한/계약종료</strong> <br>
																						이용자는 이용신청서 작성 후 제출한 시점부터 본 서비스를 이용할 수 있습니다. 
																						서비스의 월정 사용료가 연체되었을 경우 2개월이 경과된 시점부터 본 서비스를 직권해지하며, 직권해지 후 데이터의 망실에 대해 책임을 지지 않습니다. 
																						이용자가 서면으로 본 서비스를 사용하지 않겠다고 한 시점부터 계약이 종료됩니다. 
																						계약이 종료되었을 경우 서비스를 사용하기 위해 설치했던 프로그램 및 CD는 삭제 또는 파기하여야 합니다. <br><br>
																						
																						<strong>설치비 및 사용료</strong><br>
																						본 서비스에 대한 설치비 및 사용료에 대한 내용은 당사의 가격기준정책에 따릅니다. <br><br>
																						<strong>보증제한</strong><br>
																						본 제품의 개발자 및 공급자는 정상적인 사용환경에서 사용하는 통상적인 사용자들이 무리 없이 사용할 수 있도록 본 제품을 개발하고 테스트
																						하였으나, 이용자 개개인의 특수한 사용환경, 이용자의 사용 경험과 능력, 현재 또는 미래의 모든 사용환경 등에서 항상 완벽하게 작동한다는 
																						보증을 해드리지 못함을 양해해주시기 바랍니다. 하지만 이용자가 사용상 문제점을 발견 보고하게 될 경우, 당사는 그 문제 해결에 최선을 다해
																						사용자의 불편을 신속히 해결하도록 노력할 것을 약속합니다. <br><br>
																						
																						<strong> 배상의 한도</strong><br>
																						이용자가 본 제품을 사용함에 있어 어떤 경우에도 모든 파행적, 부수적, 직접, 간접, 특별, 징벌적 또는 기타 모든 손해에 대하여 책임을 지지 않으며,
																						이는 그와 같은 손해의 가능성을 사전에 알고 있던 경우에도 해당 됩니다. 만약, 이 제품의 사용으로 인해 사용자에게 직접적으로 발생한 
																						손실(물적 금적 손실, 업무중단, 정보유실, 정신적 피해 등의 손상을 포함)이 있을 경우, 판매권자의 손해배상 책임은 손실의 원인, 종류, 내용에 
																						상관없이  이 제품의 구입비용을 초과하지 않습니다. <br><br>
																						
																						<strong>기타조항</strong> <br>
																						본 이용약관에 따른 의무 또는 권리의 이행, 불이행 또는 위반에 대한 청구는 대한민국 법의 적용을 받습니다. 또한 소비자 보호에 관한 법률, 
																						불공정  거래법의 위반, 불법행위로 인한 청구를 포함한 기타 청구 등도 대한민국법의 적용을 받습니다.
																						본 서비스의 사용으로 인하거나 또는 이와 관련하여 분쟁이 발생하는 경우 그 ㈜맨인소프트 본점 소재지 관할법원의 민사소송법에 따르도록 합니다.
																						본 서비스로 인하여 또는 이와 관련하여 발생하는 소송은 소의 원인이 발생한 지 1년 이내에 개시되어야 합니다. <br><br>
																						
																						[부칙] 2009. 7. 1<br><br>
																						
																						본 약관은 2009년 7월 1일부터 적용됩니다. <br>
																					</div>
																				</td>
																			</tr>
																		</table>
																	</td>
																</tr>
																<tr>
																	<td><img src="<%=IMG_ROOT%>/purchase_02_12.jpg" width="349" height="17" alt=""></td>
																</tr>
															</table>
														</td>
														<td width="5" rowspan="4">&nbsp;</td>
														<td width="349">
															<table width="332" border="0" cellspacing="0" cellpadding="0">
																<tr>
																	<td background="<%=IMG_ROOT%>/purchase_02_11.jpg"><img src="<%=IMG_ROOT%>/purchase_02_10.jpg" width="349" height="43" alt=""></td>
																</tr>
																<tr>
																	<td height="60" align="center" valign="top" background="<%=IMG_ROOT%>/purchase_02_11.jpg">
																		<table width="325" border="0" cellspacing="0" cellpadding="0">
																			<tr>
																				<td align="left">
																					<div id="privacy_area" style="height:230px;overflow-y:auto;">
																						㈜맨인소프트(이하 ‘회사’라 함)는 고객님의 정보를 중요하게 생각하며 아래와 같은 개인정보취급방침을 가지고 있습니다.<br>
																						회사는 “정보통신망 이용촉진 및 정보보호 등에 관한 법률”을 준수하며 고객님의 정보가 어떤 용도와 방식으로 사용되고 있으며 개인정보보호를 위해 어떤 조치를 취하고 있는지 알려드립니다.<br><br>
																						
																						<strong>수집하는 개인정보의 항목 및 수집방법</strong><br>
																						회사는 회원 가입, 서비스제공, 기타상담 등을 위해 개인정보를 수집하고 있으며, 또한 설문조사나 이벤트 시에 집단적인 통계분석을 위해서나 경품발송을 위한 목적으로도 개인정보 기재를 요청할 수 있습니다. 
																						그러나, 회사는 이용자의 기본적 인권 침해의 우려가 있는 민감한 개인정보(인종 및 민족, 사상 및 신조, 출신지 및 본적지, 정치적 성향 및 범죄기록 등)는 가급적 수집하지 않으며 부득이하게 수집해야 할 경우 
																						이용자들의 사전동의를 반드시 구합니다. 이때에도 기입하신 정보는 해당서비스 제공이나 회원님께 사전에 밝힌 목적 이외의 다른 어떠한 목적으로도 사용되지 않음을 알려드립니다.<br><br>
																						
																						개인정보의 수집 내용은 아래와 같습니다.<br><br>
																						
																						<strong>필수항목</strong> <br>
																						- 개인회원 : 이름(영문포함), 주민등록번호, 로그인ID, 로그인Password, e-mail주소, 전화번호, 주소 <br>
																						- 개인/법인사업자 : 회사/기관명(영문포함), 사업자등록번호, 로그인ID, 로그인Password, 대표자명, e-mail주소, 전화번호, 업태, 종목,<br>
																						&nbsp;&nbsp;&nbsp;기업형태, 사원수, 주소 <br>
																						- 개인회원 14세 미만 : 부모님(법정대리인)의 이름, 주민등록번호, 전화번호 <br>
																						- 해외거주자 : 이름(영문포함), 로그인ID, 로그인Password, e-mail주소, 전화번호, 주소, 본인확인서류 <br>
																						- 선택항목 신용카드정보, 은행계좌정보, 이동전화정보 등 대금결제에 필요한 정보 <br>
																						- 개인정보 수집방법 홈페이지 및 이용신청서 <br><br>
																						
																						<strong>개인정보의 수집 및 이용목적</strong><br>
																						회사는 아래와 같은 목적으로 개인정보를 수집합니다. <br>
																						서비스 제공에 관한 계약이행 및 서비스제공에 따른 요금정산 컨텐츠 제공, 물품배송, 청구서 발송, 본인인증, 구매 및 요금결제, 금융서비스 
																						회원관리 회원제 서비스 이용에 따른 본인 확인, 개인식별, 불량회원의 부정 이용 방지와 비인가 사용방지, 가입 의사 확인은 연령 확인, 만 14세 미만 아동의 개인정보 수집 시 법정 대리인 동의여부 확인, 
																						불만처리 등 민원처리, 고지사항 전달, 서비스 안내등 마케팅 및 광고 신규 서비스 개발 및 특화, 인구통계학적 특성에 따른 서비스 제공 및 광고게재, 접속 빈도 파악, 회원의 서비스 이용에 대한 통계, 
																						이벤트 등 광고성 정보 전달 <br><br>
																						
																						<strong>개인정보 수집에 대한 동의</strong><br>
																						 회사는 회원님의 개인정보 수집에 대하여 동의를 받고 있으며, 회사 내의 회원가입 절차 중 이용약관 및 개인정보취급방침에 개인정보 수집 동의절차를 마련해 두고 있습니다. 
																						 회원님께서['약관 및 정책'에 동의합니다.]란에 체크하시면 개인정보 수집에 대해 동의한 것으로 봅니다. <br><br>
																						 
																						<strong>개인정보의 보유 및 이용 기간</strong><br>
																						 서비스 이용자가 당사의 회원으로서 서비스를 계속 이용하는 동안 당사는 이용자의 개인정보를 계속 보유하며 서비스 제공 등을 위해 이용합니다. 
																						 서비스 이용자의 개인정보는 그 수집 및 이용 목적(설문조사, 이벤트 등 일시적인 목적을 포함)이 달성되거나 이용자가 직접 삭제 또는 회원 탈퇴한 경우에 재생할 수 없는 방법으로 파기됩니다. 
																						 당사는 이용자의 권리 남용, 악용 방지, 권리침해/명예훼손 분쟁 및 수사협조 등의 요청이 있었을 경우에는 이의 재발에 대비하여 회원의 이용계약 해지 시로부터 1년 동안 회원의 개인정보를 보관할 수 있습니다. 
																						 상법, 전자상거래 등에서의 소비자보호에 관한 법률 등 관계법령의 규정에 의하여 보존할 필요가 있는 경우 당사는 관계법령에서 정한 일정한 기간 동안 회원정보를 보관합니다. 
																						 이 경우 당사는 보관하는 정보를 그 보관의 목적으로만 이용하며 보존기간은 아래와 같습니다. <br><br>
																						
																						- 계약 또는 청약철회 등에 관한 기록: 5년 <br>
																						- 대금결제 및 재화 등의 공급에 관한 기록: 5년 <br>
																						- 소비자의 불만 또는 분쟁처리에 관한 기록: 3년 <br><br>
																						
																						<strong>개인정보의 파기절차 및 방법</strong><br>
																						회원님은 언제든지 등록되어 있는 회원님의 개인정보를 열람하거나 정정하실 수 있으며, 회원 탈퇴를 요청 하실 수 있습니다. 
																						회원님의 개인정보 열람 및 수정은 사이트 내의 회원정보변경을 통해 로그인(Log-in) 후 가능하며, 아이디, 주민번호, 이름을 제외한 사항은 수정 가능합니다. 
																						회원 탈퇴를 원하실 경우 사이트 내에서 탈퇴가 가능하며, 등록된 모든 정보를 파기함으로 탈퇴 여부를 신중히 고려 하셔야 합니다. 또한 탈퇴 후 재가입에 제약이 따를 수 도 있습니다. <br><br>
																						
																						<strong>이용자 및 법정대리인의 권리와 그 행사방법</strong><br>
																						 이용자 및 법정대리인은 언제든지 등록되어 있는 자신 혹은 당해 만 14세 미만 아동의 개인정보를 조회하거나 수정할 수 있으며 가입해지를 요청할 수 도 있습니다. 
																						 이용자 혹은 만 14세 미만 아동의 개인정보 조회, 수정을 위해서는 ‘회원정보수정’(또는 ‘회원정보변경’ 등)을 가입해지를 위해서는 ‘회원탈퇴’ 를 클릭하여 본인 확인 절차를 거치신 후 직접 열람, 
																						 정정 또는 탈퇴가 가능합니다. 혹은 개인정보관리책임자에게 서면, 전화 또는 이메일로 연락하시면 지체 없이 조치하겠습니다. 
																						 이용자가 개인정보의 오류에 대한 정정을 요청하신 경우에는 정정을 완료하기 전까지 당해 개인정보를 이용 또는 제공하지 않습니다. 
																						 또한 잘못된 개인정보를 제3자에게 이미 제공한 경우에는 정정 처리 결과를 제 3자에게 지체 없이 통지하여 정정이 이루어지도록 하겠습니다. 
																						 회사는 이용자 혹은 법정 대리인의 요청에 의해 해지 또는 삭제된 개인정보는 “개인정보의 보유 및 이용기간” 에 명시된 바에 따라 처리하고 그 외의 용도로 열람 또는 이용할 수 없도록 처리하고 있습니다. <br><br>
																						 
																						<strong>개인정보 자동수집 장치의 설치, 운영 및 그 거부에 관한 사항</strong><br>
																						쿠키(cookie)는 HTTP 서버에서 사용자 브라우저에게 보내는 조그마한 데이터 파일로써 회원님의 컴퓨터에 저장됩니다. 
																						회사는 이러한 쿠키(cookie)를 이용하여 회원님의 브라우저 형식이나 서비스 이용 형태를 얻게 되며, 이러한 쿠키 정보를 바탕으로 회원님께 유용하고 보다 편리한 맞춤서비스를 제공하는데 사용하게 됩니다. 
																						회원님은 쿠키에 대한 선택권을 가지고 있습니다. 회원님의 웹브라우저에서 옵션을 선택함으로써 모든 쿠키를 허용하거나, 쿠키가 저장될 때마다 확인을 거치거나, 모든 쿠키의 저장을 거부할 수 있습니다. 
																						단, 쿠키의 저장을 거부하실 경우 로그인 (Log-in) 이 필요한 회사의 모든 서비스는 이용하실 수 없게 됩니다. <br><br>
																						
																						<strong>개인정보보호를 위한 기술적, 관리적 대책</strong><br>
																						회원님의 개인정보는 비밀번호에 의해 보호되고 있습니다. 회원님 계정의 비밀번호는 오직 본인만이 알 수 있으며, 개인정보의 확인 및 변경도 비밀번호를 알고 있는 본인에 의해서만 가능합니다. 
																						따라서 회원님의 비밀번호는 누구에게도 알려주면 안됩니다. 또한 작업을 마치신 후에는 로그아웃(log-out)하시고 웹브라우저를 종료하는 것이 바람직합니다. 
																						특히 다른 사람과 컴퓨터를 공유하여 사용하거나 공공장소에서 이용한 경우 개인정보가 다른 사람에게 알려지는 것을 막기 위해서 이와 같은 절차가 더욱 필요합니다. 
																						이용자 부주의나 인터넷상의 문제로 인한 개인정보 유출에 대해서 회사는 책임을 지지 않습니다. 
																						회사는 개인정보 취급 직원을 최소화하고 담당 직원의 수시교육을 통해 개인정보 보호 정책의 준수를 강조하고 있습니다. 
																						회사는 개인정보보호를 위한 기술적 관리적 대책을 다음과 같이 시행하고 있습니다. 
																						해킹 방지를 위한 방화벽과 보안 시스템에 만전을 기하고 있습니다. 
																						개인정보 송수신시 SSL 보안서버 인증서를 설치하여 정보를 보호합니다. 
																						개인정보에의 접근은 해당 업무 수행자, 업무 수행 시 개인정보 취급이 불가피한 자로 제한하여 그 이외의 직원이 접근하지 못하도록 하고 있습니다. <br><br>
																						
																						<strong>아동의 개인정보</strong><br>
																						회사는 원칙적으로 14세 미만 아동의 개인정보를 수집하지 않습니다. 다만 특별한 경우에 법정대리인의 동의를 얻어 아동의 개인정보를 수집할 수 있습니다. 
																						회사는 회원님의 개인정보를 보호하기 위하여 최선을 다하고 있습니다. 그러나 이러한 노력 이외에 회원님 스스로도 제 3 자에게 비밀번호 등이 노출되지 않도록 주의하셔야 합니다. 
																						특히 비밀번호 등이 공공장소에 설치한 PC를 통해 유출되지 않도록 항상 유의하시기 바랍니다. 또한 회사는 어떠한 경우에도 전화나 E-mail을 통해 사용자의 비밀번호를 묻지 않습니다. 
																						그러므로 본인의 ID와 비밀번호는 꼭 본인만 사용하시고, 비밀번호를 자주 바꿔주시는 것이 좋습니다. 회사는 개인정보보호에 최선을 다하지만, 
																						회원님 개인 실수나 회사의 과실에 기인하지 않는 개인 정보 유출에 대해서는 책임을 지지 않습니다. <br><br>
																						
																						<strong>개인정보 관리 책임자</strong><br>
																						회사 개인정보취급방침과 관련하여 의견이 있을 경우 메일을 주시면 접수 즉시 조치하고 처리결과를 알려드리겠습니다. 개인정보관리책임자는 아래와 같습니다. <br><br>
																						
																						- 이름 : 대표이사 정윤식 <br>
																						- 소속 : (주)맨인소프트 (MANinSOFT Inc.) <br>
																						- 전화 : 031)714-5714 <br>
																						- E-mail : <a href="mailto:smartworks@maninsoft.co.kr">smartworks@maninsoft.co.kr</a> <br><br>
																						
																						<strong>고객센터 안내</strong><br>
																						회사는 민원 처리를 위해 고객센터를 아래와 같이 운영하고 있습니다. <br><br>
																						
																						- 근무시간 : 평일 09:00~18:00 (토,일요일, 공휴일 휴무) <br>
																						- 전화번호 : 031)714-5714 <br>
																						- 주소 : 경기도 성남시 분당구 수내동 16-2 동부루트빌딩 801호 개인정보취급 담당자 앞 <br><br>
																						
																						<strong>부칙</strong><br>
																						현 개인정보취급방침의 수정, 변경이 있을 시 최소 7일 이전에 사이트 내 공지를 통하여 고지할 것입니다.<br><br>
																						개인정보취급방침 시행일자 : 2009년 7월 1일
																					</div>
																				</td>
																			</tr>
																		</table>
																	</td>
																</tr>
																<tr>
																	<td><img src="<%=IMG_ROOT%>/purchase_02_12.jpg" width="349" height="17" alt=""></td>
																</tr>
															</table>
														</td>
													</tr>
													<tr>
														<td height="5"></td>
														<td width="349" height="5"></td>
													</tr>
													<tr>
														<td height="17" align="center"> 위 내용에 동의하십니까? </td>
														<td width="349" height="17" align="center"> 위 내용에 동의하십니까? </td>
													</tr>
													<tr>
														<td align="center">
															<input type="radio" name="agreement" value="1">
															예
															<input type="radio" name="agreement" value="0" checked="checked">
															아니오(체크 바랍니다.) 
														</td>
														<td width="349" align="center">
															<input type="radio" name="privacy" value="1">
															예
															<input type="radio" name="privacy" value="0" checked="checked">
															아니오(체크 바랍니다.)
														</td>
													</tr>
												</table>
											</td>
										</tr>
									</table>
								</td>
							</tr>
							<tr>
								<td align="left" background="<%=IMG_ROOT%>/purchase_02_13.jpg">
									<table width="708" height="18" border="0" cellpadding="0" cellspacing="0">
										<tr>
											<td align="center">
												<table width="690" border="0" cellspacing="0" cellpadding="0" >
													<tr>
														<td height="1" background="<%=IMG_ROOT%>/dotline.gif"></td>
													</tr>
												</table>
											</td>
										</tr>
									</table>
								</td>
							</tr>
							<tr>
								<td align="left" background="<%=IMG_ROOT%>/purchase_02_13.jpg">
									<table width="708" border="0" cellspacing="0" cellpadding="0">
										<tr>
											<td align="center">
												<table width="690" border="0" cellpadding="0" cellspacing="1" bgcolor="#b7b7b7">
													<tr>
														<td width="100" height="22" align="center" bgcolor="#7f7c7c"><span class="txwhite">회사명</span></td>
														<td width="170" align="left" bgcolor="#FFFFFF" style="padding-left:2px;">
															<input type="text" name="company" style="width:234px;border:1px solid #b7b7b7;">
														</td>
														<td width="100" align="center" bgcolor="#706D6D" class="txwhite">담당자</td>
														<td width="236" align="left" bgcolor="#FFFFFF" style="padding-left:2px;">
															<input type="text" name="name" style="width:234px;border:1px solid #b7b7b7;">
														</td>
													</tr>
													<tr>
														<td width="100" height="22" align="center" bgcolor="#7f7c7c" class="txwhite">이메일</td>
														<td align="left" bgcolor="#FFFFFF" style="padding-left:2px;">
															<input type="text" name="email" style="width:234px;border:1px solid #b7b7b7;">
														</td>
														<td width="100" align="center" bgcolor="#706D6D" class="txwhite">연락처</td>
														<td align="left" bgcolor="#FFFFFF" style="padding-left:2px;">
															<input type="text" name="hp" style="width:234px;border:1px solid #b7b7b7;">
														</td>
													</tr>
													<tr>
														<td width="100" height="22" align="center" bgcolor="#7f7c7c" class="txwhite">직원수</td>
														<td align="left" bgcolor="#FFFFFF" style="padding-left:2px;">
															<input type="text" name="staff_number" style="width:234px;border:1px solid #b7b7b7;">
														</td>
														<td width="100" align="center" bgcolor="#706D6D" class="txwhite">사용자수 </td>
														<td align="left" bgcolor="#FFFFFF" style="padding-left:2px;">
															<input type="text" name="user_number" style="width:234px;border:1px solid #b7b7b7;">
														</td>
													</tr>
													<tr>
														<td width="100" height="22" align="center" bgcolor="#7f7c7c" class="txwhite">업 종 </td>
														<td align="left" bgcolor="#FFFFFF" style="padding-left:2px;">
															<input type="text" name="item" style="width:234px;border:1px solid #b7b7b7;">
														</td>
														<td width="100" align="center" bgcolor="#706D6D" class="txwhite">업 태 </td>
														<td align="left" bgcolor="#FFFFFF" style="padding-left:2px;">
															<input type="text" name="business" style="width:234px;border:1px solid #b7b7b7;">
														</td>
													</tr>
													<tr>
														<td width="100" height="22" align="center" bgcolor="#7f7c7c" class="txwhite">서버위치</td>
														<td align="left" bgcolor="#FFFFFF" style="padding-left:2px;">
															<input type="radio" name="server_location" value="1" checked="checked">
															회사 내
															<input type="radio" name="server_location" value="2">
															IDC
															<input type="radio" name="server_location" value="0">
															기타 
														</td>
														<td width="100" align="center" bgcolor="#706D6D" class="txwhite">네트웍크 환경 </td>
														<td align="left" bgcolor="#FFFFFF" style="padding-left:2px;">
															<input type="radio" name="network" value="1" checked="checked">
															전용선
															<input type="radio" name="network" value="2">
															DSL/광랜
															<input type="radio" name="network" value="0">
															기타
														</td>
													</tr>
												</table>
											</td>
										</tr>
										<tr>
											<td height="45" align="center" valign="bottom">
												<a href="javascript:goInstall();">
													<img src="<%=IMG_ROOT%>/purchase_btn_complet.jpg" width="83" height="38" alt="">
												</a>
											</td>
										</tr>
									</table>
								</td>
							</tr>
							<tr>
								<td align="left"><img src="<%=IMG_ROOT%>/purchase_02_14.jpg" width="708" height="11" alt=""></td>
							</tr>
						</table>
					</form>
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
