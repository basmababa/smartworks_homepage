<%@ page language="java" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
<%@ page import = "java.util.*" %>
<%@ page import="java.io.File" %>
<%@ page import="java.io.FileInputStream" %>
<%@ page import="java.io.FileOutputStream" %>
<%@ page import="java.io.DataInputStream" %>
<%@ page import="java.io.DataOutputStream" %>
<%
	//오늘 날짜구하기
	Calendar calendar = Calendar.getInstance();
	int today = calendar.get(Calendar.DATE);
	String userip=request.getRemoteAddr();

	File f = new File(getServletContext().getRealPath("/") + "include/counter.txt");  // 카운터가 입력될 화일

	//파일이 없으면 파일 생성후 오늘날짜와 기본값 저장
	if (!f.exists()) {
		f.createNewFile();
		FileOutputStream fos = new FileOutputStream(f);
		DataOutputStream dos = new DataOutputStream(fos);
		dos.writeInt(today);
		dos.writeInt(0);
		dos.writeInt(0);
		dos.close();
	}

	//파일이 있으면 데이터를 불러온다
	FileInputStream fis = new FileInputStream(f);
	DataInputStream dis = new DataInputStream(fis);
	int lastday, todaycnt, totalcnt;

	lastday = dis.readInt();
	todaycnt = dis.readInt();
	totalcnt = dis.readInt();

	//수정값 저장
	if (session.isNew()) {
		//날짜가 바뀌지 않았다면
		if(today == lastday){
			todaycnt += 1;
			totalcnt += 1;
		}

		//날짜가 바뀌었으면
		if (today != lastday) {
			lastday = today;
			todaycnt = 1;
			totalcnt += 1;
		}

		FileOutputStream fos = new FileOutputStream(f);
		DataOutputStream dos = new DataOutputStream(fos);
		dos.writeInt(lastday);
		dos.writeInt(todaycnt);
		dos.writeInt(totalcnt);
		dos.close();
	}
%>
