<%@ page language="java" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
<%@ page errorPage="/error/error_view.jsp" %>
<%@ include file="/common/inc/config.jsp" %>
<%@ include file="/admin/include/check_admin.jsp" %>
<%@ page import="com.maninsoft.smart.homepage.admin.function.Function" %>
<%@ page import="com.maninsoft.smart.homepage.bbs.category.*" %>
<%@ page import="com.maninsoft.smart.homepage.bbs.master.*" %>
<%@ page import="java.util.ArrayList" %>
<%
	Function function = Function.getInstance();
	ArrayList materArray = MasterManager.getInstance().getBoardList();
	CategoryManager categorymanager = CategoryManager.getInstance();

	int totalCount = 0;
	totalCount = materArray.size();
%>
<html>
<head>
<title>
<%=SITE_TITLE_ADMIN %>
</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link href="<%=ROOT_DIR%>/common/css/admin/common.css" rel="stylesheet" type="text/css">
<script language="javascript" type="text/javascript" src="<%=ROOT_DIR%>/common/js/common.js"></script>
<script language="javascript" type="text/javascript" src="<%=ROOT_DIR%>/common/js/ajax/ajax_event.js"></script>
<script language="javascript" type="text/javascript">

	function goAdd() {
		document.LForm.action = "add.jsp";
		document.LForm.submit();
	}
	
	function goActive() {
		if(confirm("게시판의 상태를 변경합니다.")) {
			document.LForm.action = "active_ok.jsp";
			document.LForm.submit();
		}
	}

	function goExecute(cmd) {
		switch (parseInt(cmd)) {
			case 1:		
				LForm.action = "modify.jsp";
				break;
			case 2:		
				if (confirm("정말 삭제하시겠습니까?\n\n삭제시 시스템이 제대로 운영되지 않을수도 있습니다. (삭제권장안함)")) {
					document.LForm.action = "delete_ok.jsp";
				}
	      		break;
			default:	// 기능오류
				alert( "기능코드 선택 오류" );
				break;
		}
		document.LForm.submit();
	}

	function DHtmlWnd_showWindow(ev, idName, left, top) {
		if (document.getElementById(idName)) {
			document.getElementById(idName).style.left = ajax.Event.getMouseXY(ev).x + document.body.scrollLeft + left;
			document.getElementById(idName).style.top = ajax.Event.getMouseXY(ev).y + document.body.scrollTop + top;
			document.getElementById(idName).style.visibility = "visible";
		}
	}

	function DHtmlWnd_hideWindow(idName){
		document.getElementById(idName).style.visibility = "hidden";
	}
	
