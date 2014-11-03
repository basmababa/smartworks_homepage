
function go_back() {
	document.bForm.action = "view.jsp";
	document.bForm.submit();
}

function go_page(page) {
	document.bForm.page.value = page;
	document.bForm.submit();
}

function go_search() {
	document.bForm.searchText.value = searchText.value;
	document.bForm.searchType.value = searchType.value;
	document.bForm.page.value = 1;
	document.bForm.submit();
}

function go_modify() {
	document.bForm.action = "modify.jsp";
	document.bForm.submit();
}

function go_reply() {
	document.bForm.action = "reply.jsp";
	document.bForm.submit();
}

function go_all_list(MAS_BBS_ID) {
    location.href = "list.jsp?masBbsId=" + MAS_BBS_ID;
}

function go_list() {
	document.bForm.action = "list.jsp";
	document.bForm.submit();
}

function go_write() {
	document.bForm.action = "write.jsp";
	document.bForm.submit();
}

function go_save() {
	if (!chkInput())return;
	document.wForm.submit();
}

function go_view(bbsId, no) {
	document.bForm.action = "view.jsp";
	document.bForm.bbsId.value = bbsId;
	document.bForm.no.value = no;
	document.bForm.submit();
}
function go_view_password_win(bbsId, no) {
	document.bForm.bbsId.value = bbsId;
	document.bForm.no.value = no;
	var url = rootDir + "/bbs/view_password.jsp";
	if (voPopupCtrl) {
		voPopupCtrl.dialog_open(url,297,245, 0, "setFocus(document.passForm.bbsPass)");
		voPopupCtrl.in_alert("ESC를 누르시면 창이 닫힙니다.");
	}
}
function check_view_password(event) {
	event = event ? event : window.event;
	if(event.keyCode == 13){
		view_password();
	}
}
function view_password() {
	if (document.passForm.bbsPass.value == "") {
		alert("비밀번호를 입력하세요.");
		document.passForm.bbsPass.focus();
		return;
	}
	document.bForm.action = "view.jsp";
	document.bForm.bbsPass.value = document.passForm.bbsPass.value;
	document.bForm.submit();
}

function view_img(photoId, MAS_BBS_ID, IMAGE_WIDTH, IMAGE_HEIGHT) {
	var url = "view_photo.jsp?masBbsId=" + MAS_BBS_ID + "&photoId=" + photoId;
	if (voPopupCtrl) {
		voPopupCtrl.dialog_open(url, parseInt(IMAGE_WIDTH) + 20, parseInt(IMAGE_HEIGHT) + 48, 50, "");
		voPopupCtrl.in_alert("ESC를 누르시면 창이 닫힙니다.");
	}
}

function go_delete_ok() {
	if(confirm("정말 삭제하시겠습니까?")) {
		document.bForm.action = "delete_ok.jsp";
		document.bForm.submit();
	}
}

function delete_password_win () {
	var url = rootDir + "/bbs/delete_password.jsp";
	if (voPopupCtrl) {
		voPopupCtrl.dialog_open(url,297,245, 0, "setFocus(document.passForm.bbsPass)");
		voPopupCtrl.in_alert("ESC를 누르시면 창이 닫힙니다.");
	}
}

function check_delete_password(event) {
	event = event ? event : window.event;
	if(event.keyCode == 13){
		delete_password();
	}
}

function delete_password() {
	if (document.passForm.bbsPass.value == "") {
		alert("비밀번호를 입력하세요.");
		document.passForm.bbsPass.focus();
		return;
	}

	document.bForm.action = "delete_ok.jsp";
	document.bForm.bbsPass.value = document.passForm.bbsPass.value;
	document.bForm.submit();
}

//댓글 처리
function add_comment() {
	if(document.bForm.userName.value == "") {
		alert("작성자를 입력해주세요!");
		document.bForm.userName.focus();
		return;
	}
	if(document.bForm.userPass.value == "") {
		alert("비밀번호를 입력해주세요");
		document.bForm.userPass.focus();
		return;
	}
	if(document.bForm.comment.value == "") {
		alert("댓글 내용을 입력해주세요");
		document.bForm.comment.focus();
		return;
	}

	document.bForm.action = "comment_write_ok.jsp";
	document.bForm.submit();
}

function delete_comment(id) {
	if (confirm("정말 삭제하시겠습니까?")){
		document.bForm.commentId.value = id;
		document.bForm.action = "comment_delete_ok.jsp";
		document.bForm.submit();
    }
}

function cmt_delete_password_win(cmtId) {
  document.bForm.commentId.value = cmtId;
  var url = rootDir + "/bbs/comment/comment_delete_pw.jsp";
  if (parent.voPopupCtrl) {
	  parent.voPopupCtrl.dialog_open(url,297,245, 0, "setFocus(document.passForm.commentPass)");
	  parent.voPopupCtrl.in_alert("ESC를 누르시면 창이 닫힙니다.");
  }
}

