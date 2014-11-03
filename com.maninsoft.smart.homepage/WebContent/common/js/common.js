var agent_name = navigator.userAgent.toLowerCase();
var is_ie = ((agent_name.indexOf("msie") != -1) && (agent_name.indexOf("opera") == -1));

//ROOT directory 설정
var rootDir = top.rootDir;

$ = function(psId) {
	return document.getElementById(psId);
};

/**
 *  _isDigit
 *
 *  주어진 문자열이 숫자인지를 검사
 *
 *  입력
 *      sStr : 검사하고싶은 문자열
 *  출력
 *      불린
 *
 */
function _isDigit(sStr) {
	if (sStr < "0" || sStr > "9") {
		return false;
	}
	return true;
}

/**
 *  _isAlpha
 *
 *  주어진 문자열이 영문자인지를 검사
 *
 *  입력
 *      sStr : 검사하고싶은 문자열
 *  출력
 *      불린
 *
 */
function _isAlpha(sStr) {
	if ((sStr < "A" || sStr > "Z") && (sStr < "a" || sStr > "z")) {
		return false;
	}
	return true;
}

/**
 *  _CheckSpaces
 *
 *  문자열에서 스페이스를 체크한다
 *
 *  입력
 *      sValue : 검사하고싶은 문자열
 *  출력
 *      불린   : 스페이스의 포함 여부
 *
 */
function _CheckSpaces(strValue) {
	for (var i = 0; i < strValue.length; i++) {
		if (strValue.charAt(i) != " ") {
           return false;
       }
   }
   return true;
}

/**
 *
 *  isBankNumber
 *
 *  주어진 문자열이 숫자 혹은 "-" 문자로만 이루어졌는지를 검사
 *
 *  입력
 *      objName : 점검하고싶은 폼의 오브젝트 이름
 *      DispMsg : 오류 발생시 출력될 메시지의 머리글
 *  출력
 *      불린    false : 문자가 있음
 *              true  : 숫자와 "-"
 *
 */
function isBankNumber(objName, DispMsg) {
	var strValue = objName.value;
	var retChar;
	for (var i = 0; i < strValue.length; i++) {
	    retChar = strValue.substr(i, 1);
		if (_isDigit(retChar) == false && retChar != '-') {
			alert(DispMsg + " 항목에는 \n숫자와 '-'만 가능합니다.");
			return false;
		}
	}
	return true;
}

/**
 *
 *  isNumber
 *
 *  주어진 문자열이 숫자인지를 검사
 *
 *  입력
 *      objName : 점검하고싶은 폼의 오브젝트 이름
 *      DispMsg : 오류 발생시 출력될 메시지의 머리글
 *  출력
 *      불린    false : 문자
 *              true  : 숫자
 *
 */
function isNumber(objName, DispMsg) {
	var strValue = objName.value;
	var retChar;
	for (var i = 0; i < strValue.length; i++) {
	    retChar = strValue.substr(i, 1);
	    if (_isDigit(retChar) == false) {
	            alert("\'" + DispMsg + "' 항목에는 숫자만 허용이 가능합니다.");
	            objName.value = '';
	            objName.focus();
	            return true;
	    }
	}
	return false;
}

/**
 *
 *  isNotEmpty
 *
 *  주어진 문자열이 널 문자인지를 검사
 *
 *  입력
 *      objName : 점검하고싶은 폼의 오브젝트 이름
 *      DispMsg : 오류 발생시 출력될 메시지의 머리글
 *  출력
 *      불린    false : 널문자
 *              true  : 문자열
 *
 */
function isNotEmpty(objName, DispMsg) {
    if (_CheckSpaces(objName.value)) {
        alert("\'" + DispMsg + "' 항목을 입력해 주세요.");
        objName.focus();
        return false;
    }
    return true;
}

