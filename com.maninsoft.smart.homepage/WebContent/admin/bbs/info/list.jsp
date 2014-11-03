<%@ page language="java" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
<%@ include file="/common/inc/config.jsp" %>
<%@ include file="/admin/include/check_admin.jsp" %>
<%@ page import="com.maninsoft.smart.homepage.admin.function.Function" %>
<%@ page import="com.maninsoft.smart.homepage.bbs.category.*" %>
<%@ page import="com.maninsoft.smart.homepage.bbs.master.*" %>
<%@ page import="com.maninsoft.smart.homepage.bbs.*" %>
<%@ page import="java.util.ArrayList" %>
<%
	Function function = Function.getInstance();
	ArrayList masterArray = MasterManager.getInstance().getGeneralList(0);
	CategoryManager categorymanager = CategoryManager.getInstance();
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
	<div id="conTents" style="position:relative">
		<table width="100%" cellSpacing="0" cellPadding="0" border="0" style="position:relative">
			<tr>
				<td width="50%" valign="top">
					<% if (masterArray.size() == 0) { %>
					<%=function.getTipBoxTop(ADMIN_IMG)%>
						등록된 게시판이 없습니다.
					<%=function.getTipBoxBottom()%>
					<% 
						} else {
							for (int i = 0; i < masterArray.size(); i++) {
								MasterBean master = new MasterBean();
								master = (MasterBean) masterArray.get(i);

								String strMasBbsId = master.getMasBbsId();
								String strBbsName = master.getMasBbsName();
								//String strKind = master.getMasKind();
								
								String catId = master.getCatId();
							    String catName = "미지정";
							    if (catId != null && !catId.equals("")) {
							    	catName = categorymanager.getCategoryName(catId);
							    }
								strBbsName += "(" + catName + ")";
					%>
     
								<%=function.getTitleBox(ADMIN_IMG, strBbsName)%>
								<table width="100%" cellSpacing="0" cellPadding="0" border="0" class="t_b_bottom">
									<tr>
										<td width="20%" class="t_th">날짜</td>
										<td width="60%" bgcolor="#FFFFFF" class="t_th">제목</td>
										<td width="20%" bgcolor="#FFFFFF" class="t_thLast">작성자</td>
									</tr>
									<%
										ArrayList boardArray = BbsManager.getInstance().getBoardList(strMasBbsId);
										if (boardArray.size() == 0) {
									%>
									<tr>
										<td width="100%" class="t_tdFirst" colspan="3">등록된 게시물이 없습니다.</td>
									</tr>
			       					<%
										} else {
											for (int j=0 ; j < boardArray.size() ; j++) {
												BbsBean board = new BbsBean();
												board = (BbsBean) boardArray.get(j);
			
												String strWdate = board.getBbsWdate().toString().substring(0,10);
												String strTitle = board.getBbsTitle();
												String strWriter = board.getBbsUsrName();
			       					%>
									<tr>
										<td width="20%" class="t_tdFirst"><%=strWdate %></td>
										<td width="60%" bgcolor="#FFFFFF" class="t_tdL">&nbsp;<%=strTitle %></td>
										<td width="20%" bgcolor="#FFFFFF" class="t_td"><%=strWriter %></td>
									</tr>
									<%
											}
										}
									%>
								</table>
								<div id="button">
									<span class="btn_sub">
										<img alt="" src="<%=IMG_ROOT%>/icons/btn_icon_apply.gif" align="absmiddle" />
										<a href="<%=ROOT_DIR%>/bbs/list.jsp?masBbsId=<%=strMasBbsId%>" target="_blank" onfocus="this.blur();">바로이동하기</a>
									</span>
								</div>
    				<%
							}
						}
    				%>
				</td>
			</tr>
		</table>
		<!--도움말 부분-->
		<%=function.getTipBoxTop(ADMIN_IMG)%>
			생성된 모든게시판의 목록을 볼수 있습니다.<br />
			<font color="blue">특정 목적으로 사용되는 게시판은 제외 됩니다.</font>
		<%=function.getTipBoxBottom()%>
	</div>
</body>
</html>
