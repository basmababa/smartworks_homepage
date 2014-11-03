<%@ page language="java" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
<%@ page errorPage="/error/error_view.jsp" %>
<%@ include file="/common/inc/config.jsp" %>
<%@ include file="info.jsp" %>
<%
	String PAGE_INFO = "menu03_sub03_01";
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
											성공사례 (소프트웨어 기업의 프로젝트관리)
								        </td>
										<td width="14">&nbsp;</td>
									</tr>
								</table>
							</td>
						</tr>
						<tr>
							<td colspan="2"><img src="<%=IMG_ROOT%>/purchase_stitle_03_01.jpg" width="327" height="18" alt="성공례 (소프트웨어 기업의 프로젝트관리)"></td>
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
										<td> 기업업무용 솔루션 판매와 SI가 주 사업인<strong> 소프트웨어 기업</strong>은 <strong>프로젝트 관리</strong>를 위해서 스마트웍스닷넷을 이용하여 PMS를 구성하여 프로젝트 계획 일정 준수하고 수익이 향상되었으며 이슈 등에 대한 원할한 기술 지원으로 프로젝트 품질도 향상</td>
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
														<table width="210" height="190" border="0" cellpadding="0" cellspacing="0">
															<tr>
																<td height="6" colspan="2" align="left" valign="top"></td>
															</tr>
															<tr>
																<td width="12" align="left" valign="top"><img src="<%=IMG_ROOT%>/bullet_gray.jpg" width="8" height="8" alt=""></td>
																<td width="208" align="left" valign="top">기업업무용 솔루션 판매와 고객 사이트에 자사 직원이 투입되어 SI 업무를 주요 사업으로 하고 있어 <span class="txblue">회사와 고 객사이트(로칼)과의 협업</span> 이 필요한 상황이며, </td>
															</tr>
															<tr>
																<td height="6" colspan="2" align="left" valign="top"></td>
															</tr>
															<tr>
																<td align="left" valign="top"><img src="<%=IMG_ROOT%>/bullet_gray.jpg" width="8" height="8" alt=""> </td>
																<td align="left" valign="top">프로젝트에 진행에 따른 프로젝트 관리가 사업의 성패를 좌우하여 <span class="txblue">프로젝트 현황 파악과 관리</span>가 필요해짐 </td>
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
														<table width="208" height="190" border="0" cellpadding="0" cellspacing="0">
															<tr>
																<td height="6" colspan="2" align="left" valign="top"></td>
															</tr>
															<tr>
																<td width="12" align="left" valign="top"><strong>1</strong>.</td>
																<td width="208" align="left" valign="top"> 
																	프로젝트에서 진행되는 업무의 책임과 권한을 명확하게 하기 위하여 스마트웍스닷넷에서 
																	<span class="txblue">프로젝트 조직을 생성하고 과정별 일정 설정하는 PMS</span> 
																</td>
															</tr>
															<tr>
																<td height="6" colspan="2" align="left" valign="top"></td>
															</tr>
															<tr>
																<td align="left" valign="top"><strong>2</strong>.</td>
																<td align="left" valign="top"> 
																	프로젝트의 원가 관리를 위해 PM 통제하에 발생비용을 control
																</td>
															</tr>
															<tr>
																<td height="6" colspan="2" align="left" valign="top"></td>
															</tr>
															<tr>
																<td align="left" valign="top"><strong>3</strong>.</td>
																<td align="left" valign="top"> 프로젝트에서 발생하는 이슈를 관리하고 해결하기 위한 본사의 기술 지원을 위해 스마트웍스닷넷의 <span class="txblue">이슈 관리 프로세스를 생성</span></td>
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
														<table width="210" height="190" border="0" cellpadding="0" cellspacing="0">
															<tr>
																<td height="6" colspan="2" align="left" valign="top"></td>
															</tr>
															<tr>
																<td width="12" align="left" valign="top"><img src="<%=IMG_ROOT%>/bullet_arr.jpg" width="8" height="8" alt=""></td>
																<td width="208" align="left" valign="top"> 
																	프로젝트 진행 현황을 한눈에 파악하여 <span class="txred02">계획 일정 준수</span>
																</td>
															</tr>
															<tr>
																<td height="6" colspan="2" align="left" valign="top"></td>
															</tr>
															<tr>
																<td align="left" valign="top"><img src="<%=IMG_ROOT%>/bullet_arr.jpg" width="8" height="8" alt=""> </td>
																<td align="left" valign="top">
																	원가예산 등 계획에 따른 비용 사용으로 <span class="txred02">프로젝트 수익 향상</span>
																</td>
															</tr>
															<tr>
																<td height="6" colspan="2" align="left" valign="top"></td>
															</tr>
															<tr>
																<td align="left" valign="top"><img src="<%=IMG_ROOT%>/bullet_arr.jpg" width="8" height="8" alt=""></td>
																<td align="left" valign="top">
																	이슈 등에 대한 본사 연구소를 통한 기술 지원으로 
																	<span class="txred02">프로젝트 품질 향상</span>
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
							<td><img src="<%=IMG_ROOT%>/purchase_03_06.jpg" width="726" height="534" alt=""></td>
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