/**
 *
 *  isNotEmptyChecked
 *
 *  주어진 CheckBox 나 RadidButton이 선택되었는지 검사
 *
 *  입력
 *      objName : 점검하고싶은 폼의 오브젝트 이름
 *      DispMsg : 오류 발생시 출력될 메시지의 머리글
 *  출력
 *      불린    false : 널문자
 *              true  : 문자열
 *
 */
function isNotEmptyChecked(objName, DispMsg) {
    var count = 0;
	for (var i=0; i < objName.length; i++) {
		if (objName[i].checked) {
			count=count+1;
		}
	}
	if (count<1) {
		alert("\'" + DispMsg + "' 항목을 선택해 주세요.");
        return false;
	}
	return true;
}

/**
 *
 *  isNotBlank
 *
 *  주어진 문자열이 빈 문자를 포함하고 있는지를 검사
 *
 *  입력
 *      objName : 점검하고싶은 폼의 오브젝트 이름
 *      DispMsg : 오류 발생시 출력될 메시지의 머리글
 *  출력
 *      불린    false : 빈문자
 *              true  : 빈문자 없음
 *
 */
function isNotBlank(objName, DispMsg){
    var sValue = objName.value;
    if (sValue.indexOf(" ") > 0) {
        alert("\'" + DispMsg + "' 항목에 빈문자열이 포함되어 있습니다.");
        objName.focus();
        return false;
    }
	return true;
}

/**
 *
 *  HGetStrLength
 *
 *  문자열의 길이를 리턴(한글은 2바이트로 처리)
 *
 *  입력
 *      sValue : 길이를 구하고싶은 문자열
 *  출력
 *      정수   : 문자열의 길이
 *
 */
function HGetStrLength(sValue) {
    var nStrLength = 0;
    var i;
    for (var i = 0; i < sValue.length; i++) {
        if (parseInt(sValue.charCodeAt(i)) > 127) {
            nStrLength = nStrLength + 2;
        } else {
            nStrLength++;
        }
    }
    return nStrLength;
}

/**
 *
 *  isHangul
 *
 *  주어진 문자열이 한글이 아닌지를 검사
 *
 *  입력
 *      objName : 점검하고싶은 폼의 오브젝트 이름
 *      DispMsg : 오류 발생시 출력될 메시지의 머리글
 *  출력
 *      불린    false : 한글외 문자가 있다
 *              true  : 한글외 문자가 없다.
 *
 */
function isHangul(objName, DispMsg){
	var sValue = objName.value;
	for (var i = 0; i < sValue.length; i++) {
		retChar = sValue.substr(i, 1);
		if (HGetStrLength(retChar) == retChar.length) {
			alert("\'" + DispMsg + "' 항목에 한글만 허용됩니다.");
			objName.value = "";
			objName.focus();
			return false;
		}
	}
    return true;
}

/**
 *
 *  isNotHangul
 *
 *  주어진 문자열이 한글이 아닌지를 검사
 *
 *  입력
 *      objName : 점검하고싶은 폼의 오브젝트 이름
 *      DispMsg : 오류 발생시 출력될 메시지의 머리글
 *  출력
 *      불린    false : 한글외 문자가 없다.
 *              true  : 한글외 문자가 있다.
 *
 */
function isNotHangul(objName, DispMsg){
    var sValue = objName.value;
    if (HGetStrLength(sValue) != sValue.length) {
        alert("\'" + DispMsg + "' 항목에 한글은 허용되지 않습니다.");
        objName.value = "";
        objName.focus();
        return true;
    }
    return false;
}


/**
 *
 *  setFocus
 *
 *  주어진 오젝트에 포커스를 준다
 *
 *  입력
 *      objName : 포커스를 주고싶은 폼의 오브젝트 이름
 *  출력
 *      true
 *
 */
function setFocus(objName) {
	objName.focus();
	return true;
}

/**
 *
 *  isEqual
 *
 *  주어진 오젝트를 비교해서 같은지를 검사한다
 *
 *  입력
 *      objSrc  : 오브젝트 소스
 *      objDest : 오브젝트 데스트
 *      DispMsg : 오류 발생시 출력될 메시지의 머리글
 *  출력
 *      불린
 *
 */
