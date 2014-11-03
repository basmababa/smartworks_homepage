function go_home() {
	top.location.href = rootDir;
}
/**
 * 메인
 */
function main_page() {
	include_ajax("subMenu", rootDir + "/admin/store/sub_menu.jsp", true, false);
	include_ajax("info", rootDir + "/admin/store/info/sub_info.jsp", true, false);
	contentsFrame.location.href = rootDir + "/admin/store/info/storeInfo.jsp";
}

//var strStatus = "block";
/**
 * 사이트관리
 */
function menu01_sub01() {
	//var strStatus = status_submenu();
	include_ajax("subMenu", rootDir + "/admin/store/sub_menu.jsp", true, false);
	include_ajax("info", rootDir + "/admin/store/info/sub_info.jsp", true, false);
	contentsFrame.location.href = rootDir + "/admin/store/info/storeInfo.jsp";
	//submenu_hide(strStatus);
}
function menu01_sub02() {
	//var strStatus = status_submenu();
	include_ajax("subMenu", rootDir + "/admin/store/sub_menu.jsp", true, false);
	include_ajax("info", rootDir + "/admin/store/master/sub_info.jsp", true, false);
	contentsFrame.location.href = rootDir + "/admin/store/master/masterInfo.jsp";
	//submenu_hide(strStatus);
}

/**
 * 회원관리
 */
function menu02_sub01() {
	//var strStatus = status_submenu();
	include_ajax("subMenu", rootDir + "/admin/member/sub_menu.jsp", true, false);
	include_ajax("info", rootDir + "/admin/member/level/sub_info.jsp", true, false);
	contentsFrame.location.href = rootDir + "/admin/member/level/list.jsp";
	//submenu_hide(strStatus);
}
function menu02_sub02() {
	//var strStatus = status_submenu();
	include_ajax("subMenu", rootDir + "/admin/member/sub_menu.jsp", true, false);
	include_ajax("info", rootDir + "/admin/member/manager/sub_info.jsp", true, false);
	contentsFrame.location.href = rootDir + "/admin/member/manager/list.jsp";
	//submenu_hide(strStatus);
}
function menu02_sub03() {
	//var strStatus = status_submenu();
	include_ajax("subMenu", rootDir + "/admin/member/sub_menu.jsp", true, false);
	include_ajax("info", rootDir + "/admin/member/mail/sub_info.jsp", true, false);
	contentsFrame.location.href = rootDir + "/admin/member/mail/send_mail.jsp";
	//submenu_hide(strStatus);
}
function send_mail(psMailTo) {
	//var strStatus = status_submenu();
	include_ajax("subMenu", rootDir + "/admin/member/sub_menu.jsp", true, false);
	include_ajax("info", rootDir + "/admin/member/manager/sub_info.jsp", true, false);
	contentsFrame.location.href = rootDir + "/admin/member/mail/send_mail.jsp?mail_to=" + psMailTo;
	//submenu_hide(strStatus);
}


/**
* 마케팅관리
*/
function menu03_sub01() {
	//var strStatus = status_submenu();
	include_ajax("subMenu", rootDir + "/admin/marketing/sub_menu.jsp", true, false);
	include_ajax("info", rootDir + "/admin/marketing/install/sub_info.jsp", true, false);
	contentsFrame.location.href = rootDir + "/admin/marketing/install/list.jsp";
	//submenu_hide(strStatus);
}
function menu03_sub02() {
	//var strStatus = status_submenu();
	include_ajax("subMenu", rootDir + "/admin/marketing/sub_menu.jsp", true, false);
	include_ajax("info", rootDir + "/admin/marketing/demo/sub_info.jsp", true, false);
	contentsFrame.location.href = rootDir + "/admin/marketing/demo/list.jsp";
	//submenu_hide(strStatus);
}
function menu03_sub03() {
	//var strStatus = status_submenu();
	include_ajax("subMenu", rootDir + "/admin/marketing/sub_menu.jsp", true, false);
	include_ajax("info", rootDir + "/admin/marketing/contact/sub_info.jsp", true, false);
	contentsFrame.location.href = rootDir + "/admin/marketing/contact/list.jsp";
	//submenu_hide(strStatus);
}
function menu03_sub04() {
	//var strStatus = status_submenu();
	include_ajax("subMenu", rootDir + "/admin/marketing/sub_menu.jsp", true, false);
	include_ajax("info", rootDir + "/admin/marketing/faq/sub_info.jsp", true, false);
	contentsFrame.location.href = rootDir + "/admin/marketing/faq/list.jsp";
	//submenu_hide(strStatus);
}

