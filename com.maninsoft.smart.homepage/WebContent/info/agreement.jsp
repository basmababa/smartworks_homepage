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
						<td colspan="2"><img src="<%=IMG_ROOT%>/popmain_title02.jpg" width="793" height="76" alt="CLAUES"></td>
					</tr>
					<tr>
						<td height="5" colspan="2"></td>
					</tr>
					<tr>
						<td colspan="2"><img src="<%=IMG_ROOT%>/popmain_stitle02.jpg" width="187" height="26" alt="이용약관"></td>
					</tr>
					<tr>
						<td height="12" colspan="2">&nbsp;</td>
					</tr>
					<tr>
						<td width="34">&nbsp;</td>
						<td width="759" align="left">
							<table width="720" border="0" cellspacing="0" cellpadding="0">
								<tr>
									<td align="left">
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
