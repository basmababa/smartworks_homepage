function go_home() {
	top.location.href = rootDir;
}
function go_admin() {
	top.location.href = rootDir + "/admin";
}
function appstore_search() {
	document.appstoreSearchForm.submit();
}

//스마트웍스 닷넷 소개
function menu01() {
	location.href = rootDir + "/intro/intro01.jsp";
}
function menu01_sub01() {
	location.href = rootDir + "/intro/intro01.jsp";
}
function menu01_sub02() {
	location.href = rootDir + "/intro/intro02.jsp";
}
function menu01_sub03() {
	location.href = rootDir + "/intro/intro03_01.jsp";
}
function menu01_sub04() {
	location.href = rootDir + "/intro/intro04.jsp";
}
function menu01_sub03_01() {
	location.href = rootDir + "/intro/intro03_01.jsp";
}
function menu01_sub03_04() {
	location.href = rootDir + "/intro/intro03_04.jsp";
}
function menu01_sub03_06() {
	location.href = rootDir + "/intro/intro03_06.jsp";
}
function sti01_00() {
	location.href = rootDir + "/intro/intro01.jsp";
}
function sti02_00() {
	location.href = rootDir + "/intro/intro02.jsp";
}
function sti03_00() {
	location.href = rootDir + "/intro/intro03_01.jsp";
}
function sti03_01() {
	location.href = rootDir + "/intro/intro03_01.jsp";
}
function sti03_02() {
	location.href = rootDir + "/intro/intro03_02.jsp";
}
function sti03_03() {
	location.href = rootDir + "/intro/intro03_03.jsp";
}
function sti03_04() {
	location.href = rootDir + "/intro/intro03_04.jsp";
}
function sti03_05() {
	location.href = rootDir + "/intro/intro03_05.jsp";
}
function sti03_06() {
	location.href = rootDir + "/intro/intro03_06.jsp";
}
function sti03_07() {
	location.href = rootDir + "/intro/intro03_07.jsp";
}
function sti03_08() {
	location.href = rootDir + "/intro/intro03_08.jsp";
}
function sti04_00() {
	location.href = rootDir + "/intro/intro04.jsp";
}
function easyani() {	//Easy 체험
	var windowBodyTop = window.screen.availHeight/2 - 360;
	var windowBodyLeft = window.screen.availWidth/2 - 506;
	var url = rootDir + "/intro/easyani.jsp";
	window.open(url, "easy", "width=1012,height=720,top=" + windowBodyTop + ", left=" + windowBodyLeft);
}

//주요기능
function menu02() {
	location.href = rootDir + "/feature/feature01.jsp";
}
function menu02_sub01() {
	location.href = rootDir + "/feature/feature01.jsp";
}
function menu02_sub02() {
	location.href = rootDir + "/feature/feature02_01.jsp";
}
function menu02_sub03() {
	location.href = rootDir + "/feature/feature03_01.jsp";
}
function menu02_sub04() {
	location.href = rootDir + "/feature/feature04_01.jsp";
}
function stf01_00() {
	location.href = rootDir + "/feature/feature01.jsp";
}
function stf02_00() {
	location.href = rootDir + "/feature/feature02_01.jsp";
}
function stf02_01() {
	location.href = rootDir + "/feature/feature02_01.jsp";
}
function stf02_02() {
	location.href = rootDir + "/feature/feature02_02.jsp";
}
function stf03_00() {
	location.href = rootDir + "/feature/feature03_01.jsp";
}
function stf03_01() {
	location.href = rootDir + "/feature/feature03_01.jsp";
}
function stf03_02() {
	location.href = rootDir + "/feature/feature03_02.jsp";
}
function stf03_03() {
	location.href = rootDir + "/feature/feature03_03.jsp";
}
function stf04_00() {
	location.href = rootDir + "/feature/feature04_01.jsp";
}
function stf04_01() {
	location.href = rootDir + "/feature/feature04_01.jsp";
}
function stf04_02() {
	location.href = rootDir + "/feature/feature04_02.jsp";
}
function stf04_03() {
	location.href = rootDir + "/feature/feature04_03.jsp";
}