/**
 * 게시판관리
 */
function menu04_sub01() {
	//var strStatus = status_submenu();
	include_ajax("subMenu", rootDir + "/admin/bbs/sub_menu.jsp", true, false);
	include_ajax("info", rootDir + "/admin/bbs/category/sub_info.jsp", true, false);
	contentsFrame.location.href = rootDir + "/admin/bbs/category/list.jsp";
	//submenu_hide(strStatus);
}
function menu04_sub02() {
	//var strStatus = status_submenu();
	include_ajax("subMenu", rootDir + "/admin/bbs/sub_menu.jsp", true, false);
	include_ajax("info", rootDir + "/admin/bbs/manager/sub_info.jsp", true, false);
	contentsFrame.location.href = rootDir + "/admin/bbs/manager/list.jsp";
	//submenu_hide(strStatus);
}
function menu04_sub03() {
	//var strStatus = status_submenu();
	include_ajax("subMenu", rootDir + "/admin/bbs/sub_menu.jsp", true, false);
	include_ajax("info", rootDir + "/admin/bbs/info/sub_info.jsp", true, false);
	contentsFrame.location.href = rootDir + "/admin/bbs/info/list.jsp";
	//submenu_hide(strStatus);
}


/**
 * DB관리
 */ 
function menu05_sub01() {
	//var strStatus = status_submenu();
	include_ajax("subMenu", rootDir + "/admin/db/sub_menu.jsp", true, false);
	include_ajax("info", rootDir + "/admin/db/popup/sub_info.jsp", true, false);
	contentsFrame.location.href = rootDir + "/admin/db/popup/list.jsp";
	//submenu_hide(strStatus);
}
function menu05_sub02() {
	//var strStatus = status_submenu();
	include_ajax("subMenu", rootDir + "/admin/db/sub_menu.jsp", true, false);
	include_ajax("info", rootDir + "/admin/db/media/sub_info.jsp", true, false);
	contentsFrame.location.href = rootDir + "/admin/db/media/mediaInfo.jsp";
	//submenu_hide(strStatus);
}
function menu05_sub03() {
	//var strStatus = status_submenu();
	include_ajax("subMenu", rootDir + "/admin/db/sub_menu.jsp", true, false);
	include_ajax("info", rootDir + "/admin/db/message/sub_info.jsp", true, false);
	contentsFrame.location.href = rootDir + "/admin/db/message/list.jsp";
	//submenu_hide(strStatus);
}
function menu05_sub04() {
	//var strStatus = status_submenu();
	include_ajax("subMenu", rootDir + "/admin/db/sub_menu.jsp", true, false);
	include_ajax("info", rootDir + "/admin/db/calendar/sub_info.jsp", true, false);
	contentsFrame.location.href = rootDir + "/admin/db/calendar/calendar.jsp";
	//submenu_hide(strStatus);
}


/**
 * 슬라이딩 처리
 */
function status_submenu(){
	var status = document.getElementById("subTitleView").style.display;
	return status;
}
function submenu_hide(strStatus) {
	if (strStatus == "none") {
		document.getElementById("subList").style.display = "none";
		document.getElementById("subTitleView").style.display = "none";
		document.getElementById("img_in").style.display = "none";
		document.getElementById("img_out").style.display = "block";
	}
}

/**
 * 서브메뉴 슬라이딩
 */
var subLeftPosition = 148; // 서브메뉴 넓이
//안으로
function moveInSlide(idName) {
	var idDiv = document.getElementById(idName);
	document.getElementById("subList").style.display = "none";
	if (subLeftPosition > 16 && subLeftPosition <= 148) {
		subLeftPosition -= 6;
		idDiv.style.width = subLeftPosition + "px";
		window.setTimeout("moveInSlide('" + idName + "');", 1);
	}
	document.getElementById("subTitleView").style.display = "none";
	document.getElementById("img_in").style.display = "none";
	document.getElementById("img_out").style.display = "block";
}

//밖으로
function moveOutSlide(idName) {
	var idDiv = document.getElementById(idName);
	if (subLeftPosition >= 16 && subLeftPosition < 148) {
		subLeftPosition += 6;
		idDiv.style.width = subLeftPosition + "px";
		window.setTimeout("moveOutSlide('" + idName + "');", 1);
	}
	if (subLeftPosition == 148) {
		document.getElementById("subList").style.display = "block";
		document.getElementById("subTitleView").style.display = "block";
		document.getElementById("img_in").style.display = "block";
		document.getElementById("img_out").style.display = "none";
	}
}

