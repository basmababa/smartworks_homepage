<%@ page language="java" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
<%@ include file="/common/inc/config.jsp" %>
<%@ include file="/admin/include/check_admin.jsp" %>
<%@ page import="com.maninsoft.smart.homepage.admin.function.Function" %>
<%@ page import="com.maninsoft.smart.homepage.request.*"%>
<%@ page import="com.maninsoft.smart.homepage.admin.db.popup.*" %>
<%
	Function function = Function.getInstance();
	Request req = new Request(request);
	
	PopupBean popup = new PopupBean();
	PopupManager popmanager = PopupManager.getInstance();
	popup = popmanager.getPopup(req);
	
	//modify value setting
	String strTitle = popup.getPopTitle();
	String strImgName = popup.getPopImgName();
	String strImgPath = ROOT_DIR + DATA_URL + popup.getPopImgPath();
	String strStartDate = popup.getPopStartDate().toString().substring(0,10);
	String strEndDate = popup.getPopEndDate().toString().substring(0,10);
	int intPointTop = popup.getPopPointTop();
	int intPointLeft = popup.getPopPointLeft();
	String strLinkUrl = popup.getPopLinkUrl();
	String strUseCookie = popup.getPopUseCookie();
	String strSection = popup.getPopSection();
%>
<html>
<head>
<title>
<%= SITE_TITLE_ADMIN %>
</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link href="<%=ROOT_DIR%>/common/css/admin/common.css" rel="stylesheet" type="text/css">
<script language="javascript" type="text/javascript" src="<%=ROOT_DIR%>/common/js/common.js"></script>
<script language="javascript" type="text/javascript" src="<%=ROOT_DIR%>/common/js/calendar/calendar.js"></script>
<script language="javascript" type="text/javascript">

	function goSave() {
		if(checkForm(wForm.title, "팝업창 제목")) return;
		//if(checkForm(wForm.attach_img, "첨부 이미지")) return;
		//if(checkForm(wForm.win_width, "WIDTH")) return;
		//if (isNumber(wForm.win_width,"WIDTH")) return;
		//if(checkForm(wForm.win_height, "HEIGHT")) return;
		//if (isNumber(wForm.win_height,"HEIGHT")) return;
		if(checkForm(wForm.win_top, "TOP")) return;
		if (isNumber(wForm.win_top,"TOP")) return;
		if(checkForm(wForm.win_left, "LEFT")) return;
		if (isNumber(wForm.win_left,"LEFT")) return;
		if(checkForm(wForm.start_date, "시작일")) return;
		if(checkForm(wForm.end_date, "종료일")) return;

		document.wForm.submit();
	}
	function goCancel() {
		document.sForm.action = "list.jsp";
		document.sForm.submit();
	}

</script>
</head>
<body>
	<div id="conTents">
		<form name="wForm" method="post" action="modify_ok.jsp" enctype="multipart/form-data">
			<input type="hidden" name="rec_id" value="<%=req.getString("chkSel")%>">
			<%=function.getTitleBox(ADMIN_IMG, "POPUP 수정")%>
			<table width="100%" border="0" cellpadding="0" cellspacing="0" class="t_b_bottom">
				<tr>
					<td width="13%" class="t_thC">팝업창 제목</td>
					<td width="" class="t_tdL">
						<input class="input" type="text" name="title" style="width:60%" maxlength="100" value="<%=strTitle%>">
					</td>
				</tr>
				<tr>
					<td width="13%" class="t_thC">원본 이미지</td>
					<td width="" class="t_tdL">
						<input type="hidden" name="old_file" value="<%=strImgName%>">
						<img src="<%=strImgPath%><%=strImgName%>">
					</td>
				</tr>
				<tr>
					<td width="13%" class="t_thC">첨부 이미지</td>
					<td width="" class="t_tdL">
						<input class="input" type="file" name="attach_img" style="width:50%">
					</td>
				</tr>
				<tr>
					<td width="13%" class="t_thC">팝업위치</td>
					<td width="" class="t_tdL" valign="middle">
						TOP : <input class="input" type="text" name="win_top" size="9" value="<%=intPointTop%>">
						&nbsp;
						LEFT : <input class="input" type="text" name="win_left" size="9" value="<%=intPointLeft%>">
					</td>
				</tr>
				<tr>
					<td width="13%" class="t_thC">LINK URL</td>
					<td width="" class="t_tdL" valign="middle">
						http://<input class="input" type="text" name="link_url" style="width:60%" value="<%=strLinkUrl%>">
					</td>
				</tr>
				<tr>
					<td width="13%" class="t_thC">Cookie 사용여부 </td>
					<td width="" class="t_tdL" valign="middle">
						<select name="check_cookie">
							<option value="1" <%if(strUseCookie.equals("1")){out.print("selected='selected'");}%>>사용함</option>
							<option value="0" <%if(strUseCookie.equals("0")){out.print("selected='selected'");}%>>사용안함</option>
						</select>
					</td>
				</tr>
				<tr>
					<td width="13%" class="t_thC">시작일</td>
					<td width="" class="t_tdL">
						<input class="input" type="text" name="start_date" style="width:20%;cursor:pointer" readonly="readonly" onClick="javascript:Calendar(this, event);" value="<%=strStartDate%>">
					</td>
				</tr>
				<tr>
					<td width="13%" class="t_thC">종료일</td>
					<td width="" class="t_tdL">
						<input class="input" type="text" name="end_date" style="width:20%;cursor:pointer" readonly="readonly" onClick="javascript:Calendar(this, event);" value="<%=strEndDate%>">
					</td>
				</tr>
			</table>
			<!-- 버튼 -->
			<div id="button">
				<span class="btn_sub" onclick="javascript:goSave();"><img alt="" src="<%=IMG_ROOT%>/icons/btn_icon_ok.gif" /><a onfocus="this.blur();">수 정</a></span>
				<span class="btn_sub" onclick="javascript:goCancel();"><img alt="" src="<%=IMG_ROOT%>/icons/btn_icon_cancel.gif" /><a onfocus="this.blur();">취  소</a></span>
			</div>
			<!--도움말 부분-->
			<%=function.getTipBoxTop(ADMIN_IMG)%>
				팝업창의 크기는 자동 계산됩니다.<br>
				Cookie를 사용하면 하루동안 POPUP 안뛰우기를 할수 있습니다.<br />
				<font color="blue">링크는 사용하지 않으셔도 됩니다.(사용시 화면에 링크기능이 생깁니다.)</font><br />
				<font color="blue">POPUP의 위치는 해상도를 고려하여 입력해주세요.</font>
			<%=function.getTipBoxBottom()%>
		</form>
		<form name="sForm" method="post" action=""></form>
	</div>
</body>
</html>