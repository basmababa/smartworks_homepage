function dHtmlWnd_showPop(idName, left, top) {
    var divObj = document.getElementById(idName);
    divObj.style.visibility = "visible";
  }

  function dHtmlWnd_hidePop(idName){
    var divObj = document.getElementById(idName);
    divObj.style.visibility = "hidden";
  }

  function go_url(url){
    location.href = "http://" + url;
  }

  function pop_close(idName, recId) {

    var divObj = document.getElementById(idName);
    var checkObj = document.getElementById("chkClose_"+recId);


    if(checkObj.checked) {
      //    document.sForm.rec_id.value = recId;
      //    document.sForm.submit();
      addPopCookie(recId);
      dHtmlWnd_hidePop(idName);
    } else {
      dHtmlWnd_hidePop(idName);
    }

  }


  function addPopCookie(recId) {
    var url = "/format/intra/include/add_cookie.jsp?rec_id="+recId+"&section=1";
    process_ajax(url);
  }
