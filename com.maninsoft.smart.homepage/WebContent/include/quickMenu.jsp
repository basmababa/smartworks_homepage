<%@ page language="java" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
<%@ page errorPage="/error/error_view.jsp" %>
<%@ include file="/common/inc/config.jsp" %>

<%-- 
<div id="quick_menu" style="width:72px;height:140px;_filter: progid:DXImageTransform.Microsoft.AlphaImageLoader(src='<%=IMG_ROOT %>/quickmenu.png',sizingMethod='scale');">&nbsp;</div>
<div id="quick_menu">
	<img class="png24" src="<%=IMG_ROOT%>/quickmenu.png" alt="">
</div>
--%>
<div id="quick_menu">
	<script type="text/javascript">
		var voEmbed = new setEmbed();
		voEmbed.init("flash", "<%=SWF_ROOT%>/quickmenu.swf", "74", "154");
		voEmbed.parameter("wmode", "transparent");
		voEmbed.show();
	</script>
</div>