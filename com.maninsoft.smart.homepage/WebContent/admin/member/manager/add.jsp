<%@ page language="java" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
<%@ include file="/common/inc/config.jsp" %>
<%@ include file="/admin/include/check_admin.jsp" %>
<%@ page import="com.maninsoft.smart.homepage.admin.function.Function" %>
<%
	Function function = Function.getInstance();
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

	function win_idCheck() {
		if(checkForm(document.wForm.id, "회원 ID")) return;
		if(!isValidLength(document.wForm.id, 4, 12, "회원 ID")) return;
		if(!isValidID(document.wForm.id, "회원 ID")) return;
		var windowBodyTop = window.screen.availHeight /2 - 150;
	  	var windowBodyLeft = window.screen.availWidth /2 - 200;
		window.open("id_check.jsp?userId=" + document.wForm.id.value ,"id_check", "width=420,height=192,top=" + windowBodyTop + ", left=" + windowBodyLeft);
	}

	function win_snoCheck() {
		var strRegNo1 = document.wForm.sno1.value;
		var strRegNo2 = document.wForm.sno2.value;
		if(checkForm(document.wForm.sno1, "주민등록번호")) return;
		if(checkForm(document.wForm.sno2, "주민등록번호")) return;
		if(isJuminNo(document.wForm.sno1, document.wForm.sno2)) {
		    var windowBodyTop = window.screen.availHeight /2 - 150;
		    var windowBodyLeft = window.screen.availWidth /2 - 200;
		    window.open("sno_check.jsp?sno1=" + strRegNo1 + "&sno2=" + strRegNo2, "snoCheck", "width=420,height=192,resizable=0,scrollbars=0,top="+windowBodyTop+", left="+windowBodyLeft);
		}
		return;
	}

	//아이디 체크리셋
	function reset_id() {
		document.wForm.id_flag.value = 0;           //체크 flag 0 초기화
		document.getElementById("id_check01").style.display = "none";
		document.getElementById("id_check02").style.display = "";
	}

	//sno 체크리셋
	function reset_sno() {
		document.wForm.sno_flag.value = 0;           //체크 flag 0 초기화
		document.getElementById("sno_check01").style.display = "none";
		document.getElementById("sno_check02").style.display = "";
	}


	function goSave() {
		if(checkForm(document.wForm.id, "회원 ID")) return;
		if(!isValidLength(document.wForm.id, 4, 12, "회원 ID")) return;
		if(!isValidID(document.wForm.id, "회원 ID")) return;
		if(checkForm(document.wForm.pass, "패스워드")) return;
		if(checkForm(document.wForm.pass_re, "패스워드 확인")) return;
		if(!isValidLength(document.wForm.pass, 4, 12, "패스워드")) return;
		if(checkForm(document.wForm.name, "이름")) return;
		//if(checkForm(document.wForm.sno1, "주민등록번호")) return;
		//if(checkForm(document.wForm.sno2, "주민등록번호")) return;
		//if(checkForm(document.wForm.tel, "전화번호")) return;
		//if(isNumber(document.wForm.tel, "전화번호")) return;
		//if(checkForm(document.wForm.hp, "핸드폰번호")) return;
		//if(isNumber(document.wForm.hp, "핸드폰번호")) return;
		if(checkForm(document.wForm.email, "이메일")) return;
		if(!isEMail(document.wForm.email, "이메일")) return;
		if(checkForm(document.wForm.zip1, "우편번호")) return;
		if(checkForm(document.wForm.zip2, "우편번호")) return;
		if(checkForm(document.wForm.address1, "주소")) return;

		if(document.wForm.pass.value != document.wForm.pass_re.value) {
			alert("패스워드가 일치하지 않습니다.");
			return;
		}

		if(document.wForm.id_flag.value == 0) {
			alert("회원 ID 중복확인이 필요합니다.");
			return;
		}

		//if(document.wForm.sno_flag.value == 0) {
		//	alert("주민번호 중복확인이 필요합니다.");
		//	return;
		//}

		document.wForm.submit();
	}

	function goCancel() {
		document.sForm.action = "list.jsp";
		document.sForm.submit();
	}

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
		<form name="wForm" method="post" action="add_ok.jsp">
			<input type="hidden" name="id_flag" value="0">
			<input type="hidden" name="sno_flag" value="0">
			<%=function.getTitleBox(ADMIN_IMG, "회원 등록")%>
			<table width="100%" border="0" cellpadding="0" cellspacing="0" class="t_b_bottom">
				<tr>
					<td width="15%" class="t_thC">회원 ID</td>
					<td width="85%" class="t_tdL">
						<input class="input" name="id" type="text" value="" size="15" onChange="javascript:reset_id();">
						<span id="id_check01" style="display:none">
							<img alt="" src="<%=IMG_ROOT%>/icons/btn_icon_ok.gif" align="middle"/>
						</span>
						<span id="id_check02">
							<input type="button" class="btn_nomal" name="" value=" ID 체크 " onClick="javascript:win_idCheck();" />
						</span>
					</td>
				</tr>
				<tr>
					<td width="15%" class="t_thC">비밀번호</td>
					<td width="35%" class="t_tdL"><input class="input" name="pass" type="password" value="" size="15"></td>
				</tr>
				<tr>
					<td width="15%" class="t_thC">비밀번호확인</td>
					<td width="35%" class="t_tdL"><input class="input" name="pass_re" type="password" value="" size="15"></td>
				</tr>
				<tr>
					<td width="15%" class="t_thC">이름</td>
					<td width="35%" class="t_tdL"><input class="input" name="name" type="text" value="" size="20"></td>
				</tr>
				<tr>
					<td width="15%" class="t_thC">주민등록번호</td>
					<td width="35%" class="t_tdL">
						<input class="input" name="sno1" type="text" value="" size="6" maxlength="6" onChange="javascript:reset_sno();">
						-
						<input class="input" name="sno2" type="password" value="" size="13" maxlength="7" onChange="javascript:reset_sno();">
						<span id="sno_check01" style="display:none">
							<img alt="" src="<%=IMG_ROOT%>/icons/btn_icon_ok.gif" align="middle"/>
	  					</span>
						<span id="sno_check02">
							<input type="button" class="btn_nomal" name="" value=" 주민번호 체크 " onClick="javascript:win_snoCheck();" />
						</span>
					</td>
				</tr>
				<tr>
					<td width="15%" class="t_thC">전화번호</td>
					<td width="35%" class="t_tdL"><input class="input" name="tel" type="text" value="" size="20"></td>
				</tr>
				<tr>
					<td width="15%" class="t_thC">휴대폰번호</td>
					<td width="35%" class="t_tdL"><input class="input" name="hp" type="text" value="" size="20"></td>
				</tr>
				<tr>
					<td width="15%" class="t_thC">이메일</td>
					<td width="35%" class="t_tdL"><input class="input" name="email" type="text" value="" size="40"></td>
				</tr>
				<tr>
				<td width="15%" class="t_thC">주소</td>
				<td class="t_tdL">
					<input class="input" name="zip1" type="text" value="" size="6"  maxlength="3">
					-
					<input class="input" name="zip2" type="text" value="" size="6"  maxlength="3">
					<input type="button" class="btn_nomal" name="" value=" 우편번호 " onClick="javascript:win_post_search('wForm', 'zip1', 'zip2', 'address1', 'address2');" />
					<br> <input class="input" name="address1" type="text" value="" size="80"  maxlength="100">
					<br> <input class="input" name="address2" type="text" value="" size="80"  maxlength="100">
				</td>
			</tr>
		</table>
	
	
		<div id="button">
			<span class="btn_sub" onclick="javascript:goSave();"><img alt="" src="<%=IMG_ROOT%>/icons/btn_icon_ok.gif" /><a onfocus="this.blur();">추 가</a></span>
			<span class="btn_sub" onclick="javascript:goCancel();"><img alt="" src="<%=IMG_ROOT%>/icons/btn_icon_cancel.gif" /><a onfocus="this.blur();">취  소</a></span>
		</div>
	
		<!--도움말 부분-->
		<%=function.getTipBoxTop(ADMIN_IMG)%>
			사용자를 등록합니다.
		<%=function.getTipBoxBottom()%>
		</form>
		<form name="sForm" method="post" action=""></form>
	</div>
</body>
</html>
