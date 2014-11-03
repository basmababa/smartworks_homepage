<%@ page language="java" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	
	//response.setHeader("Pragma","No-cache");
	//response.setHeader("Cache-Control","No-cache");
	//response.setHeader("Expires","1");
	
	String SITE_TITLE = "UCC기반의 중소기업 업무포털 서비스 - 스마트웍스닷넷";
	String SITE_TITLE_ADMIN = "관리자페이지 - 스마트웍스닷넷";
	
	// ROOT directory
	String ROOT_DIR = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+request.getContextPath();
	String CON_DIR = request.getContextPath();

	// ADMIN ROOT
	String ADMIN_ROOT = ROOT_DIR + "/admin";
	
	// CUR PAGE
	String CUR_PAGE = request.getRequestURI();
	
	// IMG ROOT
	String IMG_ROOT = ROOT_DIR + "/common/images";
	String ADMIN_IMG = ROOT_DIR + "/common/images/admin";
	
	// SWF_ROOT
	String SWF_ROOT = ROOT_DIR + "/common/swf";
	
	// DATA ROOT
	String DATA_DIR = "BIN_DATA";											//for servlet
	String DATA_ROOT = getServletContext().getRealPath("/") + DATA_DIR;		//for upload
	String DATA_URL = "/" + DATA_DIR;										//for view
	
	// Admin ID
	String SUPER_USER = "";
	String ADMIN_WRITER = "관리자";
	
	// Category 구분
	String CATEGORY_SECTION = ""; 
	
	//Session info
	String S_IDX = (String)session.getAttribute("S_IDX");
	String S_ID = (String)session.getAttribute("S_ID");
	String S_PASS = (String)session.getAttribute("S_PASS");
	String S_NAME = (String)session.getAttribute("S_NAME");
	String S_EMAIL = (String)session.getAttribute("S_EMAIL");
	String S_HP = (String)session.getAttribute("S_HP");
	String S_LEVEL = (String)session.getAttribute("S_LEVEL");
	
	if (S_IDX == null) { S_IDX = ""; }
	if (S_ID == null) { S_ID = ""; }
	if (S_PASS == null) { S_PASS = ""; }
	if (S_NAME == null) { S_NAME = ""; }
	if (S_EMAIL == null) { S_EMAIL = ""; }
	if (S_HP == null) { S_HP = ""; }
	if (S_LEVEL == null) { S_LEVEL = "0"; }
	
	String APPSTORE_URL = "http://appstore.smartworks.net";
%>