function isEqual(objSrc, objDest, DispMsg) {
	if (objSrc.value != objDest.value) {
		alert("\'" + DispMsg + "' 항목이 같지 않습니다.");
		objSrc.focus();
		return false;
	}
	return true;
}

/**
 *
 *  isValidID
 *
 *  아이디로 사용가능한 문자열인지를 검사
 *
 *  입력
 *      objName : 검사하고싶은 오브젝트 이름
 *      DispMsg : 오류 발생시 출력될 메시지의 머리글
 *  출력
 *      불린
 *
 */
function isValidID(objName, DispMsg) {
    var sValue = objName.value;
    var retChar;
    for (var i = 0; i < sValue.length; i++) {
        retChar = sValue.substr(i, 1);
        if ((_isDigit(retChar) == false) && (_isAlpha(retChar) == false)) {
        	alert("\'" + DispMsg + "' 항목에 영문자와 숫자만 사용할 수 있습니다.");
        	objName.focus();
        	return false;
        }
    }
	return true;
}

/**
 *
 *  isValidLength
 *
 *  문자열이 주어진 길이 인지를 점검
 *
 *  입력
 *      objName : 점검하고싶은 폼의 오브젝트 이름
 *      MinLen  : 최소한의 길이
 *      MaxLen  : 최대한의 길이
 *      DispMsg : 오류 발생시 출력될 메시지의 머리글
 *  출력
 *      불린    false : 범위를 벗어났다
 *              true  : 범위내에 존재
 *
 */
function isValidLength(objName, MinLen, MaxLen, DispMsg) {
	var sValue = objName.value;
    nStrLen = HGetStrLength(sValue);
	if (nStrLen < MinLen) { // 최소한의 길이 체크
		alert("\'" + DispMsg + "' 항목에 너무 작게 입력되어 있습니다." + MinLen + "자 이상 입력해야 합니다.");
		objName.focus();
		return false;
	}

	if (nStrLen > MaxLen) { //// 최대한의 길이 체크
		alert("\'" + DispMsg + "' 항목에 너무 길게 입력되어 있습니다." + MaxLen + "자 이하로 입력해야 합니다.");
		objName.focus();
		return false;
	}
    return true;
}

/**
 *
 *  isSpecialChar
 *
 *  주어진 문자열이 지정한 특수문자가 포함되었는지를 검사
 *
 *  입력
 *      objName : 점검하고싶은 폼의 오브젝트 이름
 *  출력
 *      불린    false : 포함되어있지않음
 *              true  : 특수문자 포함
 *
 */
function isSpecialChar(objName, specialChar, DispMsg) {
    var sValue = objName.value;
    if (sValue == "") {
        return true;
    }
    if (sValue.indexOf(specialChar) > 0) {
        alert("\'" + DispMsg + "' 항목에 특수 문자(" + specialChar + ")를 사용하실 수 없습니다.");
        objName.focus();
        return false;
    }
    return true;
}

/**
 *
 *  isEMail
 *
 *  이메일 입력값 유효성 체크
 *
 *  입력
 *      obj : 점검하고싶은 폼의 오브젝트 이름
 *  출력
 *      불린    false : 오류
 *              true  : 정상
 *
 */
function isEMail(obj){
	var str = obj.value ;
	if (str == "") return true;
	emailEx1 = /[A-Za-z0-9_\-]@[A-Za-z0-9_\-]+\.[A-Za-z]+/;
	emailEx2 = /[A-Za-z0-9_\-]@[A-Za-z0-9_\-]+\.[A-Za-z0-9_\-]+\.[A-Za-z]+/;
	emailEx3 = /[A-Za-z0-9_\-]@[A-Za-z0-9_\-]+\.[A-Za-z0-9_\-]+\.[A-Za-z0-9_\-]+\.[A-Za-z]+/;
	if (emailEx1.test(str)) { return true; }
	if (emailEx2.test(str)) { return true; }
	if (emailEx3.test(str)) { return true; }
	alert (' 전자우편이 형식에 맞지 않습니다 \n\n 예) webmaster@naver.com');
	obj.focus();
	return false;
}

