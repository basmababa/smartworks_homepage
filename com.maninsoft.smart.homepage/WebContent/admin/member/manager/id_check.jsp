<%@ page language="java" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
<%@ include file="/common/inc/config.jsp" %>
<%@ include file="/admin/include/check_admin.jsp" %>
<%@ page import="com.maninsoft.smart.homepage.request.*" %>
<%@ page import="com.maninsoft.smart.homepage.member.*" %>
<%@ page import="com.maninsoft.smart.homepage.admin.function.Function" %>
<%
	Request req = new Request(request);
	Function function = Function.getInstance();
	
	String checkMessage = "";
	int id_flag = 0;

	MemberManager manager = MemberManager.getInstance();
	int checkVal = manager.checkId(req);
	
	if (checkVal == 0) { //중복없음 사용가능
		checkMessage = "사용가능한 아이디 입니다.";
		id_flag = 1;
	} else {
		checkMessage = "사용중인 아이디 입니다.<br>다른 아이디를 생성하세요";
		id_flag = 0;
	}

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
	function set_flag() {
		openerObject = opener.document.wForm;
		<% if (id_flag == 1) { %>
		    openerObject.id_flag.value = 1;           //체크 flag 1
		    opener.document.getElementById("id_check02").style.display = "none";    //이미지 변경
		    opener.document.getElementById("id_check01").style.display = "";  
		    openerObject.pass.focus();
		    window.self.close();
		<% } else { %>
		    openerObject.id_flag.value = 0;
		    opener.document.getElementById("id_check02").style.display = "";    //이미지 변경
		    opener.document.getElementById("id_check01").style.display = "none";
		    openerObject.id.value="";
		    openerObject.id.focus();
		    window.self.close();
		<% } %>
	}
</script>
</head>
<body style="margin:0; padding:7px; background:#ffffff;">
	<%=function.getSimpleBoxTop(5, "left")%>
	<table width="100%" border="0" cellpadding="0" cellspacing="0">
		<tr>
			<td><%=function.getTitleBox(ADMIN_IMG, "아이디체크")%></td>
		</tr>
		<tr>
			<td align="center" height="75" style="border-top:1px solid #cccccc;border-bottom:1px solid #cccccc">
				<font color="#000099"><%=checkMessage %></font>
			</td>
		</tr>
		<tr>
			<td height="5"></td>
		</tr>
		<tr>
			<td align="center">
				<span class="btn_sub" onclick="javascript:set_flag();"><img alt="" src="<%=IMG_ROOT%>/icons/btn_icon_ok.gif" /><a onfocus="this.blur();">확 인</a></span>
			</td>
		</tr>
		<tr>
			<td height="5"></td>
		</tr>
		</table>
	<%=function.getSimpleBoxBottom()%>
</body>
</html>