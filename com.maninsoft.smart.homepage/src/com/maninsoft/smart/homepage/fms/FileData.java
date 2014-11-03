package com.maninsoft.smart.homepage.fms;

import java.io.*;
import java.sql.*;
import javax.activation.MimetypesFileTypeMap;
import com.maninsoft.smart.homepage.util.ImageManager;

public class FileData {
	private long fileID;
	private File file;
	private String folderId;
	private String userID;
	private String filePath;
	private String fileName;
	private String fileType;
	private long fileSize;
	private int fileWidth;
	private int fileHeight;
	private Date savedDate;

    public FileData() {}

    public FileData( String folderId, String filename, File file ){
        this.folderId = folderId;
        this.fileName = filename;
        this.filePath = file.getPath();
        this.fileSize = file.length();
        this.file = file;
    }

    public FileData(long fileID, String folderId, String userID, String filePath, String fileName, String fileType, long fileSize, Date savedDate) {
        this.folderId = folderId;
        this.fileID = fileID;
        this.userID = userID;
        this.filePath = filePath;
        this.fileName = fileName;
        this.fileType = fileType;
        this.fileSize = fileSize;
        this.savedDate = savedDate;
    }

    public void setFolderIdx(String folderId) {
        this.folderId = folderId;
    }

    public void setFileID(long fileID) {
        this.fileID = fileID;
    }

    public void setUserID(String userID) {
        this.userID = userID;
    }

    public void setFilePath(String filePath) {
        this.filePath = filePath;
    }

    public void setFileName(String fileName) {
        this.fileName = fileName;
    }

    public void setFileType(String fileType) {
        this.fileType = fileType;
    }

    public void setFileSize(long fileSize) {
        this.fileSize = fileSize;
    }

    public void setFileWidth(int fileWidth) {
        this.fileWidth = fileWidth;
    }

    public void setFileHeight(int fileHeight) {
        this.fileHeight = fileHeight;
    }

    public void setSavedDate(Date savedDate) {
        this.savedDate = savedDate;
    }

    public File getFile(){
        if( file == null ){
            file = new File( getFilePath() );
        }
        return file;
    }

    public void setFile( File file ){
        this.file = file;
    }

    public long getFileID() {
        return this.fileID;
    }

    public String getFolderIdx() {
        return this.folderId;
    }

    public String getUserID() {
        return this.userID;
    }

    public String getFilePath() {
        return this.filePath;
    }

    public String getFileName() {
        return this.fileName;
    }

    public String getFileType() {
        if( this.fileType == null ){
            this.fileType = MimetypesFileTypeMap.getDefaultFileTypeMap().getContentType(this.fileName);
        }
        return this.fileType;
    }

    public long getFileSize() {
        return this.fileSize;
    }

    public int getFileHeight() {
        if(this.fileType.indexOf("image") > 0 ){
            this.fileHeight = ImageManager.getInstance().getImgHeight(this.getFile());
        }else{
            this.fileHeight = 0;
        }

        return this.fileHeight;
    }

    public int getFileWidth() {
        if(this.fileType.indexOf("image") > 0){
            this.fileWidth = ImageManager.getInstance().getImgWidth(this.getFile());
        }else{
            this.fileWidth = 0;
        }
        return this.fileWidth;
    }

    public Date getSavedDate() {
        return this.savedDate;
    }

    public boolean exists(){
        File file = new File(this.filePath);
        return file.exists();
    }

    public InputStream getInputStream(){
        try {
            return new BufferedInputStream(new FileInputStream(this.filePath), 1024 * 4);
        } catch (FileNotFoundException ex) {
            ex.printStackTrace();
            // ignore;
            return null;
        }
    }

    public File rename(File file) { return null;}

}