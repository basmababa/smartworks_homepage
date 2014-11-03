<%@ page language="java" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
<%@ page import="java.util.Calendar" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ include file="/common/inc/config.jsp" %>
<%@ include file="/admin/include/check_admin.jsp" %>
<%@ page import="java.io.File" %>
<%@ page import="java.io.FileInputStream" %>
<%@ page import="java.io.DataInputStream" %>
<%
	// Top 사용자 정보 날짜 처리
	Calendar topCalen = Calendar.getInstance();
	
	SimpleDateFormat topsdf = new SimpleDateFormat("yyyy년 MM월 dd일 E요일");
	String strTopDate = topsdf.format(topCalen.getTime());
	
	File f = new File(getServletContext().getRealPath("/") + "include/counter.txt");  // 카운터가 입력될 화일
		
	//파일이 있으면 데이터를 불러온다
	FileInputStream fis = new FileInputStream(f);
	DataInputStream dis = new DataInputStream(fis);
	int lastday, todaycnt, totalcnt;
	
	lastday = dis.readInt();
	todaycnt = dis.readInt();
	totalcnt = dis.readInt();
%>
<div id="topArea">
	<table border="0" cellpadding="0" cellspacing="0" width="100%">
		<tr>
			<td width="208" align="center" onclick="location.href='<%=ROOT_DIR%>'" style="cursor:pointer;">
				<div style="position:absolute;top:-10px;left:20px;">
					<script type="text/javascript">
						var voEmbed = new setEmbed();
						voEmbed.init("flash", "<%=SWF_ROOT%>/top_logo.swf", "171", "80");
						voEmbed.parameter("wmode", "transparent");
						voEmbed.show();
					</script>
				</div>
		    </td>
			<td height="75px" valign="top">
				<div id="loginMess">
					<img src="<%=ADMIN_IMG%>/icon_login.gif" align="absmiddle" alt="">&nbsp;&nbsp;<%=strTopDate %>
					<span class="loginName"><%=S_NAME %></span>
					(<%=S_ID %>)님 환영합니다.
				</div>
				<div id="mainMenu">
					<ul>
						<li class="topLiFirst"><a href="javascript:moveOutSlide('subMenu');menu01_sub01();">사이트정보</a></li>
						<li class="topLiNormal"><a href="javascript:moveOutSlide('subMenu');menu02_sub02();">회원관리</a></li>
						<li class="topLiNormal"><a href="javascript:moveOutSlide('subMenu');menu03_sub01();">운영관리</a></li>
						<li class="topLiNormal"><a href="javascript:moveOutSlide('subMenu');menu04_sub02();">게시판관리</a></li>
						<li class="topLiNormal"><a href="javascript:moveOutSlide('subMenu');menu05_sub01();">DB관리</a></li>
						<!-- <li class="topLiNormal"><a href="javascript:alert('준비중 입니다.');">접속통계</a></li> -->
					</ul>
				</div>
			</td>
			<td align="right" width="120" valign="bottom" style="padding-bottom:3px; padding-right:10px;">
				<table width="120" border="0" cellpadding="0" cellspacing="0">
					<tr>
						<td width="" height="14" class="loginName" >오늘 방문자 : </td>
						<td width="" height="14" class="loginName" align="right"><%=todaycnt %></td>
					</tr>
					<tr>
						<td width="" height="14" class="loginName">모든 방문자 : </td>
						<td width="" height="14" class="loginName" align="right"><%=totalcnt %></td>
					</tr>
				</table>
			</td>
		</tr>
	</table>
</div>