function cmt_check_delete_password(event) {
	event = event ? event : window.event;
	if(event.keyCode == 13){
		cmt_delete_password();
	}
}

function cmt_delete_password() {
	if (document.passForm.commentPass.value == "") {
		alert("비밀번호를 입력하세요.");
		document.passForm.commentPass.focus();
		return;
	}

	var ifrmObj = document.getElementById("comment_list").contentWindow.document;
	ifrmObj.bForm.action = "comment_delete_ok.jsp";
	ifrmObj.bForm.commentPass.value = document.passForm.commentPass.value;
	ifrmObj.bForm.submit();
	voPopupCtrl.dialog_close();
}

/**
 *  checkData - 입력값체크
 *
 */
function chkInput() {
	xForm = document.wForm;
	if (xForm.title) {
		if (!isNotEmpty(xForm.title,'제목')) return false;
	}
	if (xForm.name) {
		if (!isNotEmpty(xForm.name,'작성자')) return false;
	}
	if (xForm.email){
		if (!isNotEmpty(xForm.email,'이메일')) return false;
		if(!isEMail(xForm.email)) return false;
	}
	if (xForm.password){
		if (!isNotEmpty(xForm.password,'비밀번호')) return false;
	}
	if (xForm.hp){
		if (!isNotEmpty(xForm.hp,'연락처')) return false;
	}
	if (xForm.contents){
		if (!isNotEmpty(xForm.contents,'내용')) return false;
	}
	
	/*
	//var tempDiv = document.createElement("div");
	//tempDiv.innerHTML = document.getElementById('contents').value;

	//var contents = replaceTags(tempDiv.innerHTML);
	//if (isNull(contents)) {
	//	alert("내용을 입력하세요.");
	//	return false;
	//} else {
	//	if (getByte(tempDiv.innerHTML) > 2097152) {
	//		alert("포스트 내용이 초과되었습니다.");
	//		return false;
	//	}
	//}

	// 리스트 섬네일용 이미지 등록
	//var imgPath;
	//var imgFile;
	//for (var i = 0; i < tempDiv.getElementsByTagName("img").length; i++){
	//	if (tempDiv.getElementsByTagName("img")[i]) {
	//		var imgURL = tempDiv.getElementsByTagName("img")[i].src;
	//		var tempImg = new Image();
	//		tempImg.src = imgURL;
	
	//		if(tempImg.width > 120 && tempImg.height > 90){
	//			imgPath = imgURL.substring(0, imgURL.lastIndexOf("/"));
	//			imgFile = imgURL.substring((imgURL.lastIndexOf("/")+1), imgURL.length);
	//			document.getElementById("img_path").value = imgPath;
	//			document.getElementById("img_file").value = imgFile;
	//			break;
	//		}
	//	}
	//}
	*/
	return true;
}

/**
 *  setFindEnterKey - 검색항목 입력후 엔터키처리
 *
 */
function setFindEnterKey() {
	if (_isEnter()){
		go_search();
	}
	else return;
}


/**
 * init_attach - 초기에 1개로 설정.
 */
function init_attach(c) {
	if (c) {
		document.getElementById("attach_count").selectedIndex = c-1;
	   	for(var i=1; i <= c; i++) {
	   		document.getElementById("attach_file" + i).style.display = "block";
	   	}
 	} else {
 	  document.getElementById("attach_file1").style.display = "block";
 	}
 }

/**
 * change_attach - 첨부파일 개수를 조정한다.
 */
function change_attach() {
	var c = document.wForm.attach_count.value;

	for(i=1; i<=5; i++) {
		document.getElementById("attach_file" + i).style.display = "none";
	}
	for(i=1; i<=c; i++) {
		document.getElementById("attach_file" + i).style.display = "block";
	}
}


function change_orgcount(ob) {
	if (ob.checked)
		document.wForm.orgfile_count.value++;
	else
		document.wForm.orgfile_count.value--;
}

function change_notice() {
	if (document.wForm.notice.checked) {
		document.wForm.oldNotice.value = 1;
	} else {
		document.wForm.oldNotice.value = 0;
	}
}

function change_secret() {
	if (document.wForm.secret.checked) {
		document.wForm.oldSecret.value = 1;
	} else {
		document.wForm.oldSecret.value = 0;
	}
}

function change_html() {
	if (document.wForm.html.checked) {
		document.wForm.oldHtml.value = 1;
	} else {
		document.wForm.oldHtml.value = 0;
	}
}

function viewSection(section) {
	document.bForm.page.value = 1;
	document.bForm.vSection.value = section;
	document.bForm.submit();
}


