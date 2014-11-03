<%@ page language="java" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
<%@ include file="/common/inc/config.jsp" %>
<%@ include file="/admin/include/check_admin.jsp" %>
<%@ page import="com.maninsoft.smart.homepage.request.*"%>
<%@ page import="com.maninsoft.smart.homepage.bbs.category.*" %>
<%@ page import="com.maninsoft.smart.homepage.admin.function.Function" %>
<%@ page import="java.util.ArrayList" %>
<%
	Function function = Function.getInstance();
	ArrayList categoryArray = CategoryManager.getInstance().getCategoryList();
	
	int totalCount = 0;
	totalCount = categoryArray.size();
%>
<html>
<head>
<title>
<%= SITE_TITLE_ADMIN %>
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
		if (confirm("카테고리의 사용상태를 변경합니다.")) {
			document.LForm.action = "active_ok.jsp";
			document.LForm.submit();
		}
	}
</script>
</head>
<body>
	<div id="conTents">
		<form name="LForm" method="post">
			<%=function.getTitleBox(ADMIN_IMG, "카테고리관리 (" + totalCount + ")")%>
			<table width="100%" cellSpacing="0" cellPadding="0" border="0" class="t_b_bottom">
				<tr>
					<th width="5%" class="t_thLast">
						<%if (categoryArray.size() != 0) { %>
							<input type="checkbox" id="allcheck" name="allcheck" onClick="allCheck()">
						<%} %>
					</th>
					<th width="" class="t_th">카테고리 이름</th>
					<th width="20%" class="t_th">카테고리 ID</th>
					<th width="20%" class="t_th">상태</th>
					<th width="10%" class="t_thLast">변경</th>
				</tr>
				<%
					if (categoryArray.size() == 0) {
				%>
				<tr>
					<td class="t_tdFirst" colSpan="8" height="200">
						<img src="<%=ADMIN_IMG%>/title_empty_result.gif" width="332" height="81">
					</td>
				</tr>
				<%
					} else {
						for(int i = 0; i < categoryArray.size(); i++) {
							CategoryBean category = new CategoryBean();
							category = (CategoryBean) categoryArray.get(i);
	
							int intIdx = category.getCatIdx();
				            String strId = category.getCatId();
				            String strName = category.getCatName();
				            String strCheck = category.getCatStatus();
							
							String checked = "";
							String status = "";
	
							if (strCheck.equals("1")) {
								checked = "checked='checked'";
								status = "<font color='#0000ff'>사용</font>";
							} else {
								checked = "";
								status = "<font color='#ff0000'>사용안함</font>";
							}
	
				%>
				<tr>
					<td class="t_tdFirst"><input type="checkbox" id="chkSel" name="chkSel" value="<%=intIdx%>"></td>
					<td class="t_td"><%=strName %></td>
					<td class="t_td"><%=strId %></td>
					<td class="t_td"><%=status %></td>
					<td class="t_td">
						<input type="checkbox" id="chkActive" name="chkActive" value="<%=intIdx%>" <%=checked%>>
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
				게시판 카테고리를 생성할 수 있습니다.<br>
				사용을 하실 카테고리는 상태를 사용으로 바꿔 주세요.<br />
				<font color="red">카테고리 ID는 중복되지 않도록 해주세요!</font><br />
			<%=function.getTipBoxBottom()%>
		</form>
	</div>
</body>
</html>