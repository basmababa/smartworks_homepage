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
<link rel="stylesheet" type="text/css" href="<%=ROOT_DIR%>/common/css/bbs/board.css">
<script type="text/javascript" src="<%=ROOT_DIR%>/common/js/common.js"></script>
<script type="text/javascript" src="<%=ROOT_DIR%>/common/js/menu_action.js"></script>
<script language="javascript" src="<%=ROOT_DIR%>/common/js/bbs/board.js"></script>
<link rel="stylesheet" type="text/css" href="<%=ROOT_DIR%>/smarteditor/css/default.css">
<script language="javascript" type="text/javascript" src="<%=ROOT_DIR%>/smarteditor/js/HuskyEZCreator.js" charset="utf-8"></script>
<script language="javascript" type="text/javascript">
	var rootDir = "<%=ROOT_DIR%>";
	function goSave() {

		oEditors.getById["ir1"].exec("UPDATE_IR_FIELD", []);
		document.wForm.contents.value = oEditors.getById["ir1"].getIR();
		
		if(checkForm(document.wForm.title, "문의제목")) return;
		if(checkForm(document.wForm.company, "회사명")) return;
		if(checkForm(document.wForm.name, "담당자")) return;
		if(checkForm(document.wForm.hp, "연락처")) return;
		if(checkForm(document.wForm.email, "이메일")) return;
		if(!isEMail(document.wForm.email, "이메일")) return;
		if(checkForm(document.wForm.contents, "문의내용")) return;
	  
		document.wForm.submit();
	}
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
				<form name="wForm" method="post" action="contact_ok.jsp">
					<table width="793" border="0" cellspacing="0" cellpadding="0">
						<tr>
							<td colspan="2"><img src="<%=IMG_ROOT%>/popmain_title04.jpg" width="793" height="76" alt="Cooperation"></td>
						</tr>
						<tr>
							<td height="5" colspan="2"></td>
						</tr>
						<tr>
							<td colspan="2"><img src="<%=IMG_ROOT%>/popmain_stitle04.jpg" width="187" height="26" alt="제휴문의"></td>
						</tr>
						<tr>
							<td height="15" colspan="2">&nbsp;</td>
						</tr>
						<tr>
							<td width="34">&nbsp;</td>
							<td width="759">
								<table width="720" border="0" cellpadding="0" cellspacing="0">
									<tr>
										<td width="127" rowspan="3" valign="top" bgcolor="#ffffff"><img src="<%=IMG_ROOT%>/sub_inquiry.jpg" width="107" height="90" alt=""></td>
										<td width="593" valign="top" bgcolor="#ffffff">
											저희 스마트웍스닷넷은 여러 <span class="txblue">리테일회사</span>를 모시고 있습니다. <br>
											또한 저희는 <span class="txblue">광고 및 마케팅 분야</span>에 어떠한 제안도 받아드리고 있습니다.<br><br>
											 담당자가 접수 후 신속하게 답변드리 겠습니다. 감사합니다!
										</td>
									</tr>
									<tr>
										<td valign="top" bgcolor="#ffffff">&nbsp;</td>
									</tr>
									<tr>
										<td valign="top" bgcolor="#ffffff">
											<table width="570" border="0" cellpadding="0" cellspacing="1" bgcolor="#d4cfcc">
												<tr>
													<td align="center" bgcolor="#ffffff">
														<br>
														<table width="529" border="0" cellspacing="0" cellpadding="0">
															<tr>
																<td width="60" align="left"><img src="<%=IMG_ROOT%>/left_dot.jpg" width="4" height="4" align="middle" alt=""> 문의제목</td>
																<td colspan="3" height="28" align="left">
																	<input id="title" name="title" type="text" style="height:16px;width:97%;border:1px solid #d4cfcc;margin-top:1px;padding-top:1px;">
																</td>
															</tr>
															<tr>
																<td width="60" align="left"><img src="<%=IMG_ROOT%>/left_dot.jpg" width="4" height="4" align="middle" alt=""> 회사명</td>
																<td height="28" align="left">
																	<input id="company" name="company" type="text" style="height:16px;width:190px;border:1px solid #d4cfcc;">
																</td>
																<td width="60" align="left"><img src="<%=IMG_ROOT%>/left_dot.jpg" width="4" height="4" align="middle" alt=""> 담당자</td>
																<td height="28" align="left">
																	<input id="name" name="name" type="text" value="" style="height:16px;width:190px;border:1px solid #d4cfcc;">
																</td>
															</tr>
															<tr>
																<td width="60" align="left"><img src="<%=IMG_ROOT%>/left_dot.jpg" width="4" height="4" align="middle" alt=""> 연락처</td>
																<td height="28" align="left">
																	<input id="hp" name="hp" type="text" value="" style="height:16px;width:190px;border:1px solid #d4cfcc;">
																</td>
																<td width="60" align="left"><img src="<%=IMG_ROOT%>/left_dot.jpg" width="4" height="4" align="middle" alt=""> 이메일</td>
																<td height="28" align="left">
																	<input id="email" name="email" type="text" value="" style="height:16px;width:190px;border:1px solid #d4cfcc;padding-top:1px;">
																</td>
															</tr>
															<tr>
																<td width="60" align="left"><img src="<%=IMG_ROOT%>/left_dot.jpg" width="4" height="4" align="middle" alt=""> 문의내용</td>
																<td colspan="3" height="28" align="left">
																	<textarea name="ir1" id="ir1" style="width:97%; height:220px; display:none;"></textarea>
																	<textarea name="contents" id="contents" style="display:none;"></textarea>
																</td>
															</tr>
														</table>
														<br>
													</td>
												</tr>
											</table>
										</td>
									</tr>
									<tr align="center">
										<td colspan="2" bgcolor="#ffffff"></td>
									</tr>
									<tr align="center">
										<td colspan="2" bgcolor="#ffffff">
											<br>
											<a href="javascript:goSave();"><img src="<%=IMG_ROOT%>/btn_regist.jpg" width="60" height="24" alt=""></a>
											<a href="javascript:document.wForm.reset();"><img src="<%=IMG_ROOT%>/btn_cancle.jpg" width="60" height="24" alt=""></a>
										</td>
									</tr>
								</table>
							</td>
						</tr>
					</table>
				</form>
			</td><!-- contents area end -->
		</tr>
		<tr>
			<td height="20"></td>
		</tr>
	</table>
	<script language="javascript" type="text/javascript">
		var oEditors = [];
		nhn.husky.EZCreator.createInIFrame({
			oAppRef: oEditors,
			elPlaceHolder: "ir1",
			sSkinURI: "<%=ROOT_DIR%>/smarteditor/SEditorSkin.html",
			fCreator: "createSEditorInIFrame"
		});
	</script>
</body>
</html>
