package com.maninsoft.smart.homepage.bbs.attach;

import java.io.File;
import java.io.InputStream;
import java.io.BufferedInputStream;
import java.io.FileInputStream;
import java.io.FileNotFoundException;

public class AttachBean {
	private int achIdx;
    private String masBbsId;
    private int bbsId;
    private String achFileName;
    private String achFilePath;
    private String achFileSize;

    public AttachBean() {
    }

    public int getAchIdx(){
        return achIdx;
    }

    public void setAchIdx(int achIdx) {
        this.achIdx = achIdx;
    }

    public String getMasBbsId(){
        return masBbsId;
    }

    public void setMasBbsId(String masBbsId) {
        this.masBbsId = masBbsId;
    }

    public int getBbsId(){
        return bbsId;
    }

    public void setBbsId(int bbsId) {
        this.bbsId = bbsId;
    }

    public String getAchFileName(){
        return achFileName;
    }

    public void setAchFileName(String achFileName) {
        this.achFileName = achFileName;
    }

    public String getAchFilePath(){
        return achFilePath;
    }

    public void setAchFilePath(String achFilePath) {
        this.achFilePath = achFilePath;
    }

    public String getAchFileSize(){
        return achFileSize;
    }

    public void setAchFileSize(String achFileSize) {
        this.achFileSize = achFileSize;
    }

    public boolean exists(){
        File file = new File(this.achFilePath+"/"+this.achFileName);
        return file.exists();
    }

    public InputStream getInputStream(){
        try {
            return new BufferedInputStream(new FileInputStream(this.achFilePath+"/"+this.achFileName), 1024 * 4);
        } catch (FileNotFoundException ex) {
            ex.printStackTrace();
            // ignore;
            return null;
        }
    }
}
