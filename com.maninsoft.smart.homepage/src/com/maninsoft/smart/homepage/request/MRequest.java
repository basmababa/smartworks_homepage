package com.maninsoft.smart.homepage.request;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import java.io.IOException;
import com.maninsoft.smart.homepage.Constants;


public class MRequest {
	private static final int LIMIT_SIZE = 50 * 1024 * 1024;
	public static String ROOT_FILE_STORE = Constants.DATA_ROOT;
	public static String SAVE_FILE_STORE = "";
	private boolean _isMultipart = false;
	private HttpServletRequest _request = null;
	private MultipartRequest _multipartRequest = null;
	private File _file = null;

	public MRequest() {
	}

    public MRequest(HttpServletRequest request) throws Exception {
        _request = request;
    }

    /**
     * 파일의 저장위치 Setting
     * WebModule 내 위치
     * @param uploadPath String
     */
	public void setSavePath(String uploadPath) {
		SAVE_FILE_STORE = uploadPath;
	}

    /**
     * 파일의 저장위치 Setting
     * ROOT 파일관리
     * @param uploadPath String
     */
	public void setSavePath2(String uploadPath) {
		SAVE_FILE_STORE = ROOT_FILE_STORE + uploadPath;
	}

    /**
     * 파일의 저장위치를 가져온다.
     * @return String
     */
    public String getSavePath() {
        return SAVE_FILE_STORE;
    }

    /**
     * MultiPart Request Parsing
     * @param request HttpServletRequest
     * @throws IOException
     */
    public void parse() throws IOException {
        if (_isMultipart = isMultipart()) {
        	_multipartRequest = new MultipartRequest(_request, getSavePath(), LIMIT_SIZE, "UTF-8", new DefaultFileRenamePolicy());
        }
    }

    public boolean isMultipart() throws IOException {
        String contentType = _request.getContentType();
        if (contentType != null && contentType.startsWith("multipart/form-data"))
            return true;

        return false;
    }

    public String getParameter(String name) {
        try {
            if (_isMultipart) {
                return _multipartRequest.getParameter(name);
            }else {
                return (String) _request.getParameter(name);
            }
        } catch (Exception ex) {
            return null;
        }
    }

    public String[] getParameterValues(String name) {
        try {
            if (_isMultipart) {
                return _multipartRequest.getParameterValues(name);
            } else {
                return _request.getParameterValues(name);
            }
        } catch (Exception ex) {
            return null;
        }
    }

    /**
     * 변환된 파일 이름
     * @param fileName String
     * @return String
     */
    public String getFileSystemName(String fileName) {
        String fileSystemName = _multipartRequest.getFilesystemName(fileName);
        return fileSystemName;
    }

    /**
     * 파일의 Type
     * @param fileName String
     * @return String
     */
    public String getContentType(String fileName) {
        String fileType = _multipartRequest.getContentType(fileName);
        return fileType;
    }

    /**
     * 실제 파일을 리턴
     * @param fileName String
     * @return String
     */
    public File getFile(String fileName) {
        _file = _multipartRequest.getFile(fileName);
        return _file;
    }

    /**
     * 현재파일을 삭제한다.
     */
    public void delFile() {
        if (_file.exists()) {
            _file.delete();
        }
    }

    /**
     * 기존파일를 삭제한다
     * @param oldFileName String
     */
    public void delOldFile(String oldFileName) {
	    File gFile = new File(SAVE_FILE_STORE + oldFileName);
	    if (gFile.exists()){
	        gFile.delete();
	    }
    }

    /**
     * Upload 디렉토리 생성
     * @param uploadPath String
     */
    public void makeDir() {
        File uploadDir = new File(SAVE_FILE_STORE);
        if (!uploadDir.exists()) {
            uploadDir.mkdirs();
        }
    }

    /**
     * 이미지 Thumnail 용 Upload 디렉토리 생성
     * @param uploadPath String
     */
    public void makeThumDir(String thumPath) {
        File uploadThumDir = new File(thumPath);
        if (!uploadThumDir.exists()) {
            uploadThumDir.mkdirs();
        }
    }

    /**
     * remoteHost 리턴
     * @return String
     */
    public String getRemoteHost() {
        String remote = _request.getRemoteHost();
        return remote;
    }
}