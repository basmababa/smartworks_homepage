<%@ page language="java" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
<%@ include file="/common/inc/config.jsp" %>
<%@ include file="/admin/include/check_admin.jsp" %>
<%@ page import="com.maninsoft.smart.homepage.admin.function.Function" %>
<%@ page import="com.maninsoft.smart.homepage.member.level.*" %>
<%@ page import="com.maninsoft.smart.homepage.bbs.category.*" %>
<%@ page import="java.util.ArrayList" %>
<%
	Function function = Function.getInstance();
	LevelManager levelmanager = LevelManager.getInstance();
	CategoryManager categorymanager = CategoryManager.getInstance();
	
	ArrayList levelArray = levelmanager.getBbsLevelList();
	ArrayList categoryArray = categorymanager.getUseCategoryList();
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

	function goSave() {
		if(document.wForm.board_id.value == "") {
			alert("게시판 ID를 입력하세요");
			document.wForm.board_id.focus();
			return;
		}
		if(document.wForm.board_name.value == "") {
			alert("게시판 이름을 입력하세요");
			document.wForm.board_name.focus();
			return;
		}
		if(document.wForm.board_admin.value == "") {
			alert("관리자 ID를 입력하세요");
			document.wForm.board_admin.focus();
			return;
		}
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
		<form name="wForm" method="post" action="add_ok.jsp">
			<%=function.getTitleBox(ADMIN_IMG, "게시판추가")%>
			<table width="100%" border="0" cellpadding="0" cellspacing="0">
				<tr>
					<td>
						<table width="100%" border="0" cellspacing="0" cellpadding="0" class="t_b_bottom">
							<tr>
								<td width="10%" class="t_thC">게시판ID</td>
								<td width="90%" class="t_tdL">
									<input class="input" type="text" name="board_id">
								</td>
							</tr>
							<tr>
								<td width="10%" bgcolor="#EEEEEE" class="t_thC">게시판이름</td>
								<td width="90%" class="t_tdL"><input class="input" type="text" name="board_name"></td>
							</tr>
							<tr>
								<td width="10%" bgcolor="#EEEEEE" class="t_thC">전용관리자ID</td>
								<td width="90%" class="t_tdL"><input class="input" type="text" name="board_admin" value="<%=S_ID%>"></td>
							</tr>
							<tr>
								<td width="10%" bgcolor="#EEEEEE" class="t_thC">카테고리</td>
								<td width="90%" class="t_tdL">
									<select name="category">
										<option value=""> :: 카테고리 :: </option>
										<%
											for (int i = 0; i < categoryArray.size(); i++) {
												CategoryBean category = new CategoryBean();
												category = (CategoryBean) categoryArray.get(i);
												String cName = category.getCatName();
												String cId = category.getCatId();
										%>
										<option value="<%=cId%>"><%=cName %></option>
										<% 
											}
										%>
									</select>
								</td>
							</tr>
							<tr>
								<td width="10%" bgcolor="#EEEEEE" class="t_thC">게시판종류</td>
								<td width="90%" class="t_tdL">
									<select name="board_kind">
 										<option value="1" selected="selected">일반 게시판</option>
										<option value="2">갤러리 게시판</option>
										<option value="3">특정 게시판</option>
									</select>
								</td>
							</tr>
							<tr>
								<td width="10%" bgcolor="#EEEEEE" class="t_thC">권한설정</td>
								<td width="90%" class="t_tdL">
									<table width="100%" border="0" cellspacing="1" cellpadding="3" bgcolor="#eeeeee">
										<tr bgcolor="#ffffff">
											<td bgcolor="#f2f2f2" width="20%">Access</td>
											<% 
												for (int i = 0; i < levelArray.size(); i++) {
								                    LevelBean level = new LevelBean();
								                    level = (LevelBean) levelArray.get(i);
								                    String lName = level.getLevName();
								                    String lId = level.getLevId();
					
								                    String strChecked = "";
								                    if (!lId.equals("0")) {
														strChecked = "checked='checked'";
								                    }
											%>
											<td><input type="checkbox" name="chk_access" value="<%=lId%>" <%=strChecked%>><%=lName %></td>
											<% 
												}
											%>
										</tr>
										<tr bgcolor="#ffffff">
											<td bgcolor="#f2f2f2">Read(View)</td>
											<% 
												for (int i = 0; i < levelArray.size(); i++) {
								                    LevelBean level = new LevelBean();
								                    level = (LevelBean) levelArray.get(i);
								                    String lName = level.getLevName();
								                    String lId = level.getLevId();
					
								                    String strChecked = "";
								                    if (!lId.equals("0")) {
														strChecked = "checked='checked'";
								                    }
											%>
											<td><input type="checkbox" name="chk_view" value="<%=lId%>" <%=strChecked%>><%=lName %></td>
											<%
												}
											%>
										</tr>
										<tr bgcolor="#ffffff">
											<td bgcolor="#f2f2f2">Write</td>
											<%
												for(int i = 0; i < levelArray.size(); i++) {
								                    LevelBean level = new LevelBean();
								                    level = (LevelBean) levelArray.get(i);
								                    String lName = level.getLevName();
								                    String lId = level.getLevId();
					
								                    String strChecked = "";
								                    if (!lId.equals("0")) {
														strChecked = "checked='checked'";
								                    }
											%>
											<td><input type="checkbox" name="chk_write" value="<%=lId%>" <%=strChecked%>><%=lName %></td>
											<%
												}
											%>
										</tr>
									</table>
								</td>
							</tr>
							<tr>
								<td width="10%" bgcolor="#EEEEEE" class="t_thC">기능설정</td>
								<td width="90%" class="t_tdL">
									<table width="100%" border="0" cellspacing="0" cellpadding="2">
										<tr>
 											<td>
												<input type="checkbox" name="chk_attach" value="1" checked="checked"> 파일첨부
											</td>
											<td>
												<input type="checkbox" name="chk_comment" value="1" checked="checked"> Comment
											</td>
											<td>
												<input type="checkbox" name="chk_reply" value="1" checked="checked"> 답변
											</td>
											<td>
												<input type="checkbox" name="chk_mail" value="1"> 관리자에게 메일발송
											</td>
										</tr>
									</table>
								</td>
							</tr>
						</table>
					</td>
				</tr>
			</table>

			<div id="button">
				<span class="btn_sub" onclick="javascript:goSave();"><img alt="" src="<%=IMG_ROOT%>/icons/btn_icon_ok.gif" /><a onfocus="this.blur();">추 가</a></span>
				<span class="btn_sub" onclick="javascript:goCancel();"><img alt="" src="<%=IMG_ROOT%>/icons/btn_icon_cancel.gif" /><a onfocus="this.blur();">취 소</a></span>
			</div>
			
			<!--도움말 부분-->
			<%=function.getTipBoxTop(ADMIN_IMG)%>
			<b>Access</b> : 리스트 페이지 접근 일반적으로 All check !<br>
			<b>Read</b> : 게시물의 View페이지에접근 일반적으로 Guest만 제외 !<br />
			<b>Write</b> : 글쓰는 사람의 접근권한.<br><br>
			
			<font color="red"> ◆ BBS의 ID는 중복되지 않아야 합니다. </font><br />
			<%=function.getTipBoxBottom()%>
		</form>
		<form name="sForm" method="post" action=""></form>
	</div>
</body>
</html>
