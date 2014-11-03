<%@ page language="java" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
<%@ page errorPage="/error/error_view.jsp" %>
<%@ include file="/common/inc/config.jsp" %>
<%@ page import="com.maninsoft.smart.homepage.admin.db.popup.*" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Calendar" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%
	//활성화된 popup List
	ArrayList popArray = PopupManager.getInstance().getValidPopupList();
	
	Calendar calen = Calendar.getInstance();
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	String strCurDate = sdf.format(calen.getTime());
%>
	<script type="text/javascript">
		function dHtmlWnd_showPop(idName, left, top) {
			var divObj = document.getElementById(idName);
			divObj.style.visibility = "visible";
		}
	
		function dHtmlWnd_hidePop(idName){
			var divObj = document.getElementById(idName);
			divObj.style.visibility = "hidden";
		}
	
		function pop_close(idName, recId) {
			var divObj = document.getElementById(idName);
			var checkObj = document.getElementById("chkClose_"+recId);
			if(checkObj && checkObj.checked) {
				var todayDate = new Date();
				todayDate.setTime(todayDate.getTime() + (24*60*60*1000));
				// cookie setting
				setCookie("popup_" + recId, "<%=strCurDate%>", todayDate, "/");
				dHtmlWnd_hidePop(idName);
			} else {
				dHtmlWnd_hidePop(idName);
			}
		}
	</script>
<%
	if (popArray.size() > 0) {
		for (int i = 0; i < popArray.size(); i++) {
			PopupBean popup = new PopupBean();
			popup = (PopupBean) popArray.get(i);
	
			int intRecId = popup.getPopIdx();
			int intWidth = popup.getPopImgWidth();
			int intHeight = popup.getPopImgHeight();
			int intTop = popup.getPopPointTop();
			int intLeft = popup.getPopPointLeft();
			String popTitle = popup.getPopTitle();
			String imgName = popup.getPopImgName();
			String imgPath = ROOT_DIR + DATA_URL + popup.getPopImgPath();
			String linkUrl = popup.getPopLinkUrl();
			String strUseCookie = popup.getPopUseCookie();
	
			//check 할 쿠키이름
			String checkCookieName = "popup_" + intRecId;
			Cookie[] cookies = request.getCookies();
			int okPopup = 1;										//초기값은 OK POPUP
			if (cookies != null && cookies.length > 0) {			//쿠키가 있을경우
				for (int j = 0; j < cookies.length; j++ ) {			//루프들 돌면서 팝업여부판단.
					String strCookieName = "";
					String strCookieValue = "";
					strCookieName = cookies[j].getName();			//쿠키이름을 가져온다.
					strCookieValue = cookies[j].getValue();			//쿠키값(날짜)
					if (strCookieName.equals(checkCookieName)) {	//해당 팝업정보의 이름과 같은 쿠키가 있다.
						if (strCookieValue.equals(strCurDate)) {	//그 쿠키의 값(날짜)이 오늘 날짜이면(NO POPUP)
							okPopup = 0;
						} else {                                    //그 쿠키의 값(날짜)이 오늘 날짜가 아니면(OK POPUP)
							okPopup = 1;
						}
					} //if (strCookieName.equals(checkCookieName))
				} //for (int j=0 ; j < cookies.length; j++ ) {
			}//if (cookies != null && cookies.length > 0) {
	
			//팝업 이름에 해당하는 쿠키이름이  값이 오늘날짜가 아니면 팝업을 보여준다.
			if (okPopup == 1) {
%>		
				<div id="pop_div_<%=intRecId%>" style="position:absolute;left:<%=intLeft %>px;top:<%=intTop %>px;width:<%=intWidth %>px;height:<%=intHeight %>px;z-index:10;">
					<table width="100%" height="100%" border="0" cellspacing="0" cellpadding="0">
						<tr onmousedown="initializedrag('pop_div_<%=intRecId%>', event)" style="cursor:move">
							<td>
								<table width="100%" border="0" cellpadding="0" cellspacing="0">
									<tr>
										<td width="5" height="26"><img src="<%=IMG_ROOT%>/popup/pop_t_l.gif" width="5" height="26" alt=""></td>
										<td height="26" bgcolor="#e9e9e9" style="padding-left:2px;border-top:solid 1px #999999">
											<img src="<%=IMG_ROOT%>/icons/new.gif" align="middle" alt=""> <%= popTitle %>
										</td>
										<td width="11" height="26"><img src="<%=IMG_ROOT%>/popup/pop_t_r.gif" width="11" height="26" alt=""></td>
									</tr>
								</table>
							</td>
						</tr>
						<tr>
							<td>
								<table width="100%" border="0" cellpadding="0" cellspacing="0" bgcolor="#ffffff">
									<tr>
										<td colspan="2" align="center" style="border-left:1px solid #999999;border-right:1px solid #999999;">
											<% if (!linkUrl.equals("")) { %>
												<a href="http://<%=linkUrl%>" target="_blank">
													<img src="<%=imgPath%><%=imgName%>" alt="<%=linkUrl%>" border="0" align="middle" alt="">
												</a>
											<% } else { %>
												<img src="<%=imgPath%><%=imgName%>" align="middle" alt="">
											<% } %>
										</td>
									</tr>
								</table>
							</td>
						</tr>
						<tr>
							<td>
								<table width="100%" border="0" cellpadding="0" cellspacing="0">
									<tr>
										<td width="5" height="26"><img src="<%=IMG_ROOT%>/popup/pop_b_l.gif" width="5" height="26" alt=""></td>
										<% if (strUseCookie.equals("1")) {%>
										<td width="25" bgcolor="#e9e9e9" style="border-bottom:solid 1px #999999"><input type="checkbox" name="chkClose_<%=intRecId%>" id="chkClose_<%=intRecId%>"></td>
										<td height="26" bgcolor="#e9e9e9" style="border-bottom:solid 1px #999999">오늘하루 창 열지 않음 </td>
										<% } else { %>
										<td height="26" bgcolor="#e9e9e9" style="border-bottom:solid 1px #999999"></td>
										<% } %>
										<td align="right" width="51" bgcolor="#e9e9e9" style="border-bottom:solid 1px #999999"><a href="javascript:pop_close('pop_div_<%=intRecId%>','<%=intRecId%>');"><img src="<%=IMG_ROOT%>/popup/pop_close.gif" width="51" height="11" border="0" alt=""></a></td>
										<td width="11" height="26"><img src="<%=IMG_ROOT%>/popup/pop_b_r.gif" width="11" height="26" alt=""></td>
									</tr>
								</table>
							</td>
						</tr>
					</table>
				</div>
<%
			} //if (okPopup == 1) {
		} //for(int i=0 ; i<popArray.size() ; i++) {
	} //if (popArray.size() > 0) {
%>