</script>
</head>
<body>
	<div id="conTents">
		<form name="LForm" method="post">
			<%=function.getTitleBox(ADMIN_IMG, "게시판관리 (" + totalCount + ")")%>
			<table width="100%" cellSpacing="0" cellPadding="0" border="0" class="t_b_bottom">
				<tr class="cellgc" height="25">
					<th class="t_th">선택</th>
					<th class="t_th">카테고리</th>
					<th class="t_th">종류</th>
					<th class="t_th">게시판ID</th>
					<th class="t_th">게시판이름</th>
					<th class="t_th">전용관리자</th>
					<th class="t_th">권한설정 [access]-[view]-[write]</th>
					<th class="t_th">기능(f-c-r-m)</th>
					<th class="t_th">상태</th>
					<th class="t_thLast">변경</th>
				</tr>
				<%
					if (materArray.size() == 0) {
				%>
				<tr>
					<td class="t_tdFirst" colSpan="10" height="200">
						<img src="<%=ADMIN_IMG%>/title_empty_result.gif" width="332" height="81">
					</td>
				</tr>
				<%
					} else {
						for(int i=0 ; i<materArray.size() ; i++) {
							MasterBean master = new MasterBean();
						    master = (MasterBean) materArray.get(i);

						    //output String Setting
						    int intRecId = master.getMasIdx();
						    String strBbsId = master.getMasBbsId();
						    String strBbsName = master.getMasBbsName();
						    String strBbsAdmin = master.getMasAdminId();
						    String strAccess = master.getMasAccess();
						    String strView = master.getMasView();
						    String strWrite = master.getMasWrite();
						    String strAttach = master.getMasAttach();
						    String strComment = master.getMasComment();
						    String strReply = master.getMasReply();
						    String strMail = master.getMasMail();

						    String kind = master.getMasKind();
						    String strKind = "";
						    if (kind.equals("1")) {
						      strKind = "게시판";
						    } else if(kind.equals("2")) {
						      strKind = "갤러리";
						    } else {
						      strKind = "특정";
						    }

						    String status = master.getMasStatus();
						    String strStatus = "";
						    String checked = "";
						    if (status.equals("0")) {
						      strStatus = "<font color='#ff0000'>사용안함</font>";
						    } else if(status.equals("1")) {
						      strStatus = "<font color='#0000ff'>사용중</font>";
						      checked = "checked='checked'";
						    }

						    String strLimit = "[" + strAccess + "]-[" + strView + "]-[" + strWrite + "]";
						    String strConfig = strAttach + "-" + strComment + "-" + strReply + "-" + strMail;

						    String catId = master.getCatId();
						    String catName = "미지정";
						    if (catId != null && !catId.equals("")) {
						    	catName = categorymanager.getCategoryName(catId);
						    }
				%>
				<tr>
					<td class="t_tdFirst">
						<input type="radio" name="chkSel" id="chkSel" value="<%=intRecId%>" onclick="DHtmlWnd_showWindow(event, 'idControlMenu', 0, 0)">
					</td>
					<td class="t_td"><%=catName %></td>
					<td class="t_td"><b><%=strKind %></b></td>
					<td class="t_td"><%=strBbsId %></td>
					<td class="t_td"><%=strBbsName %></td>
					<td class="t_td"><%=strBbsAdmin %></td>
					<td class="t_td"><%=strLimit %></td>
					<td class="t_td"><%=strConfig %></td>
					<td class="t_td"><%=strStatus %></td>
					<td class="t_td"><input type="checkbox" name="chkActive" value="<%=intRecId %>" <%=checked %>></td>
				</tr>
				<%
						}
					}
				%>
			</table>

			<div id="button">
			  <span class="btn_sub" onclick="javascript:goAdd();"><img alt="" src="<%=IMG_ROOT%>/icons/btn_icon_add2.gif" /><a onfocus="this.blur();">추가</a></span>
			  <span class="btn_sub" onclick="javascript:goActive();"><img alt="" src="<%=IMG_ROOT%>/icons/btn_icon_ok.gif" /><a onfocus="this.blur();">적용</a></span>
			</div>

			<!--도움말 부분-->
			<%=function.getTipBoxTop(ADMIN_IMG)%>
				게시판 종류는 일반게시판, 갤러리 게시판, 특정 게시판으로 나눠집니다.<br>
				<font color="red">특정 게시판은 삭제하면 시스템상에 문제가 발생할수 있습니다.</font><br>
			<%=function.getTipBoxBottom()%>

			<!-- 팝업메뉴 -->
			<div id="idControlMenu" style="padding:0px;visibility:hidden;width:180px;position:absolute;background-color:#d9d9d9">
				<table border="0" width="100%" cellSpacing="0" cellPadding="0">
					<tr>
						<td colspan="2" height="3"></td>
					</tr>
					<tr bgcolor="#eeeeee" height="22">
						<td valign="middle">&nbsp;&nbsp;<b>게시판관리정보</b></td>
						<td align="right">
							<a onclick="DHtmlWnd_hideWindow('idControlMenu'); return false;" href="javascript:DHtmlWnd_hideWindow('idControlMenu');">
								[닫기]
							</a>&nbsp;
						</td>
					</tr>
					<tr>
						<td colspan="2">
							<table border="0" width="100%" cellSpacing="1" cellPadding="1" bgcolor="#eeeeee">
								<tr>
									<td bgcolor="#ffffff" height="18">&nbsp;&nbsp;<a href="javascript:goExecute( 1 );">게시판정보수정</a></td>
								</tr>
								<tr>
									<td bgcolor="#ffffff" height="18">&nbsp;&nbsp;<a href="javascript:goExecute( 2 );">게시판삭제(권장안함)</a></td>
								</tr>
								<tr>
									<td align="right">
										<a href="javascript:DHtmlWnd_hideWindow('idControlMenu');">
											[닫기]
										</a>&nbsp;
									</td>
								</tr>
							</table>
						</td>
					</tr>
					<tr>
						<td colspan="2" height="3"></td>
					</tr>
				</table>
			</div>
			<!-- 팝업메뉴 끝-->
		</form>
	</div>
</body>
</html>
