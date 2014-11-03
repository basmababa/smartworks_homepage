package com.maninsoft.smart.homepage.bbs;

import java.sql.*;

public class BbsCommentBean {
	private int cmtIdx;
    private int bbsIdx;
    private String masBbsId;
    private String cmtUsrId;
    private String cmtUsrName;
    private String cmtUsrPass;
    private String cmtContents;
    private Timestamp cmtWdate;

	public BbsCommentBean() {
    }

	public int getCmtIdx(){
		return cmtIdx;
	}

	public void setCmtIdx(int cmtIdx) {
		this.cmtIdx = cmtIdx;
	}

	public int getBbsIdx(){
		return bbsIdx;
	}

	public void setBbsIdx(int bbsIdx) {
		this.bbsIdx = bbsIdx;
	}
   
	public String getMasBbsId(){
		return masBbsId;
	}

	public void setMasBbsId(String masBbsId) {
		this.masBbsId = masBbsId;
	}

	public String getCmtUsrId(){
		return cmtUsrId;
	}

	public void setCmtUsrID(String cmtUsrId) {
		this.cmtUsrId = cmtUsrId;
	}

	public String getCmtUsrName(){
		return cmtUsrName;
	}

	public void setCmtUsrName(String cmtUsrName) {
		this.cmtUsrName = cmtUsrName;
	}

	public String getCmtUsrPass(){
		return cmtUsrPass;
	}

	public void setCmtUsrPass(String cmtUsrPass) {
		this.cmtUsrPass = cmtUsrPass;
	}

	public String getCmtContents(){
		return cmtContents;
	}

	public void setCmtContents(String cmtContents) {
		this.cmtContents = cmtContents;
	}

	public Timestamp getCmtWdate() {
		return cmtWdate;
	}

	public void setCmtWdate(Timestamp cmtWdate) {
		this.cmtWdate = cmtWdate;
	}

}
