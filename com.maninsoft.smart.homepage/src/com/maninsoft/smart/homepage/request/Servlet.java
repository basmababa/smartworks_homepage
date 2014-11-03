package com.maninsoft.smart.homepage.request;

import javax.servlet.http.*;

public class Servlet {
	public Servlet() { }

	/**
	 * no cache
	 * @param res
	 */
	public static void setNoCache(HttpServletResponse res) {
		res.setHeader("Cache-Control", "no-cache");
		res.setHeader("Cache-Control", "no-store");
		res.setHeader("Cache-Control", "must-revalidate");
		res.setHeader("Cache-Control", "proxy-revalidate");
		res.setHeader("Cache-Control", "private");
		res.setHeader("Cache-Control", "max-age=0");
		res.setDateHeader("Expires", -1);
		res.setDateHeader("ExpiresAbsolute", new java.util.Date().getTime());
		res.setHeader("History-Expires", new java.util.Date().toString());
		res.setHeader("Progma", "no-cache");
	}

	/**
	 * 현재 보여주는 페이지가 속한 디렉토리까지의 URL을 알려준다.
	 * @param req
	 * @return 현재 보여주는 페이지가 속한 디렉토리까지의 URL (예 : http://hostname:8080/EDMSWeb/ )
	 */
	public static String getURL(HttpServletRequest req) {
		String path = null;
		String url = req.getRequestURL().toString();
		int last_idx = url.lastIndexOf( '/' );
		if(last_idx > 0 && last_idx < url.length())
			url = url.substring( 0, last_idx+1 );
		path = url;
		return path;
	}

	public static String getBaseURL(HttpServletRequest req) {
		String scheme = req.getScheme();
		String host = req.getServerName();
		int port = req.getServerPort();
		return scheme + "://" + host + ":" + port + "/";
	}

	public static String getContextURL(HttpServletRequest req) {
		String scheme = req.getScheme();
		String host = req.getServerName();
		int port = req.getServerPort();
		String context = req.getContextPath();
		return scheme + "://" + host + ":" + port + context + "/";
	}
}