function init_attach_file() {

	var attachCountLimit = 5; // 업로드 제한 갯수

	var oldAttachCount = document.getElementById("attach_count").value;
	var realAttachCount = 0;

	for (var i = 0; i < eval(oldAttachCount) + 1; i++) {
	    var tempId = "attach_file" + i;
	    if (document.getElementById(tempId)) {
	    	realAttachCount += 1;
	    }
	}

	if (document.getElementById("attach_file_div_" + oldAttachCount)) {
		document.getElementById("attach_file_div_" + oldAttachCount).style.display = "none";
	}

	if(realAttachCount > attachCountLimit-1){
		alert("파일등록은 " + attachCountLimit + "개까지 가능합니다.");
	} else {
		create_attach_file();
	}
}

//input 객체 생성
function create_attach_file(){
	var oldAttachCount = document.getElementById("attach_count").value;
	var newAttachCount = eval(oldAttachCount) + 1;
	var fileAreaObj = document.getElementById("attach_file_area");
	var inputFileDivId = "attach_file_div_" + newAttachCount;
	var inputFileDiv = document.createElement("div");
	inputFileDiv.setAttribute("id", inputFileDivId);
	inputFileDiv.style.cssText = "overflow:hidden; position:relative; opacity:0; width:55px; height:22px; left:0px;";

	var inputFileId = "attach_file" + newAttachCount;
	var inputFile = document.createElement("input");
	inputFile.setAttribute("name", inputFileId);
	inputFile.setAttribute("id", inputFileId);
	inputFile.setAttribute("type", "file");
	inputFile.style.cssText = "height:22px; position: absolute; top: 0px; right: 0px; cursor: pointer; filter:alpha(opacity=0);opacity:0;";

	inputFileDiv.appendChild(inputFile);

	if (document.addEventListener) {
		inputFile.addEventListener("change", attachListAdd, false);
	} else if (document.attachEvent) {
		inputFile.attachEvent("onchange", attachListAdd);
	}
	fileAreaObj.appendChild(inputFileDiv);
	document.getElementsByName("attach_count")[0].value = newAttachCount;
}


//리스트 추가
function attachListAdd(event){
	event = event ? event : window.event;
	var inputObj;
	if (event.srcElement) {
		inputObj = event.srcElement;
	} else {
		inputObj = event.target;
	}

	var inputObjValue = inputObj.value;
	var inputObjName = inputObj.name;

	inputObjValue = inputObjValue.substring(inputObjValue.lastIndexOf("\\")+1);

	var attachListArea = document.getElementById("attach_list");
	var attachListObj = document.createElement("li");

	if ((eval(document.getElementsByName("attach_count")[0].value) % 2) == 0) {
		attachListObj.className = "write_file_list2";
	} else {
		attachListObj.className = "write_file_list1";
	}
	attachListObj.innerHTML = inputObjValue;
	attachListArea.appendChild(attachListObj);

	var attachListObjSpanId = inputObjName + "_delete";
	var attachListObjSpan = document.createElement("span");
	attachListObjSpan.setAttribute("id", attachListObjSpanId);
	attachListObjSpan.className = "write_file_delete";
	attachListObjSpan.innerHTML = "delete <img src='" + rootDir + "/common/images/bbs/delete.gif' align='bottom'>";
	attachListObj.appendChild(attachListObjSpan);

	if (document.addEventListener) {
		attachListObjSpan.addEventListener("mousedown", delete_attach_file, false);
	} else if (document.attachEvent) {
		attachListObjSpan.attachEvent("onmousedown", delete_attach_file);
	}
	init_attach_file();
}

//리스트 삭제/input삭제
function delete_attach_file(event){
	event = event ? event : window.event;
	var eventObj;
	if (event.srcElement) {
		eventObj = event.srcElement;
	} else {
		eventObj = event.target;
	}

	var inputObjId = eventObj.id.substring(0, eventObj.id.lastIndexOf("_"));
	var inputObj = document.getElementById(inputObjId);
	inputObj.parentNode.removeChild(inputObj);

	var listObj = eventObj.parentNode;
	listObj.parentNode.removeChild(listObj);

	//활성화된 input file 이 없으면 생성
	var oldAttachCount = document.getElementById("attach_count").value;
	if (document.getElementById("attach_file_div_" + oldAttachCount).style.display == "none") {
		create_attach_file();
	}
}

//고유주소 복사
function linkThis(objId) {
	if (document.all) {
		var linkUrl = document.getElementById(objId).lastChild.nodeValue;
		var text = linkUrl;
		var result = window.clipboardData.setData('Text', text);
		alert("복사되었습니다.");
	} else {
		alert("이 브라우저에서는 지원하지 않습니다.");
	}
}
