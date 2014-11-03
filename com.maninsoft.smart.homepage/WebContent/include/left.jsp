<%@ page language="java" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
<%@ page errorPage="/error/error_view.jsp" %>
<%@ include file="/common/inc/config.jsp" %>
<%
	String category = "";
	if (request.getParameter("category") != null) {
		category = request.getParameter("category");
	}
	String pageInfo = "";
	if (request.getParameter("pageInfo") != null) {
		pageInfo = request.getParameter("pageInfo");
	}
	//System.out.println("category : " + category);
	//System.out.println("pageInfo : " + pageInfo);
	String swfName = "left_i.swf";
	String swfWidth = "155";
	String swfHeight = "330";
	
	if (category.equals("intro")) {
		swfName = "left_i.swf";
		swfWidth = "155";
		swfHeight = "330";
	} else if (category.equals("feature")) {
		swfName = "left_f.swf";
		swfWidth = "155";
		swfHeight = "320";
	} else if (category.equals("purchase")) {
		swfName = "left_p.swf";
		swfWidth = "155";
		swfHeight = "280";
	} else if (category.equals("customer")) {
		swfName = "left_c.swf";
		swfWidth = "155";
		swfHeight = "280";
	}
%>
<div id="left_wrap">
	<div>
	    <script type="text/javascript">
			var voEmbed = new setEmbed();
			voEmbed.init("flash", "<%=SWF_ROOT%>/<%=swfName%>?page_info=<%=pageInfo%>", "<%=swfWidth%>", "<%=swfHeight%>");
			voEmbed.parameter("wmode", "transparent");
			voEmbed.show();
		</script>
	</div>
	<div style="padding:0px 0px 0px 4px;">
		<a href="javascript:menu03_sub02();">
			<img src="<%=IMG_ROOT %>/left_nban01.jpg" align="top" alt="스마트웍스닷넷 설치하기" title="스마트웍스닷넷 설치하기">
		</a>
	</div>
	<div style="padding:0px 0px 0px 4px;">
		<a href="javascript:menu03_sub04();">
			<img src="<%=IMG_ROOT %>/left_nban02.jpg" align="top" alt="스마트웍스닷넷 체험시스템" title="스마트웍스닷넷 체험시스템">
		</a>
	</div>
	<div style="padding:0px 0px 8px 4px;">
		<a href="javascript:menu03_sub02();">
			<img src="<%=IMG_ROOT %>/left_nban03.jpg" align="top" alt="스마트웍스닷넷 설치하기" title="스마트웍스닷넷 설치하기">
		</a>
	</div>
	<div style="padding:0px 0px 8px 4px;">
		<img src="<%=IMG_ROOT %>/left_ban02.jpg" alt="고객상담" align="top">
	</div>
</div>