/**
 *
 *  isJuminNo
 *
 *  주민등록번호 입력값 유효성 체크
 *
 *  입력
 *      obj : 점검하고싶은 폼의 오브젝트 이름
 *  출력
 *      불린    false : 오류
 *              true  : 정상
 *
 */
function isJuminNo(obj1,obj2) {
    var Sum = 0;
    var Mod = 0;
    var YearIn = 0;
    var MonthIn = 0;
    var DateIn = 0;
    var ID = "";
    head_num = obj1.value;
    tail_num = obj2.value;
    ID = head_num + tail_num;

    for(var i = 0 ; i < 13; i++) {
        if(!_isDigit(ID.charAt(i))) {
        	alert("잘못된 주민등록번호 입니다!");
        	obj1.focus();
            return false;
         }
     }

    for(var i = 0; i < 12; i++) {
        if (i == 0)
        	YearIn += parseInt(ID.charAt(i)) * 10;
        if (i == 1)
        	YearIn += parseInt(ID.charAt(i));
        if (i == 2)
        	MonthIn+=parseInt(ID.charAt(i)) * 10;
        if (i == 3)
        	MonthIn+=parseInt(ID.charAt(i));
        if (i == 4)
            DateIn += parseInt(ID.charAt(i)) * 10;
        if (i == 5)
            DateIn += parseInt(ID.charAt(i));
        if (i < 6)
            Sum += parseInt(ID.charAt(i)) * (i+2);
        if (i > 5 && i < 8 )
            Sum += parseInt(ID.charAt(i)) * (i+2);
        if( i > 7)
            Sum += parseInt(ID.charAt(i)) * (i-6);
	}
    
	Mod = 11 - (Sum % 11);
	if ((11 - (Sum % 11)) >= 10) Mod -= 10;

	if (Mod != parseInt(ID.charAt(12))) {
		alert("잘못된 주민등록번호 입니다!");
		obj1.focus();
		return false;
	}
	if (MonthIn < 1 || MonthIn > 12 || DateIn < 1 || DateIn > 31) {
		alert("잘못된 주민등록번호 입니다!");
		obj1.focus();
		return false;
	}
	if ((MonthIn == 4 || MonthIn == 6 || MonthIn == 9 || MonthIn == 11 ) && DateIn > 30) {
		alert("잘못된 주민등록번호 입니다!");
		obj1.focus();
		return false;
	}
	if (MonthIn ==2 && DateIn > 29) {
		alert("잘못된 주민등록번호 입니다!");
		obj1.focus();
		return false;
	}
	return true;
}


/**
 *
 *  isBizNo
 *
 *  사업자등록번호 입력값 유효성 체크
 *
 *  입력
 *      obj : 점검하고싶은 폼의 오브젝트 이름
 *  출력
 *      불린    false : 오류
 *              true  : 정상
 *
 */
function isBizNo(obj1, obj2 ,obj3) {
	biz_num_1 = obj1.value;
    biz_num_2 = obj2.value;
    biz_num_3 = obj3.value;

    strNumb = biz_num_1 + biz_num_2 + biz_num_3;

    sumMod = 0;
    sumMod += Number(strNumb.substring(0,1));
    sumMod += Number(strNumb.substring(1,2)) * 3 % 10;
    sumMod += Number(strNumb.substring(2,3)) * 7 % 10;
    sumMod += Number(strNumb.substring(3,4)) * 1 % 10;
    sumMod += Number(strNumb.substring(4,5)) * 3 % 10;
    sumMod += Number(strNumb.substring(5,6)) * 7 % 10;
    sumMod += Number(strNumb.substring(6,7)) * 1 % 10;
    sumMod += Number(strNumb.substring(7,8)) * 3 % 10;
    sumMod += Math.floor(Number(strNumb.substring(8,9)) * 5 / 10);
    sumMod += Number(strNumb.substring(8,9)) * 5 % 10;
    sumMod += Number(strNumb.substring(9,10));

    if (sumMod % 10 != 0) {
    	alert("잘못된 사업자등록번호입니다!");
    	obj1.focus();
    	return false;
    }
    return true;
}

