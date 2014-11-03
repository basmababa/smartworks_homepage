<%@page language="java" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
<%@include file="/common/inc/config.jsp"%>
<div id="dhtmltooltip"></div>
<script type="text/javascript" src="<%=ROOT_DIR%>/common/js/tooltip/tooltip.js"></script>
<div id="dialogbackgroundlayer" style="display:none;position:absolute;z-index:21;cursor:pointer" onclick="voPopupCtrl.dialog_close();"></div>
<div id="dialoglayer" style="display:none;position:absolute;z-index:22;"></div>
<div id="message" style="display:none;position:absolute;left:0px;top:0px;padding:3px 5px 0px 5px;background:#569fc7;color:#ffffff;font-size:12px;font-weight:bold;z-index:100;"></div>
<script type="text/javascript" src="<%=ROOT_DIR%>/common/js/floater/floater.js"></script>
<script type="text/javascript" src="<%=ROOT_DIR%>/common/js/popup/div_popup.js"></script>
<script type="text/javascript" src="<%=ROOT_DIR%>/common/js/drag/drag.js"></script>
<script type="text/javascript">
	var rootDir = "<%=ROOT_DIR%>";
	var voPopupCtrl;
	function startPopup() {
		voPopupCtrl = new PopupUtil();
		voPopupCtrl.init();		
	}
	function esc_close(e){
		var ev = window.event ? window.event : e;
		var nKey = ev.keyCode;
		if(nKey == 27){
			voPopupCtrl.dialog_close();
		}
	}
	//function startFloater() {	
	//	var voFloaterCtrl = new FloaterUtil("quick_menu", 0);
	//	voFloaterCtrl.init();
	//}
	document.onkeydown = esc_close;
	
	window.onload = function() {
		startPopup();
		//startFloater();
	};
</script>