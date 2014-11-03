function createXMLHttpRequest() {
	var xmlHttp = false;
	if (window.XMLHttpRequest) {              // Mozilla/Safari
		xmlHttp = new XMLHttpRequest();
    } else if (window.ActiveXObject) {        // IE
    	xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
    }
	return xmlHttp;
}

function closeXMLHttpRequest(xmlhttp) {
	xmlhttp = null;
}

function process_ajax(url) {
	var xmlHttp = createXMLHttpRequest();
	xmlHttp.open("GET", url, true);
	xmlHttp.send(null);
}

/**ajax가 필요한 영역에 공통사용
 * area_name : div name
 * url       : 요청페이지
 * async     : true -> 비동기, false -> 동기
 * loading   : true -> loading 표시, false -> loading 미표시
 */
function include_ajax(area_name, url, async, loading){
	if (loading) {
		var str  = makeLoading1();
		document.getElementById(area_name).innerHTML = makeLoading1('left', '300', 'top');
	}
	var xmlhttp = createXMLHttpRequest();
	if (url) {
		xmlhttp.open("GET", url, async);
		xmlhttp.onreadystatechange = function() {
			if (xmlhttp.readyState == 4) {
				if (xmlhttp.status == 200) {
					document.getElementById(area_name).innerHTML = xmlhttp.responseText;
				} else {
					//alert("Error loading "+url+", "+xmlhttp.status+"("+xmlhttp.statusText+")");
				}
			}
		};
		xmlhttp.send(null);
		closeXMLHttpRequest(xmlhttp);
		return true;
	}
	return false;
}

/**
 * ajax가 필요한 영역에 공통사용(반복시간사용)
 */
function include_ajax_repeat(area_name, url, repeat_time) {
	var xmlhttp = createXMLHttpRequest();
	if (url) {
		xmlhttp.open("GET", url, true);
		xmlhttp.onreadystatechange = function() {
			if(xmlhttp.readyState == 4) {
				if(xmlhttp.status == 200) {
					document.getElementById(area_name).innerHTML = xmlhttp.responseText;
				} else {
					//alert("Error loading "+url+", "+xmlhttp.status+"("+xmlhttp.statusText+")");
				}
			}
		};
		xmlhttp.send(null);
	}
	setTimeout("include_ajax_repeat('"+area_name+"','"+url+"','"+repeat_time+"')", repeat_time);	//msec 마다 서버와 통신함
	return false;
}

function execJS(node) {
	var st = node.getElementsByTagName("SCRIPT");
	var strExec;
	for(var i=0; i < st.length; i++) {
		strExec = st[i].text;
		try {
			eval(strExec);
	    } catch(e) {
	    	alert(e);
	    }
	}
}

/**
 * Loading1
 */
function makeLoading1() {
	var text;
	var imgRoot = rootDir + "/common/images";
	text  = "<table border='0' width='100%' height='100%' cellpadding='0' cellspacing='0'>";
	text += "<tr><td align='center'>";
	text += "<img src='" + imgRoot + "/loading1.gif'>";
	text += "</td></tr>";
	text += "</table>";
	return text;
}

/**
* Loading2
*/
function makeLoading2() {
	var text;
	var imgRoot = rootDir + "/common/images";
	text  = "<table border='0' width='100%' height='100%' cellpadding='0' cellspacing='0'>";
	text += "<tr><td align='center'>";
	text += "<img src='" + imgRoot + "/loading2.gif'>";
	text += "</td></tr>";
	text += "</table>";
	return text;
}

