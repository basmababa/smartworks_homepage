<%@ page language="java" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
<%@ include file="/common/inc/config.jsp" %>
<%@ include file="/admin/include/check_admin.jsp" %>
<%@ page import="com.maninsoft.smart.homepage.request.*" %>
<%@ page import="com.maninsoft.smart.homepage.member.*" %>
<%@ page import="com.maninsoft.smart.homepage.admin.function.Function" %>
<%
	Request req = new Request(request);
	Function function = Function.getInstance();
	String sno1 = req.getString("sno1");
	String sno2 = req.getString("sno2");

	String checkMessage = "";
	int sno_flag = 0;

	MemberBean member = new MemberBean();
	MemberManager manager = MemberManager.getInstance();

	member = manager.checkSno(req);
	if (member == null) {             //회원가입되지 않은 주민번호
		checkMessage = "가입할 수 있는 주민번호 입니다.";
		sno_flag = 1;
	} else {                          //회원가입된 주민번호
		checkMessage = "해당주민번호는 <br><span class='blue'>" + member.getMemRegister() + "</span><br>일자에 가입된 번호입니다.";
		sno_flag = 0;
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
	<% if (sno_flag == 1) { %>
		openerObject.sno_flag.value = 1;           //flag setting 1
	    opener.document.getElementById("sno_check02").style.display = "none";    //이미지 변경
	    opener.document.getElementById("sno_check01").style.display = "";
	    openerObject.tel.focus();
	    window.self.close();
	<% } else { %>
		openerObject.sno_flag.value = 0;
	    opener.document.getElementById("sno_check02").style.display = "";         //이미지 변경
	    opener.document.getElementById("sno_check01").style.display = "none";
	    openerObject.sno1.value="";
	    openerObject.sno2.value="";
	    openerObject.sno1.focus();
	    window.self.close();
	<% } %>
}
</script>
</head>
<body style="margin:0; padding:7px; background:#ffffff;">
	<%=function.getSimpleBoxTop(5, "left")%>
	<table width="100%" border="0" cellpadding="0" cellspacing="0">
		<tr>
			<td><%=function.getTitleBox(ADMIN_IMG, "주민번호체크")%></td>
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