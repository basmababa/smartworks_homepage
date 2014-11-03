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
	checkCode = popupmanager.insertPopUp(mReq, DATA_ROOT, uploadDir);

	String strMessage = "";
	String strUrl = "";
	if (checkCode == 1) {
		strMessage = "이미지를 올려주세요!";
		strUrl = "add.jsp";
	} else if (checkCode == 2) {
		strMessage = "이미지를 올려주세요!";
		strUrl = "add.jsp";
	} else if (checkCode == 3) {
		strMessage = "이미지를 올려주세요!";
		strUrl = "add.jsp";
	} else {
		strMessage = "등록되었습니다.";
		strUrl = "list.jsp";
	}
%>
<html>
<body>
	<script type="text/javascript">
		alert("<%=strMessage%>");
		location.href = "<%=strUrl%>";
	</script>
</body>
</html>


