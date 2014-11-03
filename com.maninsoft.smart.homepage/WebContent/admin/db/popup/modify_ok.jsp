<%@ page language="java" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
<%@ include file="/common/inc/config.jsp" %>
<%@ include file="/admin/include/check_admin.jsp" %>
<%@ page import="com.maninsoft.smart.homepage.request.*"%>
<%@ page import="com.maninsoft.smart.homepage.admin.db.popup.*" %>
<%
	String uploadDir = "/popup/";
	MRequest mReq = new MRequest(request);
	
	PopupManager popupmanager = PopupManager.getInstance();
	int checkCode = 0;
	checkCode = popupmanager.updatePopUp(mReq, DATA_ROOT, uploadDir);

	String strMessage = "";
	if (checkCode == 2) {
		strMessage = "이미지를 올려주세요!";
	} else if (checkCode == 3) {
		strMessage = "이미지를 올려주세요!";
	} else {
		strMessage = "수정되었습니다.";
	}
%>
<html>
<body>
	<form name="sForm" method="post" action="modify.jsp">
		<input type="hidden" name="chkSel" value="<%=mReq.getParameter("rec_id") %>"/>
	</form>
	<script type="text/javascript" language="javascript">
		alert("<%=strMessage%>");
		document.sForm.submit();
	</script>
</body>
</html>