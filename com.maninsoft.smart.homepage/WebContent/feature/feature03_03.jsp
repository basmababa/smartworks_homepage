<%@ page language="java" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
<%@ page errorPage="/error/error_view.jsp" %>
<%@ include file="/common/inc/config.jsp" %>
<%@ include file="info.jsp" %>
<%
	String PAGE_INFO = "menu02_sub03_03";
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
											작업공간 (설정 화면)
										</td>
										<td width="14">&nbsp;</td>
									</tr>
								</table>
							</td>
						</tr>
						<tr>
							<td colspan="2"><img src="<%=IMG_ROOT%>/function_stitle_03_003.jpg" width="295" height="18" alt="작업공간 (설정 화면)"></td>
						</tr>
						<tr>
							<td height="20" colspan="2">&nbsp;</td>
						</tr>
						<tr>
							<td width="31" rowspan="11">&nbsp;</td>
							<td width="739">
								<table width="700" border="0" cellspacing="0" cellpadding="0">
									<tr>
										<td width="14">&nbsp;</td>
										<td width="686" align="left"><img src="<%=IMG_ROOT%>/function_tt_03_002.jpg" width="69" height="26" alt=""></td>
									</tr>
								</table>
							</td>
						</tr>
						<tr>
							<td height="5"></td>
						</tr>
						<tr>
						    <td align="left">
						    	<table width="724" border="0" cellspacing="0" cellpadding="0">
									<tr>
										<td width="13">&nbsp;</td>
										<td width="488" align="left"><img src="<%=IMG_ROOT%>/function_003_03.jpg" width="488" height="454" alt=""></td>
										<td width="5">&nbsp;</td>
										<td width="218" valign="top">
											<table width="218" border="0" cellspacing="0" cellpadding="0">
												<tr>
													<td>&nbsp;</td>
												</tr>
												<tr>
													<td><img src="<%=IMG_ROOT%>/function_003_ad01.jpg" width="100" height="25" alt=""></td>
												</tr>
												<tr>
													<td><img src="<%=IMG_ROOT%>/function_003_ad06.jpg" width="218" height="14" alt=""></td>
												</tr>
												<tr>
													<td align="center" background="<%=IMG_ROOT%>/function_003_ad07.jpg">
														<table width="200" border="0" cellspacing="0" cellpadding="0">
															<tr>
																<td align="left"> 기업 환경 변화에 대응하는 유기체적인 조직관리가 가능하며, 구성원의 추가 및 삭제도 간편하게 처리합니다.</td>
															</tr>
														</table>
													</td>
												</tr>
												<tr>
													<td><img src="<%=IMG_ROOT%>/function_003_ad08.jpg" width="218" height="14" alt=""></td>
												</tr>
											</table>
										</td>
									</tr>
								</table>
							</td>
						</tr>
						<tr>
							<td align="left">&nbsp;</td>
						</tr>
						<tr>
							<td align="left">
								<table width="724" border="0" cellspacing="0" cellpadding="0">
									<tr>
										<td width="13">&nbsp;</td>
										<td width="488" align="left"><img src="<%=IMG_ROOT%>/function_003_04.jpg" width="488" height="454" alt=""></td>
										<td width="5">&nbsp;</td>
										<td width="218" valign="top">
											<table width="218" border="0" cellspacing="0" cellpadding="0">
												<tr>
													<td>&nbsp;</td>
												</tr>
												<tr>
													<td><img src="<%=IMG_ROOT%>/function_003_ad02.jpg" width="100" height="25" alt=""></td>
												</tr>
												<tr>
													<td><img src="<%=IMG_ROOT%>/function_003_ad06.jpg" width="218" height="14" alt=""></td>
												</tr>
												<tr>
													<td align="center" background="<%=IMG_ROOT%>/function_003_ad07.jpg">
														<table width="200" border="0" cellspacing="0" cellpadding="0">
															<tr>
																<td align="left">
																	업무의 보이는 항목과 안 보이는 항목을 설정, 조회, 작성, 수정, 삭제 권한의 설정을 통하여 
																	권한별 체계적인 업무 수행이 가능하며, 철저한 업무 및 데이터에 대한 보안을 유지합니다.
																</td>
															</tr>
														</table>
													</td>
												</tr>
												<tr>
													<td><img src="<%=IMG_ROOT%>/function_003_ad08.jpg" width="218" height="14" alt=""></td>
												</tr>
											</table>
										</td>
									</tr>
								</table>
							</td>
						</tr>
						<tr>
							<td align="left">&nbsp;</td>
						</tr>
						<tr>
							<td align="left">
								<table width="724" border="0" cellspacing="0" cellpadding="0">
									<tr>
										<td width="13">&nbsp;</td>
										<td width="488" align="left"><img src="<%=IMG_ROOT%>/function_003_05.jpg" width="488" height="325" alt=""></td>
										<td width="5">&nbsp;</td>
										<td width="218" valign="top">
											<table width="218" border="0" cellspacing="0" cellpadding="0">
												<tr>
													<td>&nbsp;</td>
												</tr>
												<tr>
													<td><img src="<%=IMG_ROOT%>/function_003_ad03.jpg" width="100" height="25" alt=""></td>
												</tr>
												<tr>
													<td><img src="<%=IMG_ROOT%>/function_003_ad06.jpg" width="218" height="14" alt=""></td>
												</tr>
												<tr>
													<td align="center" background="<%=IMG_ROOT%>/function_003_ad07.jpg">
														<table width="200" border="0" cellspacing="0" cellpadding="0">
															<tr>
																<td align="left">
																	현재 사용중인 스마트웍스버전에 대한 확인을 하며, 버전에 대한 업데이트가 무료로 제공됩니다. 
																	사용자는 자동으 로 업데이트되는 스마트웍스닷넷을 통해 항상 최신 버전의 시스템을 사용할 수 있습니다.
																</td>
															</tr>
														</table>
													</td>
												</tr>
												<tr>
													<td><img src="<%=IMG_ROOT%>/function_003_ad08.jpg" width="218" height="14" alt=""></td>
												</tr>
											</table>
										</td>
									</tr>
								</table>
							</td>
						</tr>
						<tr>
							<td align="left">&nbsp;</td>
						</tr>
						<tr>
							<td align="left">
								<table width="724" border="0" cellspacing="0" cellpadding="0">
									<tr>
										<td width="13">&nbsp;</td>
										<td width="488" align="left"><img src="<%=IMG_ROOT%>/function_003_06.jpg" width="488" height="106" alt=""></td>
										<td width="5">&nbsp;</td>
										<td width="218" valign="top">
											<table width="218" border="0" cellspacing="0" cellpadding="0">
												<tr>
													<td>&nbsp;</td>
												</tr>
												<tr>
													<td><img src="<%=IMG_ROOT%>/function_003_ad04.jpg" width="100" height="25" alt=""></td>
												</tr>
												<tr>
													<td><img src="<%=IMG_ROOT%>/function_003_ad06.jpg" width="218" height="14" alt=""></td>
												</tr>
												<tr>
													<td align="center" background="<%=IMG_ROOT%>/function_003_ad07.jpg">
														<table width="200" border="0" cellspacing="0" cellpadding="0">
															<tr>
																<td align="left"> 스마트웍스닷넷에서는 고객이 자기만의 로고를 사용할 수 있습니다.</td>
															</tr>
														</table>
													</td>
												</tr>
												<tr>
													<td><img src="<%=IMG_ROOT%>/function_003_ad08.jpg" width="218" height="14" alt=""></td>
												</tr>
											</table>
										</td>
									</tr>
								</table>
							</td>
						</tr>
						<tr>
							<td align="left">&nbsp;</td>
						</tr>
						<tr>
							<td align="left">
								<table width="724" border="0" cellspacing="0" cellpadding="0">
									<tr>
										<td width="13">&nbsp;</td>
										<td width="488" align="left"><img src="<%=IMG_ROOT%>/function_003_07.jpg" width="488" height="193" alt=""></td>
										<td width="5">&nbsp;</td>
										<td width="218" valign="top">
											<table width="218" border="0" cellspacing="0" cellpadding="0">
												<tr>
													<td>&nbsp;</td>
												</tr>
												<tr>
													<td><img src="<%=IMG_ROOT%>/function_003_ad05.jpg" width="100" height="25" alt=""></td>
												</tr>
												<tr>
													<td><img src="<%=IMG_ROOT%>/function_003_ad06.jpg" width="218" height="14" alt=""></td>
												</tr>
												<tr>
													<td align="center" background="<%=IMG_ROOT%>/function_003_ad07.jpg">
														<table width="200" border="0" cellspacing="0" cellpadding="0">
															<tr>
																<td align="left"> 사용자 개인이 비밀번호, 자신만의 이미지를 관리하며, 결재 시 사용되는 서명관리도 관리합니다.</td>
															</tr>
														</table>
													</td>
												</tr>
												<tr>
													<td><img src="<%=IMG_ROOT%>/function_003_ad08.jpg" width="218" height="14" alt=""></td>
												</tr>
											</table>
										</td>
									</tr>
								</table>
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
