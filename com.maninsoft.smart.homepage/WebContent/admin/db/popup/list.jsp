<%@ page language="java" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
<%@ include file="/common/inc/config.jsp" %>
<%@ include file="/admin/include/check_admin.jsp" %>
<%@ page import="com.maninsoft.smart.homepage.admin.db.popup.*" %>
<%@ page import="com.maninsoft.smart.homepage.admin.function.Function" %>
<%@ page import="java.util.ArrayList" %>
<%
	Function function = Function.getInstance();
	ArrayList popArray = PopupManager.getInstance().getPopupList();
%>
<html>
<head>
<title>
<%=SITE_TITLE_ADMIN %>
</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link href="<%=ROOT_DIR%>/common/css/admin/common.css" rel="stylesheet" type="text/css">
<script language="javascript" type="text/javascript" src="<%=ROOT_DIR%>/common/js/common.js"></script>
<script language="javascript" type="text/javascript">
	function goAdd() {
		document.LForm.action = "add.jsp";
		document.LForm.submit();
	}

	function allCheck(){
		var chkObj = document.getElementsByName("chkSel");
		if (document.getElementById("allcheck").checked) {
			for (var i = 0; i < chkObj.length; i++) {	// check 된 항목의 개수
				chkObj[i].checked = true;
			}
		} else {
			for (var i = 0; i < chkObj.length; i++) {	// check 된 항목의 개수
				chkObj[i].checked = false;
			}
		}
	}
	
	function goModify() {
		var chkObj = document.getElementsByName("chkSel");
		// check box 있을경우
		if (chkObj.length > 0) {	// check box가 하나 이상일 경우 배열처리
			var count = 0;
			for (var i = 0; i < chkObj.length; i++) {	// check 된 항목의 개수
				if (chkObj[i].checked) {
					count++;
				}
			}
			if (count == 0) {
				alert("수정할 항목을 선택해주세요.");
				return;
			}
			if (count > 1) {	// 두개 이상이 선택된 경우
				alert("수정할 항목을 하나만 선택해주세요.");
				return;
			}
		} else {
			alert("수정할 항목이 없습니다.");
			return;
		}
		document.LForm.action = "modify.jsp";
		document.LForm.submit();
	}

	function goDelete() {
		var chkObj = document.getElementsByName("chkSel");
		// check box 있을경우
		if (chkObj.length > 0) {
			var count = 0;
			for (var i=0; i < chkObj.length; i++) {	// check 된 항목의 개수
				if (chkObj[i].checked) {
					count++;
				}
			}
			if (count == 0) {
				alert("삭제할 항목을 선택해주세요.");
				return;
			}
		} else {
			alert("삭제할 항목이 없습니다.");
			return;
		}
		if (confirm("정말 삭제하시겠습니까?")) {
			document.LForm.action = "delete_ok.jsp";
			document.LForm.submit();
		}
	}
	
	function goActive() {
		if(confirm("팝업창의 상태를 변경합니다.")) {
			document.LForm.action = "active_ok.jsp";
			document.LForm.submit();
		}
	}

	function preview(no, w, h, t, l,c) {
		if (c == '1') {
			h = h + 25;
		}
		window.open("preview.jsp?chkSel=" + no, "popup", "width=" + w + ",height=" + h + ",top=" + t + ",left=" + l);
	}
