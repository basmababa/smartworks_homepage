<%@ page language="java" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
<%@ include file="/common/inc/config.jsp" %>
<%@ include file="/admin/include/check_admin.jsp" %>
<%@ page import="com.maninsoft.smart.homepage.request.*" %>
<%@ page import="com.maninsoft.smart.homepage.admin.store.info.*" %>
<%
	Request req = new Request(request);
	StoreInfoManager.getInstance().modifyStoreInfo(req);
%>
<script type="text/javascript" language="javascript">
	alert("사이트 정보수정 성공!");
	location.href = "storeInfo.jsp";
</script>
