<%@ page language="java" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
<%@ page errorPage="/error/error_view.jsp" %>
<%@ include file="/common/inc/config.jsp" %>
<%@ include file="info.jsp" %>
<%@ page import="com.maninsoft.smart.homepage.request.*" %>
<%@ page import="com.maninsoft.smart.homepage.member.*" %>
<%@ page import="com.maninsoft.smart.homepage.admin.db.demo.*" %>
<%@ page import="com.maninsoft.smart.homepage.admin.mail.*" %>
<%
	Request req = new Request(request);
	DemoManager demmanager = DemoManager.getInstance();
	
	MemberBean member = new MemberBean();
	MemberManager manager = MemberManager.getInstance();
	
	//관리자의 정보를 가져온다(email)
	member = manager.getAdmin();
	String admin_email = "admin@maninsoft.co.kr";
	
	if (member != null){
		admin_email = member.getMemEmail();
	}
	
	demmanager.insertDemo(req);
	
	String mail_to = req.getString("email");
	String mail_from = admin_email;
	String mail_subjet = "스마트웍스닷넷 데모신청 정보입니다.";
	
	String mail_contents = "<link href='http://www.smartworks.net/dm/demo/css/style.css' rel='stylesheet' type='text/css'>";
	mail_contents       += "<table width='700'  border='0' cellspacing='0' cellpadding='0'>"; 
	mail_contents       += "	<tr>";
	mail_contents       += "		<td align='center' valign='top'><img src='http://www.smartworks.net/dm/demo/images/thmaildemo_im01.jpg' width='700' height='107'></td>";
	mail_contents       += "	</tr>";
	mail_contents       += "	<tr>";
	mail_contents       += "		<td align='center' valign='top' background='http://www.smartworks.net/dm/demo/images/thmail_bg.jpg'>";
	mail_contents       += "			<table width='700' border='0' cellspacing='0' cellpadding='0'>";
	mail_contents       += "				<tr>";
	mail_contents       += "					<td width='198' valign='top'><img src='http://www.smartworks.net/dm/demo/images/thmail_im02.jpg' width='198' height='348' border='0' usemap='#Map'></td>";
	mail_contents       += "					<td width='502' align='center'>";
	mail_contents       += "						<table width='427' border='0' cellspacing='0' cellpadding='0'>";
	mail_contents       += "							<tr>";
	mail_contents       += "								<td align='left'><img src='http://www.smartworks.net/dm/demo/images/thmaildemo_imt01.jpg' width='427' height='37'></td>";
	mail_contents       += "							</tr>";
	mail_contents       += "							<tr>";
	mail_contents       += "								<td align='center' bgcolor='#eaeaea'>";
	mail_contents       += "									<table width='400' border='0' cellspacing='0' cellpadding='0'>";
	mail_contents       += "										<tr>";
	mail_contents       += "											<td align='left'>";
	mail_contents       += "												안녕하세요! <span class='txblueb'>스마트웍스닷넷</span>입니다.<br><br>";
	mail_contents       += "												<span class='txblueb'>스마트웍스닷넷</span> <span class='txfee'>데모체험</span>은 스마트웍스닷넷을 설치하지 않고도 직접 <br>";
	mail_contents       += "												웹상에서 스마트웍스닷넷을 체험해 볼 수 있도록 제공하고 있는 <span class='txfee'>데모체험 <br>";
	mail_contents       += "												서비스</span>입니다. <span class='txfee'>데모체험 서비스 기간은 7일입니다.</span><br><br>";
	mail_contents       += "												현재 5개의 스마트웍스닷넷 데모체험 사이트 주소를 운영 중입니다.<br>";
	mail_contents       += "												이 5개 사이트들이 모두 사용자가 사용 중 일때는 대기자 순서대로 데모<br>";
	mail_contents       += "												체험 사이트 주소를 메일로 보내드립니다.<br><br>"	;													
	mail_contents       += "												앞에 대기자 분이 사용 중인 상황에는 조금 기다려주셔야하는 점 양해<br>";
	mail_contents       += "												부탁드립니다. (데모체험 기간이 7일이므로 <span class='txfee'>대략 최소 1일~최대 7일 이상 걸릴 수도 있습니다.</span>)<br><br>";
	mail_contents       += "												<span class='txfee'>최대한 신속하게 데모체험하실 수 있도록 메일로 연락드리겠습니다.</span><br><br>";
	mail_contents       += "												항상 친절과 성의를 다하여 고객님의 경영개선을 위해 늘 함께하는 <span class='txblueb'><br>";
	mail_contents       += "												스마트웍스닷넷</span>이 되겠습니다.";
	mail_contents       += "											</td>";
	mail_contents       += "										</tr>";
	mail_contents       += "									</table>";
	mail_contents       += "								</td>";
	mail_contents       += "							</tr>";
	mail_contents       += "							<tr>";
	mail_contents       += "								<td align='left' valign='top'><img src='http://www.smartworks.net/dm/demo/images/thmail_imt02.jpg' width='427' height='37'></td>";
	mail_contents       += "							</tr>";
	mail_contents       += "							<tr>";
	mail_contents       += "								<td height='50' align='left' valign='top'>&nbsp;</td>";
	mail_contents       += "							</tr>";
	mail_contents       += "							<tr>";
	mail_contents       += "								<td align='right' valign='top'>";
	mail_contents       += "									<a href='http://manual.smartworks.net/category/설치가이드' target='_blank'><img src='http://www.smartworks.net/dm/demo/images/thmail_imt03.jpg' width='356' height='69' border='0' align='top'></a>";
	mail_contents       += "								</td>";
	mail_contents       += "							</tr>";
	mail_contents       += "						</table>";
	mail_contents       += "						<br>";
	mail_contents       += "					</td>";
	mail_contents       += "				</tr>";
	mail_contents       += "			</table>";
	mail_contents       += "		</td>";
	mail_contents       += "	</tr>";
	mail_contents       += "	<tr>";
	mail_contents       += "		<td align='center' valign='top' background='http://www.smartworks.net/dm/demo/images/thmail_bg.jpg'>";
	mail_contents       += "			<table width='670' border='0' cellspacing='0' cellpadding='0'>";
	mail_contents       += "				<tr>";
	mail_contents       += "					<td><img src='http://www.smartworks.net/dm/demo/images/footer_line.jpg' width='670' height='1'></td>";
	mail_contents       += "				</tr>";
	mail_contents       += "				<tr>";
	mail_contents       += "					<td height='15'></td>";
	mail_contents       += "				</tr>";
	mail_contents       += "			</table>";
	mail_contents       += "			<table width='670' border='0' cellspacing='0' cellpadding='0'>";
	mail_contents       += "				<tr>";
	mail_contents       += "					<td width='94' align='center'><a href='http://www.maninsoft.co.kr' target='_blank'><img src='http://www.smartworks.net/dm/demo/images/footer_logo.gif' width='94' height='35'></a></td>";
	mail_contents       += "					<td width='744' align='center' class='footer'>";
	mail_contents       += "						(주)맨인소프트 &nbsp;&nbsp;경기도 성남시 분당구 수내동 16-2 동부루트 801호 대표이사 정윤식<br>";
	mail_contents       += "						사업자번호 129-81-98949 &nbsp;&nbsp;특허출원번호 10-2008-0060550호, 10-2008-0060551호&nbsp;&nbsp;<br>";
	mail_contents       += "						통신판매 제 2009-경기성남-0989호 전화 031-714-5714 &nbsp;&nbsp;팩스 031-714-5776 <a href='mailto:help@maninsoft.co.kr'>&nbsp;&nbsp;<img src='http://www.smartworks.net/dm/demo/images/footer_mail.jpg' width='14' height='10' border='0'> help@maninsoft.co.kr</a><br>";
	mail_contents       += "						Copyrightⓒ Maninsoft, Inc. All Rights Reserved.";
	mail_contents       += "					</td>";
	mail_contents       += "				</tr>";
	mail_contents       += "			</table>";
	mail_contents       += "		</td>";
	mail_contents       += "	</tr>";
	mail_contents       += "	<tr>";
	mail_contents       += "		<td align='center' valign='top' background='http://www.smartworks.net/dm/demo/images/all_bg.jpg'><img src='http://www.smartworks.net/dm/demo/images/thmail_bottom.jpg' width='700' height='12'></td>";
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
	String mail_subjet2 = "[데모신청] :: " + req.getString("company");
	
	String mail_contents2 = "회사명 : " + req.getString("company") + "<br>";
	mail_contents2       += "담당자 : " + req.getString("name");	
	int sendMsgCount2 = 0;
	sendMsgCount2 = MailManager.getInstance().SendMail2(mail_to2, mail_from2, mail_subjet2, mail_contents2);
	
	response.sendRedirect("purchase04_complete.jsp");
%>

