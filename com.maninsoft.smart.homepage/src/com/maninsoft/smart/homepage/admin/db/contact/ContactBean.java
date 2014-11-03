package com.maninsoft.smart.homepage.admin.db.contact;

import java.sql.*;

public class ContactBean {
	
	private int conIdx;
    private String conTitle;
    private String conCompany;
    private String conName;
    private String conHp;
    private String conEmail;
    private String conContents;
    private Timestamp conWdate;
    
    public ContactBean() {
    }
    
    public int getConIdx(){
        return conIdx;
    }

    public void setConIdx(int conIdx) {
        this.conIdx = conIdx;
    }

    public String getConTitle(){
        return conTitle;
    }

    public void setConTitle(String conTitle) {
        this.conTitle = conTitle;
    }
    
    public String getConCompany(){
        return conCompany;
    }

    public void setConCompany(String conCompany) {
        this.conCompany = conCompany;
    }
    
    public String getConName(){
        return conName;
    }

    public void setConName(String conName) {
        this.conName = conName;
    }
    
    public String getConHp(){
        return conHp;
    }

    public void setConHp(String conHp) {
        this.conHp = conHp;
    }
    
    public String getConEmail(){
        return conEmail;
    }

    public void setConEmail(String conEmail) {
        this.conEmail = conEmail;
    }
    
    public String getConContents(){
        return conContents;
    }

    public void setConContents(String conContents) {
        this.conContents = conContents;
    }
    
    public Timestamp getConWdate() {
		return conWdate;
	}

    public void setConWdate(Timestamp conWdate) {
        this.conWdate = conWdate;
    }
}
