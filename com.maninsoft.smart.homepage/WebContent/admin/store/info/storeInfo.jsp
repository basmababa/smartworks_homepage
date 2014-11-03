<%@ page language="java" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
<%@ include file="/common/inc/config.jsp" %>
<%@ include file="/admin/include/check_admin.jsp" %>
<%@ page import="com.maninsoft.smart.homepage.admin.function.Function" %>
<%@ page import="com.maninsoft.smart.homepage.admin.store.info.*" %>
<%
	Function function = Function.getInstance();
	StoreInfoManager storemanager = StoreInfoManager.getInstance();
	StoreInfoBean store = new StoreInfoBean();
	
	//사이트 정보
	store = storemanager.getStoreInfo();
	String storeIdx = store.getStoreIdx();
	String storeAlias = store.getStoreAlias();
	String storeNum = store.getStoreNum();
	String storeName = store.getStoreName();
	String storeBoss = store.getStoreBoss();
	String storeAddr = store.getStoreAddr();
	String storeZip = store.getStoreZip();
	String storeBusiness = store.getStoreBusiness();
	String storeItem = store.getStoreItem();
	String telOffice = store.getTelOffice();
	String telFax = store.getTelFax();
	String telFaq = store.getTelFaq();
	String telAs = store.getTelAs();
	String tel080 = store.getTel080();
	String telDeliver = store.getTelDeliver();

	if (storeIdx == null) { storeIdx = ""; }
	if (storeAlias == null) { storeAlias = ""; }
	if (storeNum == null) { storeNum = ""; }
	if (storeName == null) { storeName = ""; }
	if (storeBoss == null) { storeBoss = ""; }
	if (storeAddr == null) { storeAddr = ""; }
	if (storeZip == null) { storeZip = ""; }
	if (storeBusiness == null) { storeBusiness = ""; }
	if (storeItem == null) { storeItem = ""; }
	if (telOffice == null) { telOffice = ""; }
	if (telFax == null) { telFax = ""; }
	if (telFaq == null) { telFaq = ""; }
	if (telAs == null) { telAs = ""; }
	if (tel080 == null) { tel080 = ""; }
	if (telDeliver == null) { telDeliver = ""; }

	String strZip1 = "";
	String strZip2 = "";
	if (!storeZip.equals("")) {
		String[] arrZip = storeZip.split("-");
		strZip1 = arrZip[0];
		strZip2 = arrZip[1];
	}

%>
<html>
<head>
<title>
<%= SITE_TITLE_ADMIN %>
</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link href="<%=ROOT_DIR%>/common/css/admin/common.css" rel="stylesheet" type="text/css">
<script language="javascript" type="text/javascript" src="<%=ROOT_DIR%>/common/js/common.js"></script>
<script language="javascript" type="text/javascript">
	function goSave() {
		if(checkForm(wForm.store_alias, "사이트명")) return;
		if(checkForm(wForm.store_num, "사업자등록번호")) return;
		if(checkForm(wForm.store_name, "상호")) return;
		if(checkForm(wForm.store_boss, "대표자")) return;
		if(checkForm(wForm.zip1, "우편번호")) return;
		if(checkForm(wForm.zip2, "우편번호")) return;
		if(checkForm(wForm.address1, "사업장 주소")) return;
	
		document.wForm.action = "<%=ADMIN_ROOT%>/store/info/storeInfo_save_ok.jsp";
		document.wForm.submit();
	}
	
	/**
	 * 우편번호 등록
	 */
	function win_post_search(openerForm, z1, z2, ad1, ad2) {
		var windowBodyTop = window.screen.availHeight/2 - 150;
		var windowBodyLeft = window.screen.availWidth/2 - 210;
		tmp_url = "<%=ADMIN_ROOT%>/include/post_search.jsp?openerForm=" + openerForm + "&zip1=" + z1 + "&zip2=" + z2 + "&address1=" + ad1 + "&address2=" + ad2;
		window.open(tmp_url, "post", "width=420,height=192,scrollbars=yes,top=" + windowBodyTop + ", left=" + windowBodyLeft);
	}
