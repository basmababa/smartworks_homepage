<%@ page language="java" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
<%@ page errorPage="/error/error_view.jsp" %>
<%@ include file="/common/inc/config.jsp" %>
<%@ page import="com.maninsoft.smart.homepage.request.*" %>
<%@ page import="com.maninsoft.smart.homepage.bbs.master.*" %>
<%@ page import="com.maninsoft.smart.homepage.bbs.*" %>
<%@ page import="com.maninsoft.smart.homepage.util.ConvertText" %>
<%@ page import="java.util.ArrayList" %>
<%
	Request req = new Request(request);
	MasterManager masmanager = MasterManager.getInstance();
	BbsCommentManager cmtmanager = BbsCommentManager.getInstance();

	//ConvertText
	ConvertText convert = ConvertText.getInstance();

	String strBbsId = request.getParameter("bbsId");
	String MAS_BBS_ID = request.getParameter("masBbsId");
	
	String boardName = masmanager.getBoardName(MAS_BBS_ID);
	if (boardName == null || boardName.equals("")) {
		response.sendRedirect(ROOT_DIR);
	}
	
	String accessLevel = masmanager.getAccessLevel(MAS_BBS_ID, S_ID, S_LEVEL);
	
	//등록된 댓글리스트를 가져온다.
	ArrayList commentArray = cmtmanager.listComment(strBbsId, MAS_BBS_ID);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title><%=SITE_TITLE %></title>
<meta http-equiv="imagetoolbar" content="no">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link rel="stylesheet" type="text/css" href="<%=ROOT_DIR%>/common/css/common.css">
<link rel="stylesheet" type="text/css" href="<%=ROOT_DIR%>/common/css/bbs/board.css">
<script language="javascript" type="text/javascript" src="<%=ROOT_DIR%>/common/js/common.js"></script>
<script language="javascript" type="text/javascript" src="<%=ROOT_DIR%>/common/js/menu_action.js"></script>
<script language="javascript" type="text/javascript" src="<%=ROOT_DIR%>/common/js/bbs/board.js"></script>
<script language="javaScript" type="text/javascript">
	var rootDir = "<%=ROOT_DIR%>";
</script>
</head>
<body style="background-color:#f6f6f6;margin:0px;overflow:hidden;" onload="parentIframeSize('comment_list');">
	<table width="100%" border="0" cellspacing="0" cellpadding="0">
	<% if (commentArray.size() == 0) { %>
		<tr>
			<td height="35" align="center">
				등록된 덧글이 없습니다.
			</td>
		</tr>
	<%
		} else {
			for (int i = 0; i < commentArray.size(); i++) {
				BbsCommentBean comment = new BbsCommentBean();
				comment = (BbsCommentBean) commentArray.get(i);
				int cmtRecId = comment.getCmtIdx();
				String cmtUserId = comment.getCmtUsrId();
				String cmtUserName = comment.getCmtUsrName();
				String cmtContents =convert.convertStringText(comment.getCmtContents());

				String cmtWdate = comment.getCmtWdate().toString().substring(0, 16);
	%>
		<tr>
	<%
				if (i == 0) {
	%>
			<td height="35">
	<%
				} else {
	%>
			<td height="35" class="dot_Border_t">
	<%
				}
	%>
				<table width="100%" border="0" cellspacing="0" cellpadding="0">
					<tr>
						<td width="100" class="text_55_b" <%if (accessLevel.indexOf("S") > 0) { out.println("title = '" + cmtUserId + "'"); } %> valign="top" style="padding-top:5px;">
							<img src="<%=IMG_ROOT%>/bbs/icon_heart.gif" width="7" height="6" align="middle">
							<%=cmtUserName%>
						</td>
						<td class="text_75_12" style="padding-top:5px; padding-bottom:5px;">
							<%=cmtContents%>
							<span class="text_tahoma9">
								<%=cmtWdate%>&nbsp;
								<% if (accessLevel.indexOf("S") > 0 || (!S_ID.equals("") && S_ID.equals(cmtUserId))) { %>
									<a href="javascript:delete_comment('<%=cmtRecId%>');"><img src="<%=IMG_ROOT%>/bbs/delete.gif" width="6" height="5" align="middle" alt="삭제"></a>
								<% } else { %>
									<a href="javascript:cmt_delete_password_win('<%=cmtRecId%>');"><img src="<%=IMG_ROOT%>/bbs/delete.gif" width="6" height="5" align="middle" alt="삭제"></a>
								<% } %>
							</span>
						</td>
					</tr>
				</table>
			</td>
		</tr>
	<%
			}
		}
	%>
		<tr>
			<td height="15"></td>
		</tr>
		<tr>
			<td>
				<form name="bForm" method="post" action="">
					<input type="hidden" name="masBbsId" value="<%=MAS_BBS_ID%>">
					<input type="hidden" name="bbsId" value="<%=strBbsId%>">
					<input type="hidden" name="userId" value="<%=S_ID%>">
					<input type="hidden" name="commentId" value="">
					<input type="hidden" name="commentPass" value="">
					<table width="100%" border="0" cellspacing="0" cellpadding="0">
						<tr>
							<td>
								<table width="100%" border="0" cellspacing="0" cellpadding="0">
									<tr>
										<td height="22" align="left" class="text_99_b">덧글쓰기</td>
										<td width="150" align="left" class="text_75_11">작성자
										<% if (accessLevel.indexOf("S") > 0) {%>
											<input name="userName" type="text" size="15" value="<%=ADMIN_WRITER%>" class="bbs_input" style="width:100px;" >
										<% } else { %>
											<input name="userName" type="text" size="15" value="<%=S_NAME%>" class="bbs_input" style="width:100px;" >
										<% } %>
										</td>
										<td width="160" align="right" class="text_75_11">비밀번호
											<input name="userPass" type="password" size="15" maxlength="20" class="bbs_input" style="width:100px;" >
										</td>
									</tr>
								</table>
							</td>
							<td width="80"></td>
						</tr>
						<tr>
							<td class="comment_textarea_pd">
								<textarea name="comment" class="comment_textarea" id="textarea" cols="80" rows="3"></textarea>
							</td>
							<td align="right" valign="top"><img src="<%=IMG_ROOT%>/bbs/btn_replywrite.gif" width="74" height="40" onclick="add_comment();" style="cursor:pointer;" alt="등록" ></td>
						</tr>
					</table>
				</form>
			</td>
		</tr>
	</table>
</body>
</html>
