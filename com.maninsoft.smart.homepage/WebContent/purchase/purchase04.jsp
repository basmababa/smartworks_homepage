<%@ page language="java" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
<%@ page errorPage="/error/error_view.jsp" %>
<%@ include file="/common/inc/config.jsp" %>
<%@ include file="info.jsp" %>
<%
	String PAGE_INFO = "menu03_sub04";
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
							<td colspan="2"><img src="<%=IMG_ROOT%>/purchase_title2.jpg" width="769" height="86"></td>
						</tr>
						<tr>
							<td colspan="2" align="right">
								<table width="500" border="0" cellspacing="0" cellpadding="0">
									<tr>
										<td width="486" align="right">
											<a href="javascript:go_home();"><strong>HOME</strong></a> &gt;
											<a href="javascript:menu03_sub01();">구입안내</a> &gt;
											체험시스템
										</td>
										<td width="14">&nbsp;</td>
									</tr>
								</table>
							</td>
						</tr>
						<tr>
							<td colspan="2"><img src="<%=IMG_ROOT%>/purchase_stitle_04.jpg" alt="" width="250" height="18"></td>
						</tr>
						<tr>
							<td height="20" colspan="2">&nbsp;</td>
						</tr>
						<tr>
							<td width="31" rowspan="15">&nbsp;</td>
							<td width="739"><img src="<%=IMG_ROOT%>/purchase_tt_02_d000.jpg" width="706" height="67"></td>
						</tr>
  						<tr>
							<td>&nbsp;</td>
						</tr>
						<tr>
							<td align="left"><img src="<%=IMG_ROOT%>/purchase_est_01_001.jpg" width="77" height="26"></td>
						</tr>
						<tr>
							<td height="8" align="left"></td>
						</tr>
						<tr>
							<td><img src="<%=IMG_ROOT%>/purchase_est_01_002.jpg" width="350" height="16"></td>
						</tr>
						<tr>
							<td>
								<div style="float:left">
									<a href="http://trial1.smartworks.net" target="_blank" class="outline0"><img src="<%=IMG_ROOT%>/purchase_est_im01.jpg" alt="체험시스템1 바로가기" title="체험시스템1 바로가기"></a>
								</div>
								<div style="float:left">
									<a href="http://trial2.smartworks.net" target="_blank" class="outline0"><img src="<%=IMG_ROOT%>/purchase_est_im02.jpg" alt="체험시스템2 바로가기" title="체험시스템2 바로가기"></a>
								</div>
								<div style="float:left">
									<a href="http://trial3.smartworks.net" target="_blank" class="outline0"><img src="<%=IMG_ROOT%>/purchase_est_im03.jpg" alt="체험시스템3 바로가기" title="체험시스템3 바로가기"></a>						
								</div>
								<div style="float:left">
									<a href="http://trial4.smartworks.net" target="_blank" class="outline0"><img src="<%=IMG_ROOT%>/purchase_est_im04.jpg" alt="체험시스템4 바로가기" title="체험시스템4 바로가기"></a>
								</div>
								<div style="float:left">
									<a href="javascript:alert('점검중 입니다.');" target="_self" class="outline0"><img src="<%=IMG_ROOT%>/purchase_est_im05.jpg" alt="체험시스템5 바로가기" title="체험시스템5 바로가기"></a>
								</div>
							</td>
						</tr>
						<tr>
							<td align="left">
								<table width="706" border="0" cellspacing="0" cellpadding="0">
									<tr>
										<td><img src="<%=IMG_ROOT%>/purchase_02_15.jpg" width="708" height="11"></td>
									</tr>
									<tr>
										<td align="center" background="<%=IMG_ROOT%>/purchase_02_13.jpg">
											<table width="690" height="60" border="0" cellspacing="0" cellpadding="0">
												<tr>
													<td align="left">
														- 체험시스템의 로그인 아이디는 <span class="txblueb">demo@maninsoft.co.kr</span>, 암호는 <span class="txblueb">smartworks</span>입니다.<br>
														- 로그인하는 <span class="txfee">사용자의 권한</span>은 <span class="txfee">운영자</span>로 스마트웍스닷넷의 모든기능을 사용할 수 있습니다.<br>
														- 체험시스템 내에서 작성한 내용은 다른 사용자에 의해 조회, 편집, 수정 및 삭제가 가능함을 감안하셔서 체험하시기 바랍니다.
													</td>
												</tr>
											</table>
										</td>
									</tr>
									<tr>
										<td align="left"><img src="<%=IMG_ROOT%>/purchase_02_14.jpg" width="708" height="11"></td>
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