</script>
</head>
<body>
	<div id="conTents">
		<form name="LForm" method="post">
			<%=function.getTitleBox(ADMIN_IMG, "POPUP 관리 (" + popArray.size() + ")")%>
			<table width="100%" border="0" cellpadding="0" cellspacing="0" class="t_b_bottom">
				<tr height="25">
					<th width="5%" class="t_th">
						<%if(popArray.size() != 0) { %>
							<input type="checkbox" id="allcheck" name="allcheck" onClick="allCheck()">
						<%} %>
					</th>
					<th class="t_th">POPUP 제목</th>
					<th width="7%" class="t_th">Size</th>
					<th width="13%" class="t_th">WIDTH/HEIGHT</th>
					<th width="7%" class="t_th">TOP/LEFT</th>
					<th width="10%" class="t_th">시작일</th>
					<th width="10%" class="t_th">종료일</th>
					<th width="10%" class="t_th">Cookie 사용여부</th>
					<th width="10%" class="t_th">상태</th>
					<th width="5%" class="t_thLast">변경</th>
				</tr>
				<%
					if (popArray.size() == 0) {
				%>
				<tr>
					<td class="t_tdFirst" colSpan="10" height="200">
						<img src="<%=ADMIN_IMG%>/title_empty_result.gif" width="332" height="81">
					</td>
				</tr>
				<%
					} else {
						for (int i = 0; i < popArray.size(); i++) {
							PopupBean popup = new PopupBean();
							popup = (PopupBean) popArray.get(i);

							int intRecId = popup.getPopIdx();
							String strTitle = popup.getPopTitle();
							int intSize = popup.getPopImgSize();
							int intWidth = popup.getPopImgWidth();
							int intHeight = popup.getPopImgHeight();
							int intTop = popup.getPopPointTop();
							int intLeft = popup.getPopPointLeft();
							
							String strStartDate = popup.getPopStartDate().toString().substring(0,10);
							String strEndDate = popup.getPopEndDate().toString().substring(0,10);
							
							String strUseCookie = popup.getPopUseCookie();
							String strStatus = popup.getPopStatus();

							String strCookie = "";
							if (strUseCookie.equals("1")) {
								strCookie = "<font color='green'>사용</font>";
							} else {
								strCookie = "<font color='green'>사용안함</font>";
							}

							String checked = "";
							String status = "";
							if (strStatus.equals("1")) {
								checked = "checked='checked'";
								status = "<font color='blue'>활성화</font>";
							} else {
								checked = "";
								status = "<font color='red'>비활성화</font>";
							}
				%>
				<tr>
					<td class="t_tdFirst">
						<input type="checkbox" name="chkSel" value="<%=intRecId%>">
					</td>
					<td class="t_td">
						<a href="javascript:preview('<%=intRecId%>',<%=intWidth%>,<%=intHeight%>,<%=intTop%>,<%=intLeft%>, '<%=strUseCookie%>');"><%=strTitle %></a>
					</td>
					<td class="t_td"><%=intSize %></td>
					<td class="t_td"><%=intWidth %>/<%=intHeight %></td>
					<td class="t_td"><%=intTop %>/<%=intLeft %></td>
					<td class="t_td"><%=strStartDate %></td>
					<td class="t_td"><%=strEndDate %></td>
					<td class="t_td"><%=strCookie %></td>
					<td class="t_td"><%=status %></td>
					<td class="t_td">
						<input type="checkbox" name="chkActive" value="<%=intRecId%>" <%=checked%>>
					</td>
				</tr>
				<%
						}
					}
				%>
			</table>
			<!-- 버튼 -->
			<div id="button">
				<span class="btn_sub" onclick="javascript:goAdd();"><img alt="" src="<%=IMG_ROOT%>/icons/btn_icon_add2.gif" /><a onfocus="this.blur();">추가</a></span>
				<span class="btn_sub" onclick="javascript:goModify();"><img alt="" src="<%=IMG_ROOT%>/icons/btn_icon_edit.gif" /><a onfocus="this.blur();">수 정</a></span>
				<span class="btn_sub" onclick="javascript:goDelete();"><img alt="" src="<%=IMG_ROOT%>/icons/btn_icon_del.gif" /><a onfocus="this.blur();">삭 제</a></span>
				<span class="btn_sub" onclick="javascript:goActive();"><img alt="" src="<%=IMG_ROOT%>/icons/btn_icon_ok.gif" /><a onfocus="this.blur();">적 용</a></span>
			</div>

			<!--도움말 부분-->
			<%=function.getTipBoxTop(ADMIN_IMG)%>
				상태가 활성화되어야 POPUP 창이 뜹니다.<br>
				Cookie를 사용하면 하루동안 POPUP 안뛰우기를 할수 있습니다.<br />
				제목을 클릭하면 미리보기가 가능합니다.
			<%=function.getTipBoxBottom()%>
		</form>
	</div>
</body>
</html>
