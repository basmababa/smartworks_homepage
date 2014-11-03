<%@ page language="java" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
<%@ include file="/common/inc/config.jsp" %>
<%@ include file="/admin/include/check_admin.jsp" %>
<%@ page import="com.maninsoft.smart.homepage.request.*" %>
<%@ page import="com.maninsoft.smart.homepage.admin.db.popup.*" %>
<%
  Request req = new Request(request);

  PopupBean popup = new PopupBean();
  PopupManager popmanager = PopupManager.getInstance();

  popup = popmanager.getPopup(req);

  String popTitle = popup.getPopTitle();
  String imgName = popup.getPopImgName();
  String imgPath = ROOT_DIR + DATA_URL + popup.getPopImgPath();
  String linkUrl = popup.getPopLinkUrl();

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
	
</script>
</head>
<body>
	<table width="100%" border="0" cellpadding="0" cellspacing="0">
		<tr>
			<td colspan="2" align="center">
				<% if(!linkUrl.equals("")){ %>
					<a href="http://<%=linkUrl%>" target="_blank"><img src="<%=imgPath%><%=imgName%>" alt="<%=linkUrl%>" border="0"/></a>
	            <% }else{ %>
					<img src="<%=imgPath%><%=imgName%>" />
	            <% } %>
	          </td>
		</tr>
		<tr bgcolor="#DDDDDD" height="26">
			<td width="80%" align="center" valign="middle">
				<font color="#333333">오늘만 이 창을 열지 않음</font>
				<input type="checkbox" name="chkClose" checked="checked">
			</td>
			<td width="20%" valign="middle">
				<a href="javascript:self.close();">[ 닫기 ]</a>
			</td>
		</tr>
	</table>
</body>
</html>
