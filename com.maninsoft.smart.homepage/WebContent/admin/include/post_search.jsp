<%@ page language="java" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
<%@ include file="/common/inc/config.jsp" %>
<%@ include file="/admin/include/check_admin.jsp" %>
<%@ page import="com.maninsoft.smart.homepage.post.*" %>
<%@ page import="com.maninsoft.smart.homepage.admin.function.Function" %>
<%
	Function function = Function.getInstance();
	
	/* opener Form name parameter*/
	String reqForm = request.getParameter("openerForm");
	String reqZip1 = request.getParameter("zip1");
	String reqZip2 = request.getParameter("zip2");
	String reqAddress1 = request.getParameter("address1");
	String reqAddress2 = request.getParameter("address2");
	
	/* curPage  parameter */
	String submitDong = request.getParameter("dong");

	String [][] postArray = null;
	if (submitDong != null && !submitDong.equals("")) {
	   postArray = PostSearch.getPostList(submitDong);
	}


%>
<html>
<head>
<title> :: 우편번호찾기 :: </title>
<link href="<%=ROOT_DIR%>/common/css/admin/common.css" rel="stylesheet" type="text/css">
<script language="javascript" type="text/javascript" src="<%=ROOT_DIR%>/common/js/common.js"></script>
<script type="text/javascript" language="javascript">
	function go_search() {
		if(checkForm(postForm.dong, "동이름")) return false;
		resizeTo(428,300);
		document.postForm.submit();
	}
	
	function set_address(z, a) {
		z1 = z.substring(0,3);
		z2 = z.substring(4,7);
	
		//부모페이지의 Object 생성, 검색된 String을 부모페이지에 Setting
		var openerObject;
		openerObject = eval(opener.document.<%=reqForm%>);
	
		openerObject.<%=reqAddress1%>.value = a;
		openerObject.<%=reqZip1%>.value = z1;
		openerObject.<%=reqZip2%>.value = z2;

		openerObject.<%=reqAddress2%>.focus();
		self.close();
	}
</script>
</head>
<body style="margin:0; padding:7px; background:#ffffff;" onload="document.postForm.dong.focus();">
	<%=function.getSimpleBoxTop(5, "left")%>
	<form name="postForm" method="post" action="<%=CUR_PAGE%>" onsubmit="return go_search();">
		<input type="hidden" name="openerForm" value="<%=reqForm%>"/>
		<input type="hidden" name="zip1" value="<%=reqZip1%>"/>
		<input type="hidden" name="zip2" value="<%=reqZip2%>"/>
		<input type="hidden" name="address1" value="<%=reqAddress1%>"/>
		<input type="hidden" name="address2" value="<%=reqAddress2%>"/>
		
		<table width="100%" border="0" cellpadding="0" cellspacing="0">
			<tr>
				<td><%=function.getTitleBox(ADMIN_IMG, "우편번호찾기")%></td>
			</tr>
			<tr>
				<td align="center" height="30">동이름으로 찾기
					<input type="text" name="dong" size="30">
					<input type="button" class="btn_nomal" name="" value=" 찾 기 " onclick="go_search();" />
				</td>
			</tr>
			<tr>
				<td height="5"></td>
			</tr>
			<tr>
				<td align="center"><font color="#000099">예) 수내동, 관양동, 무거동</font></td>
			</tr>
			<tr>
				<td height="5"></td>
			</tr>
			<tr>
				<td height="1" bgcolor="CCCCCC"></td>
			</tr>
			<tr>
				<td height="5"></td>
			</tr>
			<%
				if(postArray == null) {
					out.print("<tr><td height='30' style='padding-left:20px;'>동 이름을 입력하세요.</td></tr>");
				} else if (postArray.length ==0) {
					out.print("<tr><td height='30' style='padding-left:20px;'>없는 동이름 입니다.</td></tr>");
				}else {
					for(int i=0 ; i<postArray.length ; i++) {
						String zipcode = postArray[i][1];
						String sido = postArray[i][2];
						String gugun = postArray[i][3];
						String dong = postArray[i][4];
						String ri = postArray[i][5];
						String bldg = postArray[i][6];
						String st_bunji = postArray[i][7];
						String ed_bunji = postArray[i][8];
						
						String address = sido + " " + gugun;
						if (ri != null && !ri.equals("")) {
							address += " " + ri;
						}
						address += " " + dong;
						if (st_bunji != null && !st_bunji.equals("")) {
							address += " " + st_bunji;
						}
						if (ed_bunji != null && !ed_bunji.equals("")) {
							address += "-" + ed_bunji;
						}
						if (bldg != null && !bldg.equals("")) {
							address += " " + bldg;
						}
			%>
			<tr>
				<td style="padding:4px 6px 4px 20px;">
					<a href="javascript:set_address('<%=zipcode%>','<%=address%>');">
						<span class="text_blu">(<%=zipcode%>)&nbsp;<%=address%></span>
					</a>
				</td>
			</tr>
			<%		} %>
			<tr>
				<td height="10"></td>
			</tr>
			<%	} %>
		</table>
	</form>
	<%=function.getSimpleBoxBottom()%>
</body>
</html>
