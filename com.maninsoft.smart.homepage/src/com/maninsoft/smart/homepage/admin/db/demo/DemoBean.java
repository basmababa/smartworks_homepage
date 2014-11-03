package com.maninsoft.smart.homepage.admin.db.demo;

import java.sql.*;

public class DemoBean {
	private int demIdx;
    private String demCompany;
    private String demName;
    private String demEmail;
    private String demHp;
    private int demStaffNumber;
    private int demUserNumber;
    private String demItem;
    private String demBusiness;
    private Timestamp demWdate;
    
    public DemoBean() {
    }
    
    public int getDemIdx(){
        return demIdx;
    }

    public void setDemIdx(int demIdx) {
        this.demIdx = demIdx;
    }

    public String getDemCompany(){
        return demCompany;
    }

    public void setDemCompany(String demCompany) {
        this.demCompany = demCompany;
    }
    
    public String getDemName(){
        return demName;
    }

    public void setDemName(String demName) {
        this.demName = demName;
    }
    
    public String getDemEmail(){
        return demEmail;
    }

    public void setDemEmail(String demEmail) {
        this.demEmail = demEmail;
    }
    
    public String getDemHp(){
        return demHp;
    }

    public void setDemHp(String demHp) {
        this.demHp = demHp;
    }
    
    public int getDemStaffNumber(){
        return demStaffNumber;
    }

    public void setDemStaffNumber(int demStaffNumber) {
        this.demStaffNumber = demStaffNumber;
    }
    
    public int getDemUserNumber(){
        return demUserNumber;
    }

    public void setDemUserNumber(int demUserNumber) {
        this.demUserNumber = demUserNumber;
    }
    
    public String getDemItem(){
        return demItem;
    }

    public void setDemItem(String demItem) {
        this.demItem = demItem;
    }
    
    public String getDemBusiness(){
        return demBusiness;
    }

    public void setDemBusiness(String demBusiness) {
        this.demBusiness = demBusiness;
    }

    public Timestamp getDemWdate() {
		return demWdate;
	}

    public void setDemWdate(Timestamp demWdate) {
        this.demWdate = demWdate;
    }
}
