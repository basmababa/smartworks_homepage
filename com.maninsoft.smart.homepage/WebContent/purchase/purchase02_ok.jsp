<%@ page language="java" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
<%@ page errorPage="/error/error_view.jsp" %>
<%@ include file="/common/inc/config.jsp" %>
<%@ include file="info.jsp" %>
<%@ page import="com.maninsoft.smart.homepage.request.*" %>
<%@ page import="com.maninsoft.smart.homepage.member.*" %>
<%@ page import="com.maninsoft.smart.homepage.admin.db.install.*" %>
<%@ page import="com.maninsoft.smart.homepage.admin.mail.*" %>
<%
	Request req = new Request(request);
	InstallManager insmanager = InstallManager.getInstance();
	
	MemberBean member = new MemberBean();
	MemberManager manager = MemberManager.getInstance();
	
	//관리자의 정보를 가져온다(email)
	member = manager.getAdmin();
	String admin_email = "admin@maninsoft.co.kr";
	
	if (member != null){
		admin_email = member.getMemEmail();
	}
	
	insmanager.insertInstall(req);
	
	String mail_to = req.getString("email");
	String mail_from = admin_email;
	String mail_subjet = "스마트웍스닷넷 설치 정보입니다.";
	
	String mail_contents = "<link href='http://www.smartworks.net/dm/install/css/style.css' rel='stylesheet' type='text/css'>";
	mail_contents       += "<table width='700'  border='0' cellspacing='0' cellpadding='0'>"; 
	mail_contents       += "	<tr>";
	mail_contents       += "		<td align='center' valign='top'><img src='http://www.smartworks.net/dm/install/images/thmail_im01.jpg' width='700' height='107'></td>";
	mail_contents       += "	</tr>";
	mail_contents       += "	<tr>";
	mail_contents       += "		<td align='center' valign='top' background='http://www.smartworks.net/dm/install/images/thmail_bg.jpg'>";
	mail_contents       += "			<table width='700' border='0' cellspacing='0' cellpadding='0'>";
	mail_contents       += "				<tr>";
	mail_contents       += "					<td width='198' valign='top'><img src='http://www.smartworks.net/dm/install/images/thmail_im02.jpg' width='198' height='348' border='0' usemap='#Map'></td>";
	mail_contents       += "					<td width='502' align='right' valign='top'>";
	mail_contents       += "						<table width='472' border='0' cellspacing='0' cellpadding='0'>";
	mail_contents       += "							<tr>";
	mail_contents       += "								<td width='425' height='57' align='left'><img src='http://www.smartworks.net/dm/install/images/thmail_imt01.jpg' width='425' height='57'></td>";
	mail_contents       += "								<td width='47' rowspan='3' align='center'>&nbsp;</td>";
	mail_contents       += "							</tr>";
	mail_contents       += "							<tr>";
	mail_contents       += "								<td align='center' bgcolor='#eaeaea'>";
	mail_contents       += "									<a href='http://www.smartworks.net/download/smartworks.net1.2.0.exe'>";
	mail_contents       += "										<img src='http://www.smartworks.net/dm/install/images/thbtn_install.jpg' width='153' height='78' border='0' align='top'>";
	mail_contents       += "									</a>";
	mail_contents       += "								</td>";
	mail_contents       += "							</tr>";
	mail_contents       += "							<tr>";
	mail_contents       += "								<td align='left' valign='top'><img src='http://www.smartworks.net/dm/install/images/thmail_imt02.jpg' width='425' height='141'></td>";
	mail_contents       += "							</tr>";
	mail_contents       += "							<tr>";
	mail_contents       += "								<td colspan='2' align='center' valign='top'>&nbsp;</td>";
	mail_contents       += "							</tr>";
	mail_contents       += "							<tr align='right'>";
	mail_contents       += "								<td colspan='2' valign='top'>";
	mail_contents       += "									<table width='472' border='0' cellpadding='0' cellspacing='0'>";
	mail_contents       += "										<tr>";
	mail_contents       += "											<td width='456' align='right'>";
	mail_contents       += "												<a href='http://manual.smartworks.net/category/설치가이드' target='_blank'><img src='http://www.smartworks.net/dm/install/images/thmail_imt03.jpg' width='356' height='69' border='0' align='top'></a>";
	mail_contents       += "											</td>";
	mail_contents       += "											<td width='16' rowspan='2' align='right'>&nbsp;</td>";
	mail_contents       += "										</tr>";
	mail_contents       += "										<tr>";
	mail_contents       += "											<td height='8' align='right'></td>";
	mail_contents       += "										</tr>";
	mail_contents       += "									</table>";
	mail_contents       += "								</td>";
	mail_contents       += "							</tr>";
	mail_contents       += "						</table>";
	mail_contents       += "					</td>";
	mail_contents       += "				</tr>";
	mail_contents       += "			</table>";
	mail_contents       += "		</td>";
	mail_contents       += "	</tr>";
	mail_contents       += "	<tr>";
	mail_contents       += "		<td align='center' valign='top' background='http://www.smartworks.net/dm/install/images/thmail_bg.jpg'>";
	mail_contents       += "			<table width='670' border='0' cellspacing='0' cellpadding='0'>";
	mail_contents       += "				<tr>";
	mail_contents       += "					<td><img src='http://www.smartworks.net/dm/install/images/footer_line.jpg' width='670' height='1'></td>";
	mail_contents       += "				</tr>";
	mail_contents       += "				<tr>";
	mail_contents       += "					<td height='15'></td>";
	mail_contents       += "				</tr>";
	mail_contents       += "			</table>";
	mail_contents       += "			<table width='670' border='0' cellspacing='0' cellpadding='0'>";
	mail_contents       += "				<tr>";
	mail_contents       += "					<td width='94' align='center'><a href='http://www.maninsoft.co.kr' target='_blank'><img src='http://www.smartworks.net/dm/install/images/footer_logo.gif' width='94' height='35'></a></td>";
	mail_contents       += "					<td width='744' align='center' class='footer'>";
	mail_contents       += "						(주)맨인소프트 &nbsp;&nbsp;경기도 성남시 분당구 수내동 16-2 동부루트 801호 대표이사 정윤식<br>";
	mail_contents       += "						사업자번호 129-81-98949 &nbsp;&nbsp;특허출원번호 10-2008-0060550호, 10-2008-0060551호&nbsp;&nbsp;<br>";
	mail_contents       += "						통신판매 제 2009-경기성남-0989호 전화 031-714-5714 &nbsp;&nbsp;팩스 031-714-5776 <a href='mailto:help@maninsoft.co.kr'>&nbsp;&nbsp;<img src='http://www.smartworks.net/dm/install/images/footer_mail.jpg' width='14' height='10' border='0'> help@maninsoft.co.kr</a><br>";
	mail_contents       += "						Copyrightⓒ Maninsoft, Inc. All Rights Reserved.";
	mail_contents       += "					</td>";
	mail_contents       += "				</tr>";
	mail_contents       += "			</table>";
	mail_contents       += "		</td>";
	mail_contents       += "	</tr>";
	mail_contents       += "	<tr>";
	mail_contents       += "		<td align='center' valign='top' background='http://www.smartworks.net/dm/install/images/all_bg.jpg'><img src='http://www.smartworks.net/dm/install/images/thmail_bottom.jpg' width='700' height='12'></td>";
	mail_contents       += "	</tr>";
	mail_contents       += "</table>";
	mail_contents       += "<map name='Map'>";
	mail_contents       += "	<area shape='rect' coords='60,244,194,259' href='http://www.smartworks.net/' target='_blank'>";
	mail_contents       += "	<area shape='rect' coords='67,261,194,275' href='http://appstore.smartworks.net/' target='_blank'>";
	mail_contents       += "</map>";
	
	int sendMsgCount = 0;
	sendMsgCount = MailManager.getInstance().SendMail2(mail_to, mail_from, mail_subjet, mail_contents);
	
	
	String mail_to2 = admin_email;
	String mail_from2 = admin_email;
	String mail_subjet2 = "[설치신청] :: " + req.getString("company");
	
	String mail_contents2 = "회사명 : " + req.getString("company") + "<br>";
	mail_contents2       += "담당자 : " + req.getString("name");	
	int sendMsgCount2 = 0;
	sendMsgCount2 = MailManager.getInstance().SendMail2(mail_to2, mail_from2, mail_subjet2, mail_contents2);
	
	response.sendRedirect("purchase02_complete.jsp");
%>

