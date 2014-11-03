<%@ page language="java" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
<%@ include file="/common/inc/config.jsp" %>
<%@ page import="com.maninsoft.smart.homepage.request.*" %>
<%@ page import="com.maninsoft.smart.homepage.bbs.master.*" %>
<%@ page import="com.maninsoft.smart.homepage.bbs.attach.*" %>
<%
	Request req = new Request(request);

	MasterManager masmanager = MasterManager.getInstance();
	AttachManager filemanager = AttachManager.getInstance();
	AttachBean attach = new AttachBean();
	
	//MAS_BBS_ID parameter
	String MAS_BBS_ID = req.getString("masBbsId");
	
	String boardName = masmanager.getBoardName(MAS_BBS_ID);
	if (boardName == null || boardName.equals("")) {
		response.sendRedirect(ROOT_DIR);
	}

	String accessLevel = masmanager.getAccessLevel(MAS_BBS_ID, S_ID, S_LEVEL);
	String boardConfig = masmanager.getConfig(MAS_BBS_ID);

	//접근권한 체크(View 페이지)
	if (accessLevel.indexOf("V") < 0) {
  		response.sendRedirect(ROOT_DIR);
	}
	
	String potoId = req.getString("photoId");
	//이미지 정보
	attach = filemanager.getImgInfo(potoId);
	String strImgPath = ROOT_DIR + DATA_URL + attach.getAchFilePath();
	String strImgName = attach.getAchFileName();

%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>
<%=SITE_TITLE_ADMIN %>
</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link href="<%=ROOT_DIR%>/common/css/common.css" rel="stylesheet" type="text/css">
<script language="javascript" type="text/javascript" src="<%=ROOT_DIR%>/common/js/common.js"></script>
<script language="javascript" type="text/javascript">
	
</script>
</head>
<body bgcolor="#ffffff" style="margin:0px">
	<table border="0" cellspacing="0" cellpadding="0" bgcolor="#ffffff" style="z-index:200">
		<tr>
			<td valign="top" class="grayBoder">
				<table width="100%"height="100%" border="0" cellspacing="0" cellpadding="0">
					<tr>
						<td width="100%" height="30" bgcolor="#f2f2f2">
							<table width="100%" border="0" cellspacing="0" cellpadding="0">
								<tr>
									<td height="7"></td>
								</tr>
								<tr>
									<td onmousedown="initializedrag('dialoglayer', event)" style="cursor:move">
										<span style="padding-left:15px;font-weight:bold">
											<img src="<%=IMG_ROOT%>/bbs/icon_title_arrow.gif" align="top">
											Photo View
										</span>
									</td>
									<td width="30"><img src="<%=IMG_ROOT%>/bbs/btn_close.gif" onclick="voPopupCtrl.dialog_close();" style="cursor:pointer"></td>
								</tr>
							</table>
						</td>
					</tr>
					<tr>
						<td width="100%" height="100%" bgcolor="#F2F2F2" style="padding:0px;">
							<table width="100%" height="100%" border="0" cellspacing="0" cellpadding="0">
								<tr>
									<td bgcolor="#FFFFFF" class="grayBoder" style="padding:8px;">
										<img src="<%=strImgPath%><%=strImgName%>" align="top" align="middle">
									</td>
								</tr>
							</table>
						</td>
					</tr>
				</table>
			</td>
		</tr>
	</table>
</body>
</html>
