<%@ page language="java" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
<%@ page errorPage="/error/error_view.jsp" %>
<%@ include file="/common/inc/config.jsp" %>
<%@ include file="info.jsp" %>
<%
	String PAGE_INFO = "menu03_sub01";
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
											사용료 안내
										</td>
										<td width="14">&nbsp;</td>
									</tr>
								</table>
							</td>
						</tr>
						<tr>
							<td colspan="2"><img src="<%=IMG_ROOT%>/purchase_stitle_01.jpg" width="287" height="18" alt="사용료 안내"></td>
						</tr>
						<tr>
							<td height="20" colspan="2">&nbsp;</td>
						</tr>
						<tr>
							<td width="31" rowspan="8">&nbsp;</td>
							<td width="739"><img src="<%=IMG_ROOT%>/purchase_tt_01_001.jpg" width="69" height="26" alt=""></td>
						</tr>
						<tr>
							<td height="5"></td>
						</tr>
						<tr>
							<td><img src="<%=IMG_ROOT%>/purchase_01_01.jpg" width="615" height="260" alt=""></td>
						</tr>
						<tr>
						    <td><img src="<%=IMG_ROOT%>/purchase_01_02.jpg" width="615" height="260" alt=""></td>
						</tr>
						<tr>
							<td>&nbsp;</td>
						</tr>
						<tr>
							<td><img src="<%=IMG_ROOT%>/purchase_tt_01_002.jpg" width="116" height="26" alt=""></td>
						</tr>
						<tr>
							<td height="5"></td>
						</tr>
						<tr>
							<td>
								<table width="615" border="0" cellspacing="0" cellpadding="0">
									<tr>
										<td height="8"><img src="<%=IMG_ROOT%>/purchase_line01.jpg" width="615" height="8"></td>
									</tr>
									<tr>
										<td align="center" background="<%=IMG_ROOT%>/purchase_line02.jpg">
											<table width="600" border="0" cellspacing="0" cellpadding="0">
												<tr>
													<td width="110" align="left"><img src="<%=IMG_ROOT%>/purchase_fee01.jpg" width="104" height="80"></td>
													<td width="488" align="center">
														<table width="490" border="0" cellpadding="0" cellspacing="1" bgcolor="#d5d5d5">
															<tr>
																<td width="73" height="18" align="center" bgcolor="#e8e8e8">직원수</td>
																<td width="406" align="center" bgcolor="#e8e8e8">사용료</td>
															</tr>
															<tr>
																<td height="30" bgcolor="#ffffff"><img src="<%=IMG_ROOT%>/purchase_fee20_l.jpg" alt="" width="66" height="20"></td>
																<td width="406" align="left" bgcolor="#ffffff" style="padding:6px;">
																	직원수 20인 미만인 사업체는 <strong class="txblueb">무료</strong>로 서비스됩니다.
																	단, 고객께서 사용하시는 업무를 앱스토어에 공유해 주시는 조건입니다.
																</td>
															</tr>
															<tr>
																<td height="30" bgcolor="#ffffff"><img src="<%=IMG_ROOT%>/purchase_fee20_h.jpg" alt="" width="66" height="20"></td>
																<td height="88" align="left" bgcolor="#ffffff" style="padding:6px;">
																	<p style="padding-bottom:10px;">
																		직원수 20인 이상인 사업체는 전화 <span class="txfee">031-714-5714</span> 또는 이메일
																		<a href="mailto:help@maninsoft.co.kr" style="text-decoration:underline;">help@maninsoft.co.kr</a>로 문의하여 주시기 바랍니다.
																	</p>
																	<p style="padding-bottom:10px;">
																		스마트웍스닷넷은 고객에게 부담을 주지 않는 매우 합리적인 가격으로 서비스를 제공하고 있습니다.
																	</p>
																	<p>
																		항상 친절과 성의를 다하여 고객님의 경영 개선을 위해 늘 함께 하는 <span class="txblueb">스마트웍스닷넷</span>이 되겠습니다.
																	</p> 
																</td>
															</tr>
														</table>
													</td>
												</tr>
											</table>
										</td>
									</tr>
									<tr>
										<td height="8"><img src="<%=IMG_ROOT%>/purchase_line03.jpg" width="615" height="8"></td>
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
