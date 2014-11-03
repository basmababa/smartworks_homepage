<%@ page language="java" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
<%@ page errorPage="/error/error_view.jsp" %>
<%@ include file="/common/inc/config.jsp" %>
<%@ include file="info.jsp" %>
<%
	String PAGE_INFO = "menu03_sub03_02";
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
							<td colspan="2"><img src="<%=IMG_ROOT%>/purchase_title2.jpg" width="769" height="86" alt="구입안내"></td>
						</tr>
						<tr>
							<td colspan="2" align="right">
								<table width="500" border="0" cellspacing="0" cellpadding="0">
									<tr>
										<td width="486" align="right">
											<a href="javascript:go_home();"><strong>HOME</strong></a> &gt;
											<a href="javascript:menu03_sub01();">구입안내</a> &gt;
											성공사례 (출판업)
										</td>
										<td width="14">&nbsp;</td>
									</tr>
								</table>
							</td>
						</tr>
						<tr>
							<td colspan="2"><img src="<%=IMG_ROOT%>/purchase_stitle_03_02.jpg" width="247" height="18" alt="성공사례 (출판업)"></td>
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
										<td> 외국어 교육 자료를 출판하는 이 회사는 국내 사무실, 재택근무자와 해외에서 <strong>원할한 협업</strong>과, <strong>편집 작업 수행에 대한 현황 파악</strong>이 필요하여 스마트웍스닷넷을 사용하게 되었습니다. 사용 후 이 기업은 편집 진행 현황을 한눈에 파악하고 명확한 보상 체계를 확립 하였을 뿐만 아니라 편집 기간이 단축되는 효과를 얻게 되었습니다.&#13;</td>
									</tr>
								</table>
							</td>
						</tr>
						<tr>
							<td width="31">&nbsp;</td>
							<td>&nbsp;</td>
						</tr>
						<tr>
							<td width="31" rowspan="4">&nbsp;</td>
							<td>
								<table width="725" border="0" cellspacing="0" cellpadding="0">
									<tr>
										<td width="241" align="left" valign="top">
											<table width="237" border="0" cellspacing="0" cellpadding="0">
												<tr>
													<td><img src="<%=IMG_ROOT%>/purchase_03_01.jpg" width="237" height="104" alt=""></td>
												</tr>
												<tr>
													<td align="center" background="<%=IMG_ROOT%>/purchase_03_04.jpg">
														<table width="210" height="160" border="0" cellpadding="0" cellspacing="0">
															<tr>
																<td height="6" colspan="2" align="left" valign="top"></td>
															</tr>
															<tr>
																<td width="12" align="left" valign="top"><img src="<%=IMG_ROOT%>/bullet_gray.jpg" width="8" height="8" alt=""></td>
																<td width="208" align="left" valign="top">
																	외국어 교육용 도서를 기획, 
																	출판하는 A출판사는 도서를 
																	편집할 때 출판 과정 및 진행 
																	현황에 대한 관심은 높으나,
																</td>
															</tr>
															<tr>
																<td height="6" colspan="2" align="left" valign="top"></td>
															</tr>
															<tr>
																<td align="left" valign="top"><img src="<%=IMG_ROOT%>/bullet_gray.jpg" width="8" height="8" alt=""> </td>
																<td align="left" valign="top"> 편집 작업 시 미국-한국(사무실)-한국(재택 근무)로 이루어지고 편집 시 디자인 작업도 이루어져야 해서 <span class="txblue">업무 추적이 어려워</span> 업무 진행 현황을 한눈에 볼 수 있는 스마트웍스닷넷 도입키로 함&#13;</td>
															</tr>
														</table>
													</td>
												</tr>
												<tr>
													<td><img src="<%=IMG_ROOT%>/purchase_03_05.jpg" width="237" height="16" alt=""></td>
												</tr>
											</table>
										</td>
										<td width="243" align="center" valign="top">
											<table width="237" border="0" cellspacing="0" cellpadding="0">
												<tr>
													<td><img src="<%=IMG_ROOT%>/purchase_03_02.jpg" width="237" height="104" alt=""></td>
												</tr>
												<tr>
													<td align="center" background="<%=IMG_ROOT%>/purchase_03_04.jpg">
														<table width="208" height="160" border="0" cellpadding="0" cellspacing="0">
															<tr>
																<td height="6" colspan="2" align="left" valign="top"></td>
															</tr>
															<tr>
																<td width="12" align="left" valign="top"><strong>1</strong>.</td>
																<td width="208" align="left" valign="top"> 출판 계획중인 도서별로 프로젝트를 생성하여 <span class="txblue">프로세스 업무로 편집</span></td>
															</tr>
															<tr>
																<td height="6" colspan="2" align="left" valign="top"></td>
															</tr>
															<tr>
																<td align="left" valign="top"><strong>2</strong>.</td>
																<td align="left" valign="top"> 동일한 서버에서 <span class="txblue">언어(영어/한글)를 선택하여 사용</span> 할 수 있도록 스마트웍스닷넷에서 설정 </td>
															</tr>
															<tr>
																<td height="6" colspan="2" align="left" valign="top"></td>
															</tr>
															<tr>
																<td align="left" valign="top"><strong>3</strong>.</td>
																<td align="left" valign="top"> 프로세스 진행에 따라 수정되는 편집본을 스마트웍스닷넷의 <span class="txblue">첨부 파일로 처리</span> 하여 진행</td>
															</tr>
														</table>
													</td>
												</tr>
												<tr>
													<td><img src="<%=IMG_ROOT%>/purchase_03_05.jpg" width="237" height="16" alt=""></td>
												</tr>
											</table>
										</td>
										<td width="241" align="right" valign="top">
											<table width="237" border="0" cellspacing="0" cellpadding="0">
												<tr>
													<td><img src="<%=IMG_ROOT%>/purchase_03_03.jpg" width="237" height="104" alt=""></td>
												</tr>
												<tr>
													<td align="center" background="<%=IMG_ROOT%>/purchase_03_04.jpg">
														<table width="210" height="160" border="0" cellpadding="0" cellspacing="0">
															<tr>
																<td height="6" colspan="2" align="left" valign="top"></td>
															</tr>
															<tr>
																<td width="12" align="left" valign="top"><img src="<%=IMG_ROOT%>/bullet_arr.jpg" width="8" height="8" alt=""></td>
																<td width="208" align="left" valign="top"> 편집 진행 현황을 한눈에 파악하여 출판 <span class="txred02">일정과 지연, 지연에 따른 문제 해결</span></td>
															</tr>
															<tr>
																<td height="6" colspan="2" align="left" valign="top"></td>
															</tr>
															<tr>
																<td align="left" valign="top"><img src="<%=IMG_ROOT%>/bullet_arr.jpg" width="8" height="8" alt=""> </td>
																<td align="left" valign="top"> 웹을 통한 협업과 해외 근무자와의 원할한 의사 소통이 가능하여 <span class="txred02">편집 기간 단축</span></td>
															</tr>
															<tr>
																<td height="6" colspan="2" align="left" valign="top"></td>
															</tr>
															<tr>
																<td align="left" valign="top"><img src="<%=IMG_ROOT%>/bullet_arr.jpg" width="8" height="8" alt=""></td>
																<td align="left" valign="top">
																	책임과 권한이 명확해지며 프리랜서의 업무 참여 시간 확인으로 
																	<span class="txred02">명확한 보상 체계 확립 </span>
																</td>
															</tr>
														</table>
													</td>
												</tr>
												<tr>
													<td><img src="<%=IMG_ROOT%>/purchase_03_05.jpg" width="237" height="16" alt=""></td>
												</tr>
											</table>
										</td>
									</tr>
								</table>
							</td>
						</tr>
						<tr>
							<td height="7"></td>
						</tr>
						<tr>
							<td><img src="<%=IMG_ROOT%>/purchase_03_07.jpg" width="734" height="698" alt=""></td>
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
