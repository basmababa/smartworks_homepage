package com.maninsoft.smart.homepage.bbs;

import java.sql.*;

public class BbsBean {
	
	private int bbsIdx;
    private int bbsId;
    private String masBbsId;
    private int bbsDepth;
    private String bbsUsrId;
    private String bbsUsrName;
    private String bbsUsrPass;
    private String bbsUsrEmail;
    private String bbsTitle;
    private String bbsContents;
    private String bbsHost;
    private String bbsHtml;
    private String bbsNotice;
    private String bbsSecret;
    private int bbsRefer;
    private int bbsDown;
    private int bbsGood;
	private Timestamp bbsWdate;
	private String bbsSection;
	private String bbsHp;
	
	public BbsBean() {
	}

	public int getBbsIdx(){
		return bbsIdx;
	}

	public void setBbsIdx(int bbsIdx) {
		this.bbsIdx = bbsIdx;
	}

	public int getBbsId(){
		return bbsId;
	}

	public void setBbsId(int bbsId) {
		this.bbsId = bbsId;
	}
    
	public String getMasBbsId(){
		return masBbsId;
	}

	public void setMasBbsId(String masBbsId) {
        this.masBbsId = masBbsId;
    }
    
    public int getBbsDepth(){
        return bbsDepth;
    }

    public void setBbsDepth(int bbsDepth) {
        this.bbsDepth = bbsDepth;
    }

    public String getBbsUsrId(){
        return bbsUsrId;
    }

    public void setBbsUsrId(String bbsUsrId) {
        this.bbsUsrId = bbsUsrId;
    }

    public String getBbsUsrName(){
       return bbsUsrName;
    }

    public void setBbsUsrName(String bbsUsrName) {
        this.bbsUsrName = bbsUsrName;
    }

    public String getBbsUsrPass(){
       return bbsUsrPass;
    }

    public void setBbsUsrPass(String bbsUsrPass) {
        this.bbsUsrPass = bbsUsrPass;
    }

    public String getBbsUsrEmail(){
       return bbsUsrEmail;
    }

    public void setBbsUsrEmail(String bbsUsrEmail) {
        this.bbsUsrEmail = bbsUsrEmail;
    }

    public String getBbsTitle(){
       return bbsTitle;
    }

    public void setBbsTitle(String bbsTitle) {
        this.bbsTitle = bbsTitle;
    }

    public String getBbsContents(){
       return bbsContents;
    }

    public void setBbsContents(String bbsContents) {
        this.bbsContents = bbsContents;
    }

    public String getBbsHost(){
       return bbsHost;
    }

    public void setBbsHost(String bbsHost) {
        this.bbsHost = bbsHost;
    }

    public String getBbsHtml(){
       return bbsHtml;
    }

    public void setBbsHtml(String bbsHtml) {
        this.bbsHtml = bbsHtml;
    }
    
    public String getBbsNotice(){
        return bbsNotice;
     }

	public void setBbsNotice(String bbsNotice) {
		this.bbsNotice = bbsNotice;
	}
     
	public String getBbsSecret(){
		return bbsSecret;
	}

	public void setBbsSecret(String bbsSecret) {
		this.bbsSecret = bbsSecret;
	}

    public int getBbsRefer(){
       return bbsRefer;
    }

    public void setBbsRefer(int bbsRefer) {
        this.bbsRefer = bbsRefer;
    }

    public int getBbsDown(){
       return bbsDown;
    }

    public void setBbsDown(int bbsDown) {
        this.bbsDown = bbsDown;
    }
    
    public int getBbsGood(){
    	return bbsGood;
	}

	public void setBbsGood(int bbsGood) {
		this.bbsGood = bbsGood;
	}

	public Timestamp getBbsWdate() {
		return bbsWdate;
	}

    public void setBbsWdate(Timestamp bbsWdate) {
        this.bbsWdate = bbsWdate;
    }
    
    public String getBbsSection(){
		return bbsSection;
	}

	public void setBbsSection(String bbsSection) {
		this.bbsSection = bbsSection;
	}
	
	public String getBbsHp(){
		return bbsHp;
	}

	public void setBbsHp(String bbsHp) {
		this.bbsHp = bbsHp;
	}
}

