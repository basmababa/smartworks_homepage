<%@ page language="java" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
<%@ include file="/common/inc/config.jsp" %>
<%@ include file="/admin/include/check_admin.jsp" %>
<%@ page import="com.maninsoft.smart.homepage.request.*"%>
<%@ page import="com.maninsoft.smart.homepage.admin.function.Function" %>
<%@ page import="com.maninsoft.smart.homepage.member.level.*" %>
<%@ page import="com.maninsoft.smart.homepage.bbs.category.*" %>
<%@ page import="com.maninsoft.smart.homepage.bbs.master.*" %>
<%@ page import="java.util.ArrayList" %>
<%
	Request req = new Request(request);
	Function function = Function.getInstance();
	LevelManager levelmanager = LevelManager.getInstance();
	CategoryManager categorymanager = CategoryManager.getInstance();

	ArrayList levelArray = levelmanager.getBbsLevelList();
	ArrayList categoryArray = categorymanager.getUseCategoryList();

	MasterBean master = new MasterBean();
	MasterManager masmanager = MasterManager.getInstance();

	master = masmanager.getBoard(req);

	//modify value setting
	String strBbsId = master.getMasBbsId();
	String strBbsName = master.getMasBbsName();
	String strAdminId = master.getMasAdminId();
	String strAccess = master.getMasAccess();
	String strRead = master.getMasView();
	String strWrite = master.getMasWrite();

	// 권한을 분해해서 찾아낸다.
	String[] arrAccess = strAccess.split(",");
	String[] arrRead = strRead.split(",");
	String[] arrWrite = strWrite.split(",");
	
	String strAttach = master.getMasAttach();
	String strComment = master.getMasComment();
	String strReply = master.getMasReply();
	String strMail = master.getMasMail();
	String strKind = master.getMasKind();
	String strCatId = master.getCatId();
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
		<form name="wForm" method="post" action="modify_ok.jsp">
			<input type="hidden" name="chkSel" value="<%=req.getString("chkSel")%>">
			<%=function.getTitleBox(ADMIN_IMG, "게시판수정")%>
			<table width="100%" border="0" cellpadding="0" cellspacing="0">
				<tr>
					<td>
						<table width="100%" border="0" cellspacing="0" cellpadding="0" class="t_b_bottom">
							<tr>
								<td width="10%" class="t_thC">게시판ID</td>
								<td width="90%" class="t_tdL">
									<input class="input" type="text" name="board_id" value="<%=strBbsId %>" readonly="readonly">
								</td>
							</tr>
							<tr>
								<td width="10%" bgcolor="#EEEEEE" class="t_thC">게시판이름</td>
								<td width="90%" class="t_tdL"><input class="input" type="text" name="board_name" value="<%=strBbsName %>"></td>
							</tr>
							<tr>
								<td width="10%" bgcolor="#EEEEEE" class="t_thC">전용관리자ID</td>
								<td width="90%" class="t_tdL"><input class="input" type="text" name="board_admin" value="<%=strAdminId%>"></td>
							</tr>
							<tr>
								<td width="10%" bgcolor="#EEEEEE" class="t_thC">카테고리</td>
								<td width="90%" class="t_tdL">
									<select name="category">
										<option value=""> :: 카테고리 :: </option>
										<%
											for(int i=0; i < categoryArray.size(); i++) {
												CategoryBean category = new CategoryBean();
												category = (CategoryBean) categoryArray.get(i);
												String cName = category.getCatName();
												String cId = category.getCatId();
										%>
										<option value="<%=cId%>" <%if(strCatId.equals(cId)) {out.println("selected='selected'");}%>><%=cName %></option>
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
 										<option value="1" <%if(strKind.equals("1")){ out.println("selected='selected'");}%>>일반 게시판</option>
										<option value="2" <%if(strKind.equals("2")){ out.println("selected='selected'");}%>>갤러리 게시판</option>
										<option value="3" <%if(strKind.equals("3")){ out.println("selected='selected'");}%>>특정 게시판</option>
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
													for (int j = 0; j < arrAccess.length; j++) {
														if (arrAccess[j].equals(lId)) {
															strChecked = "checked='checked'";
														}
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
								                    for (int j = 0; j < arrRead.length; j++) {
														if (arrRead[j].equals(lId)) {
															strChecked = "checked='checked'";
														}
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
												for (int i = 0; i < levelArray.size(); i++) {
								                    LevelBean level = new LevelBean();
								                    level = (LevelBean) levelArray.get(i);
								                    String lName = level.getLevName();
								                    String lId = level.getLevId();
					
								                    String strChecked = "";
								                    for (int j = 0; j < arrWrite.length; j++) {
														if (arrWrite[j].equals(lId)) {
															strChecked = "checked='checked'";
														}
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
												<input type="checkbox" name="chk_attach" value="1" <%if(strAttach.equals("1")){ out.println("checked='checked'");}%>> 파일첨부
											</td>
											<td>
												<input type="checkbox" name="chk_comment" value="1" <%if(strComment.equals("1")){ out.println("checked='checked'");}%>> Comment
											</td>
											<td>
												<input type="checkbox" name="chk_reply" value="1" <%if(strReply.equals("1")){ out.println("checked='checked'");}%>> 답변
											</td>
											<td>
												<input type="checkbox" name="chk_mail" value="1" <%if(strMail.equals("1")){ out.println("checked='checked'");}%>> 관리자에게 메일발송
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
				<span class="btn_sub" onclick="javascript:goSave();"><img alt="" src="<%=IMG_ROOT%>/icons/btn_icon_ok.gif" /><a onfocus="this.blur();">수 정</a></span>
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