// 엔터키입력..처리
function _isEnter(ev) {
	var evCode = (is_ie) ? window.event.keyCode : ev.which;
	if(evCode == 13) return true;
	return false;
}

// 파일이름 
function getFileName(filepath) {
	var file_split = filepath.split("\\");
	var cnt = file_split.length;
	fname = file_split[cnt-1];
	return fname;
}

// 파일 확장자
function getFileExtName(fname) {
	var ext = fname.split(".");
	var cnt = ext.length;
	ext_name = ext[cnt-1];
	return ext_name;
}

function isMediaFile(filepath) {
	var ext = getFileExtName(getFileName(filepath));
	if((ext.toUpperCase() != "SWF") && (ext.toUpperCase() != "GIF") && (ext.toUpperCase() != "JPG") && (ext.toUpperCase() != "JPEG"))
		return false;
	return true;
}

// 항목의 유효성 검사
function checkForm(obj, msg) {
	if(obj.value == "" || _CheckSpaces(obj.value)) {
		alert("[" + msg + "] 항목을 입력해주세요");
		obj.focus();
		return true;
	}
	return false;
}

function getCookie(name) {
	var arg = name + "=";
	var alen = arg.length;
	var clen = document.cookie.length;
	var i = 0;
	while (i < clen) {
		var j = i + alen;
		if (document.cookie.substring(i, j) == arg)
			return getCookieVal (j);
		i = document.cookie.indexOf(" ", i) + 1;
		if (i == 0) break;
	}
	return null;
}

function getCookieVal(offset) {
	var endstr = document.cookie.indexOf (";", offset);
	if (endstr == -1)
		endstr = document.cookie.length;
	return unescape(document.cookie.substring(offset, endstr));
}

function setCookie(name, value) {
	var argv = setCookie.arguments;
	var argc = setCookie.arguments.length;
	var expires = (argc > 2) ? argv[2] : null;
	var path = (argc > 3) ? argv[3] : null;
	var domain = (argc > 4) ? argv[4] : null;
	var secure = (argc > 5) ? argv[5] : false;
	document.cookie = name + "=" + escape(value) +
	((expires == null) ? "" : ("; expires=" + expires.toGMTString())) +
	((path == null) ? "" : ("; path=" + path)) +
	((domain == null) ? "" : ("; domain=" + domain)) +
	((secure == true) ? "; secure" : "");
}

function deleteCookie(name) {
	var exp = new Date();
	exp.setTime (exp.getTime() - 1);
	var cval = getCookie(name);
	document.cookie = name + "=" + cval + "; expires=" + exp.toGMTString() + "; path=/";
}

//숫자 표현시 , 구분자 넣기
function curFormat(txtNumber) {
	txtNumber = String(txtNumber);
    var rxSplit = new RegExp('([0-9])([0-9][0-9][0-9][,.])');
    var arrNumber = txtNumber.split('.');
    var result;
    arrNumber[0] += '.';
    do {
    	arrNumber[0] = arrNumber[0].replace(rxSplit, '$1,$2');
    } while (rxSplit.test(arrNumber[0]));
    if (arrNumber.length > 1) {
        result = arrNumber.join('');
	} else {
		result = arrNumber[0].split('.')[0];
	}
    return result;
}

function trim(stringToTrim) {
	return stringToTrim.replace(/^\s+|\s+$/g,"");
}
function ltrim(stringToTrim) {
	return stringToTrim.replace(/^\s+/,"");
}
function rtrim(stringToTrim) {
	return stringToTrim.replace(/\s+$/,"");
}

