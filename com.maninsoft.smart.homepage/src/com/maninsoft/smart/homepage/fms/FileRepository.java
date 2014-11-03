package com.maninsoft.smart.homepage.fms;

import com.maninsoft.smart.homepage.jdbc.*;

import org.apache.commons.io.*;
import java.io.*;
import java.io.File;
import java.sql.*;

public class FileRepository {

    private static FileRepository instance = new FileRepository();

    public static FileRepository getInstance(){
    	return instance;
    }

    private Connection getConnection( ) throws Exception{
    	return JDBC.getConnection();
    }

    /**
     * 입력받은 path정보 디렉토리를 생성
     * @param dirPath String
     * @throws Exception
     */
	public void makeDirectory(String dirPath) throws Exception{
		File mkDir = new File(dirPath);
        if(!mkDir.exists()) {
            try {
                mkDir.mkdirs();
                Runtime.getRuntime().exec("chmod 2775 " + dirPath); //Linux 서버에서만 적용됨.
            } catch (Exception ex) {
                ex.printStackTrace();
                throw ex;
            }
        }
    }

    // 파일ID 생성
    private long getID(){
    	return System.nanoTime();
    }

    /**
     * 파일 copy ( src -> dest )
     * @param src File
     * @param dest File
     * @throws Exception
     */
    public void fileCopy(String source, String destination)throws Exception {
        File src = new File(source);
        File dest = new File(destination);

        try {
            BufferedInputStream buff_istream = new BufferedInputStream(new FileInputStream(src), 1024 * 4);
            BufferedOutputStream buff_ostream = new BufferedOutputStream(new FileOutputStream(dest), 1024 * 4);
            CopyUtils.copy(buff_istream, buff_ostream);
            buff_ostream.close();
            buff_istream.close();

        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }


    public void subFilesCopy(String source, String destination)throws Exception {
        File dir = new File(source);
        File[] dirs = dir.listFiles();

        if (dirs == null) {
            return;
        }

        if (dirs.length != 0) {
            for (int i = 0; i < dirs.length; i++) {
                String src = source + dirs[i].getName();
                String dest = destination + dirs[i].getName();

                try {
                    BufferedInputStream buff_istream = new BufferedInputStream(new FileInputStream(src), 1024 * 4);
                    BufferedOutputStream buff_ostream = new BufferedOutputStream(new FileOutputStream(dest), 1024 * 4);
                    CopyUtils.copy(buff_istream, buff_ostream);
                    buff_ostream.close();
                    buff_istream.close();

                } catch (Exception ex) {
                    ex.printStackTrace();
                }
            }
        }
    }

    /**
     * 파일명 변경
     * @param orgFilePath String
     * @param newFilePath String
     * @return boolean
     */
    public boolean renameTo(String orgFilePath, String newFilePath) throws Exception {
        boolean result = false;

        try {

            File file = new File(orgFilePath);

            result = file.renameTo(new File(newFilePath));
        } catch(Exception ex) {
        	ex.printStackTrace();
        	throw ex;
        }
        return result;
    }

    /**
     * 기존에 저장된 파일과 동일한 이름의 파일이 upload될 경우 이름 뒤에 "1"을 붙여 변경한다.
     * @param filePath String
     * @return String
     */
    public String[] rename(String filePath) {
        String result[] = new String[2];
        String orgName = "";
        String orgPath = "";
        String newName = "";
        String newPath = "";
        String type = "";
        //1. 패스정보를 제외하고 파일 이름을 꺼내옴 ( 확장자 포함 )
        int lastSlash = filePath.lastIndexOf('/');
        orgPath = filePath.substring(0, lastSlash);
        orgName = filePath.substring(lastSlash+1);
        //2. 확장자를 제외한 파일 이름을 꺼내옴
        int lastDot = orgName.lastIndexOf('.');
        newName = orgName.substring(0, lastDot);
        type = orgName.substring(lastDot+1);
        //3. fileName + "1" 을 덧붙임
        newName = newName+"1."+type;
        newPath = orgPath+"/"+newName;
        result[0] = newName;
        result[1] = newPath;
        //4. 변경한 이름도 존재하는지 확인하고, 존재한다면 다시 재귀호출함.
        if(new File(newPath).exists()){
            result = rename(newPath);
        }
        return result;
    }

    /**
     * 단일 파일 삭제
     * @param path String
     */
    public static void deleteFile(String filePath) {
        new File(filePath).delete();
    }

    /**
     * 디렉토리 하위까지 모두 삭제
     * @param podPath String
     * @param prdIdx int
     */
    public void removeDirectory(String directory) {
        try {
            deleteFiles(directory);
            deleteDirs(directory);
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }

    /**
     * 디렉토리 path 안에 있는 모든 file 삭제
     * @param path String
     */
    public static void deleteFiles(String dirPath) {
        File file = new File(dirPath);
        File[] files = file.listFiles();
        if (files == null) {
            return;
        }

        if (files.length != 0) {
            for (int i = 0; i < files.length; i++) {
                if (files[i].isFile()) {
                    files[i].delete();
                }
            }
        }
    }

    public static void deleteDirs(String path) {
        File dir = new File(path);
        File[] dirs = dir.listFiles();

        if (dirs == null) {
            return;
        }

        if (dirs.length != 0) {
            for (int i = 0; i < dirs.length; i++) {
                if (dirs[i].listFiles().length == 0) {
                    dirs[i].delete();
                } else {
                    deleteDirs(dirs[i].getPath());
                }
            }
        }
        dir.delete();
    }
}