//구입안내
function menu03() {
	location.href = rootDir + "/purchase/purchase01.jsp";
}
function menu03_sub01() {
	location.href = rootDir + "/purchase/purchase01.jsp";
}
function menu03_sub02() {
	location.href = rootDir + "/purchase/purchase02.jsp";
}
function menu03_sub03() {
	location.href = rootDir + "/purchase/purchase03_01.jsp";
}
function menu03_sub04() {
	location.href = rootDir + "/purchase/purchase04.jsp";
}
function stp01_00() {
	location.href = rootDir + "/purchase/purchase01.jsp";
}
function stp02_00() {
	location.href = rootDir + "/purchase/purchase02.jsp";
}
function stp03_00() {
	location.href = rootDir + "/purchase/purchase03_01.jsp";
}
function stp03_01() {
	location.href = rootDir + "/purchase/purchase03_01.jsp";
}
function stp03_02() {
	location.href = rootDir + "/purchase/purchase03_02.jsp";
}
function stp03_03() {
	location.href = rootDir + "/purchase/purchase03_03.jsp";
}
function stp04_00() {
	location.href = rootDir + "/purchase/purchase04.jsp";
}

//고객센터
function menu04() {
	location.href = rootDir + "/bbs/list.jsp?masBbsId=bbs_notice";
}
function menu04_sub01() {
	location.href = rootDir + "/bbs/list.jsp?masBbsId=bbs_notice";
}
function menu04_sub02() {
	location.href = rootDir + "/faq/list.jsp";
}
function menu04_sub03() {
	location.href = rootDir + "/bbs/list.jsp?masBbsId=bbs_qna";
}
function menu04_sub04() {
	location.href = rootDir + "/bbs/list.jsp?masBbsId=bbs_proposal";
}
function goBbsView(psMasBbsId, psBbsId, psNo) {
	location.href = rootDir + "/bbs/view.jsp?masBbsId=" + psMasBbsId + "&bbsId=" + psBbsId + "&no=" + psNo;
}
function stc01_00() {
	location.href = rootDir + "/bbs/list.jsp?masBbsId=bbs_notice";
}
function stc02_00() {
	location.href = rootDir + "/faq/list.jsp";
}
function stc03_00() {
	location.href = rootDir + "/bbs/list.jsp?masBbsId=bbs_qna";
}
function stc04_00() {
	location.href = rootDir + "/bbs/list.jsp?masBbsId=bbs_proposal";
}

//하단 메뉴
function go_info(psId) {

	var windowBodyTop = window.screen.availHeight/2 - 350;
	var windowBodyLeft = window.screen.availWidth/2 - 490;
	
	var url = rootDir + "/info/company.jsp";
	if (psId == "company") {
		url = rootDir + "/info/company.jsp";
	} else if (psId == "agreement") {
		url = rootDir + "/info/agreement.jsp";
	} else if (psId == "privacy") {
		url = rootDir + "/info/privacy.jsp";
	} else if (psId == "contact") {
		url = rootDir + "/info/contact.jsp";
	}
	window.open(url, "info", "width=980,height=700,resizable=yes,scrollbars=yes,top=" + windowBodyTop + ", left=" + windowBodyLeft);
}
function pop_menu01() {
	location.href = rootDir + "/bbs/list.jsp?masBbsId=bbs_notice";
}
function pop_menu02() {
	location.href = rootDir + "/faq/list.jsp";
}
function pop_menu03() {
	location.href = rootDir + "/bbs/list.jsp?masBbsId=bbs_qna";
}
function pop_menu04() {
	location.href = rootDir + "/bbs/list.jsp?masBbsId=bbs_proposal";
}
function pop_menu05() {
	location.href = rootDir + "/info/company.jsp";
}
function pop_menu06() {
	location.href = rootDir + "/info/agreement.jsp";
}
function pop_menu07() {
	location.href = rootDir + "/info/privacy.jsp";
}
function pop_menu08() {
	location.href = rootDir + "/info/contact.jsp";
}