//,없애기
function filterNum(str) {
    var re = /^\$|,/g;
    str = String(str);
    return str.replace(re, "");
}

//내용 채크
function isNull(text) {
	if (text == null) return true;
	var result = text.replace(/(^\s*)|(\s*$)/g, "");
	if (result)
		return false;
	else
		return true;
}

//태그 제거
function replaceTags(xStr) {
	var regExp = /<\/?[^>]+>/gi;
	xStr = xStr.replace(regExp,"");
	return xStr;
}

// 문자열 용량 구하기
function getByte(str) {
	var temp;
	var count;
	var count = 0;
	var len = str.length;
	for (var k = 0; k < len; k++) {
		temp = str.charAt(k);
		if (escape(temp).length > 4)
			count += 2;
		else
			count++;
	}
	return count;
}

function getFileSize(ver) {
	var len = 0;
	var filePath = ver;
	if (navigator.appName.indexOf("Netscape") != -1) {
	
		try {
			netscape.security.PrivilegeManager.enablePrivilege('UniversalXPConnect');
		} catch(e) {
			alert("signed.applets.codebase_principal_support를 설정해주세요!\n" + e);
			return -1;
		}
		
		try {
			var file = Components.classes["@mozilla.org/file/local;1"].createInstance(Components.interfaces.nsILocalFile);
			file.initWithPath ( filePath );
			len = file.fileSize;
		} catch(e) {
			alert("에러 발생:" + e);
		}
	} else if (navigator.appName.indexOf('Microsoft') != -1) {
		var img = new Image();
		img.dynsrc = filePath;
		len = img.fileSize;
	}
	len = curFormat(len);
	return len;
}

function viewFlashObject(swfRoot, name, id, width, height, color){
	var sTag = ''
		+ '<Object CLASSID="clsid:d27cdb6e-ae6d-11cf-96b8-444553540000" codebase="http://fpdownload.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=8,0,0,0" id="' + id + '" width="' + width + '" height="' + height + '">'
		+ '  <param name="movie" value="' + swfRoot + '/' + name + '"/>'
		+ '  <param name="quality" value="high"/>'
		+ '  <param name="bgcolor" value="' + color + '"/>'
		+ '</Object>'
		+ '';
	document.write (sTag);
}

//동영상 사용함수
function fnSetMainMovie(imgUrl, width, height, sDesc) {
	var sMainRegionStr = '<div style="width:100%;text-align:center"><embed type="application/x-mplayer2" pluginspage="http://www.microsoft.com/Windows/Downloads/Contents/Products/MediaPlayer/" '
		+' src="' + imgUrl + '"  align="center" '
		+' bufferingtime="1" width="' + width + '" height="' + height + '"></embed></div> ';
	if (sDesc) {
		sMainRegionStr += '<div style=" font:normal normal normal 10pt;text-align:center;padding:10px">' + sDesc + '</div>';
	}
	document.write (sMainRegionStr);
}


/**
 * 2008. 1. 30일 추가
 * IE용 PNG Alpha 처리
 */
function setPng24(psImgObj) {
	psImgObj.width = psImgObj.height = 1;
	psImgObj.className = psImgObj.className.replace(/\bpng24\b/i,'');
	psImgObj.style.filter = "progid:DXImageTransform.Microsoft.AlphaImageLoader(src='"+ psImgObj.src +"',sizingMethod='image');";
	psImgObj.src = "";
	return "";
}


