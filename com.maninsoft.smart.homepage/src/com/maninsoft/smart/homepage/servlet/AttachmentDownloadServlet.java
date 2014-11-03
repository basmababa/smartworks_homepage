package com.maninsoft.smart.homepage.servlet;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import com.maninsoft.smart.homepage.bbs.attach.*;

/**
 * BBS에 등록된 첨부파일 다운로드를 위한 서블릿.
 */
public class AttachmentDownloadServlet extends HttpServlet {
	private static final String CONTENT_TYPE = "text/html; charset=MS949";

	//Initialize global variables
	public void init() throws ServletException {
	}

	//Process the HTTP Get request
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int paramID;

		try {
			paramID = Integer.parseInt(request.getParameter("achIdx"));
        } catch (NumberFormatException e) {
            paramID = 0;
        }

        String MAS_BBS_ID = "";
        String DATA_DIR = "";

        if (request.getParameter("masBbsId") != null) {
        	MAS_BBS_ID = request.getParameter("masBbsId");
        }
        if (request.getParameter("DATA_DIR") != null) {
            DATA_DIR = request.getParameter("DATA_DIR");
        }

        String DATA_ROOT = getServletContext().getRealPath("/") + DATA_DIR;     //for upload

        BufferedInputStream bis = null;
        BufferedOutputStream bos = null;
        try {
            AttachManager manager = AttachManager.getInstance();
            AttachBean fileData = new AttachBean();
            fileData = manager.findByID(paramID, DATA_ROOT, MAS_BBS_ID);

            //response.setContentType(fileData.getFileType());
            response.setContentType("application/download" ); //octet-stream" );
            response.setHeader( "Content-Disposition", "attachment; filename=\"" + new String( fileData.getAchFileName().getBytes("KSC5601"), "8859_1" ) + "\";" );

            // 파일이 있는지 체크..
            if (!fileData.exists())
            	return;

            int length = 0;
            byte[] buffer = new byte[1024];
            bis = (BufferedInputStream) fileData.getInputStream();
            bos = new BufferedOutputStream(response.getOutputStream());
            while ((length = bis.read(buffer, 0, buffer.length)) > 0) {
                bos.write(buffer, 0, length);
            }
            bos.flush();
        } catch (IOException ex) {
            ex.printStackTrace();
        } finally {
            if (bos != null) {
                bos.close();
            }
            bos = null;
            if (bis != null) {
                bis.close();
            }
            bis = null;
        }
    }
	
    //Clean up resources
    public void destroy() {
    }
}