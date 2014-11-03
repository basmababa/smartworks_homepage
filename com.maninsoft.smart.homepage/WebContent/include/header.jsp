<%@ page language="java" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
<%@ include file="/common/inc/config.jsp" %>

<div id="header_wrap">
	<div id="header_logo">
		<%--<a href="javascript:go_home();"><img src="<%=IMG_ROOT%>/logo_subsmartworks.jpg" width="172" height="80" border="0" alt="smartworks.net logo image"></a>--%>
		<script type="text/javascript">
			var voEmbed = new setEmbed();
			voEmbed.init("flash", "<%=SWF_ROOT%>/top_logo.swf", "171", "80");
			voEmbed.parameter("wmode", "transparent");
			voEmbed.show();
		</script>
	</div>
	<div id="header_menu">
		<div id="header_top_menu">
			<a href="<%=APPSTORE_URL%>" target="_blank"><img src="<%=IMG_ROOT %>/gl_menu01.gif" alt="앱스토어"></a>
			<%-- 
			<span class="txblue">
				<a href="<%=APPSTORE_URL%>" target="_blank">앱스토어</a>
				| <strong>MY</strong>스마트웍스닷넷 
			</span>
			--%>
		</div>
		<div id="header_main_menu_area">
			<div id="header_main_menu">
				<!-- top menu-->
				<div id="header_flash_menu">
					<script type="text/javascript">
						var voEmbed = new setEmbed();
						voEmbed.init("flash", "<%=SWF_ROOT%>/top_menu.swf", "598", "80");
						voEmbed.parameter("wmode", "transparent");
						voEmbed.show();
					</script>
				</div>
			</div>
			<div id="header_search_area">
				<form name="appstoreSearchForm" method="post" action="<%=APPSTORE_URL %>/" target="_blank">
					<fieldset>
						<legend>Appstore Search</legend>
						<div id="header_search_field"><input type="text" id="search" name="search" class="search" onkeyup="if (event.keyCode==13) { appstore_search(); }"></div>
						<div id="header_search_button"><img src="<%=IMG_ROOT%>/btn_search.jpg" width="18" height="20" alt="search button" onclick="appstore_search();" style="cursor:pointer;"></div>
					</fieldset>
				</form>
			</div>
		</div>
	</div>
</div>
	