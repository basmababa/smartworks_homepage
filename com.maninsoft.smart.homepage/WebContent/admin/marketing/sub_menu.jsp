<%@ page language="java" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
<%@ include file="/common/inc/config.jsp" %>
<%@ include file="/admin/include/check_admin.jsp" %>
	
	<div id="subTitle">
		<table border="0" cellpadding="0" cellspacing="0">
			<tr>
				<td class="sub_title" width="100%" height="35" align="center"><span id="subTitleView" style="display:block;">운영관리</span></td>
				<td valign="middle" height="35">
					<span id="img_in" style="display:block">
						<img src="<%=ADMIN_IMG%>/bt_sub_close.gif" align="top" alt="" onclick="moveInSlide('subMenu');" style="float:right;cursor:pointer;" />
					</span>
					<span id="img_out" style="display:none">
						<img src="<%=ADMIN_IMG%>/bt_sub_open.gif" align="top" alt="" onclick="moveOutSlide('subMenu');" style="float:right;cursor:pointer;" />
					</span>
				</td>
			</tr>
		</table>
	</div>
	<div id="subList" style="display:block;">
		<ul>
			<li><a href="javascript:menu03_sub01()">설치신청관리</a></li>
			<li><a href="javascript:menu03_sub02()">데모신청관리</a></li>
			<li><a href="javascript:menu03_sub03()">제휴문의관리</a></li>
			<li><a href="javascript:menu03_sub04()">FAQ관리</a></li>
		</ul>
	</div>