</script>
</head>
<body>
	<div id="conTents">
	    <form name="wForm" method="post">
	    	<input type="hidden" name="store_idx" value="<%=storeIdx%>">
			<%=function.getTitleBox(ADMIN_IMG, "사이트정보")%>
			<table width="100%" border="0" cellpadding="0" cellspacing="0" class="t_b_bottom">
				<tr>
					<td width="15%" class="t_thC">사이트명</td>
					<td width="35%" class="t_tdL"> <input class="input" name="store_alias" type="text" value="<%=storeAlias%>" size="40"></td>
					<td width="15%" class="t_thC">사업자등록번호</td>
					<td width="35%" class="t_tdL"><input class="input" name="store_num" type="text" value="<%=storeNum%>" size="40"></td>
				</tr>
				<tr>
					<td width="15%" class="t_thC">상호</td>
					<td width="35%" class="t_tdL"><input class="input" name="store_name" type="text" value="<%=storeName%>" size="40"></td>
					<td width="15%" class="t_thC">대표자</td>
					<td width="35%" class="t_tdL"><input class="input" name="store_boss" type="text" value="<%=storeBoss%>" size="40"></td>
				</tr>
				<tr>
					<td width="15%" class="t_thC">사업장 주소</td>
					<td colspan="3" class="t_tdL">
						<input class="input" name="zip1" type="text" value="<%=strZip1%>" size="6"  maxlength="3">
						-
						<input class="input" name="zip2" type="text" value="<%=strZip2%>" size="6"  maxlength="3">
						<input type="button" class="btn_nomal" name="" value=" 우편번호 " onClick="javascript:win_post_search('wForm', 'zip1', 'zip2', 'address1', 'address2');" />
						<br> <input class="input" name="address1" type="text" value="<%=storeAddr%>" size="80"  maxlength="100">
						<br> <input class="input" name="address2" type="text" value="" size="80"  maxlength="100">
					</td>
				</tr>
				<tr>
					<td width="15%" height="24" class="t_thC">업태</td>
					<td width="35%" class="t_tdL"><input class="input" name="store_business" type="text" value="<%=storeBusiness%>" size="40"></td>
					<td width="15%" class="t_thC">종목</td>
					<td width="35%" class="t_tdL"><input class="input" name="store_item" type="text" value="<%=storeItem%>" size="40"></td>
				</tr>
			</table>
			
			<%=function.getTitleBox(ADMIN_IMG, "전화번호")%>
			<table width="100%" border="0" cellpadding="0" cellspacing="0" class="t_b_bottom">
				<tr>
					<td width="15%" class="t_thC">사무실</td>
					<td width="35%" class="t_tdL"><input class="input" name="tel_office" type="text" value="<%=telOffice%>" size="40" maxlength="14"></td>
					<td width="15%" class="t_thC">팩스</td>
					<td width="35%" class="t_tdL"><input class="input" name="tel_fax" type="text" value="<%=telFax%>" size="40" maxlength="14"></td>
				</tr>
				<tr>
					<td width="15%" class="t_thC">일반문의</td>
					<td width="35%" class="t_tdL"><input class="input" name="tel_faq" type="text" value="<%=telFaq%>" size="40" maxlength="14"></td>
					<td width="15%" class="t_thC">배송문의</td>
					<td width="35%" class="t_tdL"><input class="input" name="tel_deliver" type="text" value="<%=telDeliver%>" size="40" maxlength="14"></td>
				</tr>
				<tr>
					<td width="15%" class="t_thC">A/S전화</td>
					<td width="35%" class="t_tdL"><input class="input" name="tel_as" type="text" value="<%=telAs%>" size="40" maxlength="14">
					</td>
					<td width="15%" class="t_thC">080 무료 전화</td>
					<td width="35%" class="t_tdL"><input class="input" name="tel_080" type="text" value="<%=tel080%>" size="40" maxlength="14"></td>
				</tr>
			</table>
			<div id="button">
				사이트의 정보를 변경합니다.
				<span class="btn_sub" onclick="javascript:goSave();">
					<img alt="modify" src="<%=IMG_ROOT%>/icons/btn_icon_ok.gif" /><a onfocus="this.blur();">수 정</a>
				</span>
			</div>
			<!--도움말 부분-->
			<%=function.getTipBoxTop(ADMIN_IMG)%>
			사이트의 정보를 수정할 수 있습니다.
			<%=function.getTipBoxBottom()%>
		</form>
	</div>
</body>
</html>