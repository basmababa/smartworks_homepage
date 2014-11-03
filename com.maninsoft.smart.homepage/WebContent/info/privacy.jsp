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
					    <td colspan="2"><img src="<%=IMG_ROOT%>/popmain_title03.jpg" width="793" height="76" alt="Privacy Policies"></td>
					</tr>
					<tr>
						<td height="5" colspan="2"></td>
					</tr>
					<tr>
						<td colspan="2"><img src="<%=IMG_ROOT%>/popmain_stitle03.jpg" width="187" height="26" alt="개인정보취급방침"></td>
					</tr>
					<tr>
						<td height="12" colspan="2">&nbsp;</td>
					</tr>
					<tr>
						<td width="34">&nbsp;</td>
						<td width="759">
							<table width="720" border="0" cellspacing="0" cellpadding="0">
								<tr>
									<td align="left">
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
										- E-mail : <a href="mailto:help@maninsoft.co.kr">help@maninsoft.co.kr</a> <br><br>
										
										<strong>고객센터 안내</strong><br>
										회사는 민원 처리를 위해 고객센터를 아래와 같이 운영하고 있습니다. <br><br>
										
										- 근무시간 : 평일 09:00~18:00 (토,일요일, 공휴일 휴무) <br>
										- 전화번호 : 031)714-5714 <br>
										- 주소 : 경기도 성남시 분당구 수내동 16-2 동부루트 801호 개인정보취급 담당자 앞 <br><br>
										
										<strong>부칙</strong><br>
										현 개인정보취급방침의 수정, 변경이 있을 시 최소 7일 이전에 사이트 내 공지를 통하여 고지할 것입니다.<br><br>
										개인정보취급방침 시행일자 : 2009년 7월 1일 	
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