function setEmbed() {
	var obj;
	var parameter;
	var embed;
	var html;
	var allParameter;
	var clsid;
	var codebase;
	var pluginspace;
	var embedType;
	var src;
	var width;
	var height;
	
	// Main function
	this.init = function(getType , s ,w , h) {
		switch (getType) {
			case "flash":
				clsid = "D27CDB6E-AE6D-11cf-96B8-444553540000";
				codebase = "http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=6,0,29,0";
				pluginspage = "http://www.macromedia.com/go/getflashplayer";
				embedType = "application/x-shockwave-flash";
				break;
			default:
		}

		parameter = "<param name='movie' value='"+ s + "'>\n";
		parameter += "<param name='quality' value='high'>\n";

		src = s;
		width = w;
		height = h;
	};

	// Get parameters
	this.parameter = function(parm , value) {
		parameter += "<param name='" + parm + "' value='" + value + "'>\n";
		allParameter += " " + parm + "='" + value + "'";
	};

	// Show function
	this.show = function() {
		if (clsid) {
			obj = "<object classid=\"clsid:" + clsid + "\" codebase=\"" + codebase + "\" width='" + width + "' height='" + height + "'>\n";
		}
		embed = "<embed src='" + src + "' pluginspage='" + pluginspage + "' type='" + embedType + "' width='" + width + "' height='" + height + "'" + allParameter + "></embed>\n";
		if (obj) {
			embed += "</object>\n";
		}
		html = obj + parameter + embed;
		document.write(html);
	};
}

/**
 * 아이프레임 리사이즈
 */
function parentIframeSize(idname){
	parent.iframeSize(idname);
}

function iframeSize(idname) {
	document.getElementById(idname).style.height = 0 + "px";
	var parentFrameObj = document.getElementById(idname);
	var iframeHeight = parentFrameObj.contentWindow.document.body.scrollHeight;
	var parentFrameHeight = document.getElementById(idname).style.height;
	document.getElementById(idname).style.height = iframeHeight + "px";
}

//드림위버 관련 함수
function MM_swapImgRestore() { //v3.0
	var i,x,a=document.MM_sr; for(i=0;a&&i<a.length&&(x=a[i])&&x.oSrc;i++) x.src=x.oSrc;
}

function MM_preloadImages() { //v3.0
	var d=document; if(d.images){ if(!d.MM_p) d.MM_p=new Array();
	var i,j=d.MM_p.length,a=MM_preloadImages.arguments; for(i=0; i<a.length; i++)
		if (a[i].indexOf("#")!=0){ d.MM_p[j]=new Image; d.MM_p[j++].src=a[i];}}
}

function MM_findObj(n, d) { //v4.0
	var p,i,x;  if(!d) d=document; if((p=n.indexOf("?"))>0&&parent.frames.length) {
		d=parent.frames[n.substring(p+1)].document; n=n.substring(0,p);
	}
	if(!(x=d[n])&&d.all) x=d.all[n]; for (i=0;!x&&i<d.forms.length;i++) x=d.forms[i][n];
	for(i=0;!x&&d.layers&&i<d.layers.length;i++) x=MM_findObj(n,d.layers[i].document);
	if(!x && document.getElementById) x=document.getElementById(n); return x;
}

function MM_swapImage() { //v3.0
	var i,j=0,x,a=MM_swapImage.arguments; document.MM_sr=new Array; for(i=0;i<(a.length-2);i+=3)
	if ((x=MM_findObj(a[i]))!=null){document.MM_sr[j++]=x; if(!x.oSrc) x.oSrc=x.src; x.src=a[i+2];}
}

function MM_showHideLayers() { //v6.0
	var i,p,v,obj,args=MM_showHideLayers.arguments;
	for (i=0; i<(args.length-2); i+=3) if ((obj=MM_findObj(args[i]))!=null) {
		v=args[i+2];
		if (obj.style) { obj=obj.style; v=(v=='show')?'visible':(v=='hide')?'hidden':v; }
		obj.visibility=v; 
	}
}

function MM_jumpMenu(targ,selObj,restore){ //v3.0
	eval(targ+".location='"+selObj.options[selObj.selectedIndex].value+"'");
	if (restore) selObj.selectedIndex=0;
}

function MM_openBrWindow(theURL,winName,features) { //v2.0
	window.open(theURL,winName,features);
}


