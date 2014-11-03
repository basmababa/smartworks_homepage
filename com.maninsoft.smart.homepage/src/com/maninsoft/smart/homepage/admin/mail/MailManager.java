package com.maninsoft.smart.homepage.admin.mail;

import javax.servlet.http.HttpServletRequest;
import java.util.Properties;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.util.StringTokenizer;

import com.maninsoft.smart.homepage.Constants;
import com.maninsoft.smart.homepage.request.*;
import com.maninsoft.smart.homepage.jdbc.JDBC;
import java.sql.*;

public class MailManager {

	private static MailManager instance = new MailManager();

	public static MailManager getInstance() {
		return instance;
    }
	
	private static Session _mailSession = null;
	
	static class MyAuthenticator extends Authenticator {
		public PasswordAuthentication getPasswordAuthentication() {
            return new PasswordAuthentication(Constants.SMTP_ID, Constants.SMTP_PW);
        }
	}
		
	public static void beginSession(){
		try {
			
			/* 
			//Create session (smartworks.net)
			Properties mailProps = new Properties();
			mailProps.put("mail.smtp.host", Constants.SMTP_HOST);
			mailProps.put("mail.smtp.port", "25");
			mailProps.put("mail.smtp.auth", "false" );
			
			//Setup mail server
			_mailSession = Session.getInstance( mailProps );
			*/
			
			//Create session (smart.whoismail.net)
			Properties mailProps = new Properties();
			mailProps.put("mail.smtp.host", Constants.SMTP_HOST);
			mailProps.put("mail.smtp.port", "25");
			mailProps.put("mail.smtp.auth", "true" );
			
			Authenticator auth = new MyAuthenticator();
			
			//Setup mail server
			_mailSession = Session.getInstance( mailProps, auth );
     
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }
	
	
	
	
	public static int sendMail( HttpServletRequest request) throws
		AddressException, MessagingException, Exception {

		Request req = new Request(request);
		String [] toAddr = null;

        String mail_to=req.getString("mail_to");
        
        // 수신자 주소를 구분자 ;(세미콜론) 로 분리해 배열로 받아온다.
        toAddr = getTokenizer(mail_to, ";");
        String mail_from = req.getString("mail_from");
        String mail_title = req.getString("mail_title");
        String mail_contents = req.getString("mail_contents");

        //SMTP seesion 받아옴.
        beginSession();
        InternetAddress fromAddr = new InternetAddress(parseAddress(mail_from)[0].toString() );
        Message message = null;
        InternetAddress toAddrs = null;
        
        // 루프를 돌면서 수신자에게 메일 발송
        for (int i = 0; i < toAddr.length; i++) {
        	toAddrs = new InternetAddress(toAddr[i]);

        	//Create and initialize message
        	message = new MimeMessage( _mailSession );
        	message.setFrom( fromAddr );
        	message.setRecipient( Message.RecipientType.TO, toAddrs );
        	message.setSubject( mail_title );
        	message.setContent( mail_contents.toString(), "text/html; charset=euc-kr" );
           
        	//Send message
        	try {
        		Transport.send( message );
        	} catch ( Exception e ) {
        		e.printStackTrace();
        		//throw new MessagingException( e.getMessage() );
        		return 0;
        	}
        }
        return toAddr.length;
	}
	
	public static int SendMail2(String mail_to, String mail_from, String mail_subject, String mail_contents) throws
		AddressException, MessagingException, Exception {

		String [] toAddr = null;
		// 수신자 주소를 구분자 ;(세미콜론) 로 분리해 배열로 받아온다.
		toAddr = getTokenizer(mail_to, ";");

		//SMTP seesion 받아옴.
		beginSession();
		InternetAddress fromAddr = new InternetAddress(parseAddress(mail_from)[0].toString() );
		Message message = null;
		InternetAddress toAddrs = null;
		
		// 루프를 돌면서 수신자에게 메일 발송
		for(int i=0; i < toAddr.length; i++){
		   toAddrs = new InternetAddress( toAddr[i] );
		
		   //Create and initialize message
		   message = new MimeMessage( _mailSession );
		   message.setFrom( fromAddr );
		   message.setRecipient( Message.RecipientType.TO, toAddrs );
		   message.setSubject( mail_subject );
		   message.setContent( mail_contents.toString(), "text/html; charset=euc-kr" );
		   //Send message
		   try {
		       Transport.send( message );
		   } catch ( Exception e ) {
		       e.printStackTrace();
		       //throw new MessagingException( e.getMessage() );
		       return 0;
		   }
		}
		
		return toAddr.length;
	}
	
	
	/**
     * 입력받은 문자열을 함께 받은 구분자로 토큰화해서 리턴
     * @param str String
     * @param delimiter String
     * @return String[]
     */
	public static String[] getTokenizer(String str, String delimiter) {
		StringTokenizer st = new StringTokenizer(str, delimiter);
		int count = st.countTokens();
		String[] result = new String[count];

		int i=0;
		while(st.hasMoreTokens()){
			result[i] = st.nextToken();
			i++;
		}
        return result;
	}

    /**
     * 메일 주소에 들어가는 한글 처리
     * @param addresses String
     * @return InternetAddress[]
     * @throws Exception
     */
	public static InternetAddress[] parseAddress( String addresses ) throws Exception{
		InternetAddress[] addr = InternetAddress.parse( addresses );
		
		for (int i = 0; addr != null && i < addr.length; i++) {
			addr[i].setPersonal( addr[i].getPersonal(), "EUC-KR");
		}
		return addr;
	}

}

