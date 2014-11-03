package com.maninsoft.smart.homepage.admin.db.install;

import java.sql.*;

public class InstallBean {

	private int insIdx;
    private String insCompany;
    private String insName;
    private String insEmail;
    private String insHp;
    private int insStaffNumber;
    private int insUserNumber;
    private String insItem;
    private String insBusiness;
    private String insServerLocation;
    private String insNetwork;
    private Timestamp insWdate;
    
    public InstallBean() {
    }
    
    public int getInsIdx(){
        return insIdx;
    }

    public void setInsIdx(int insIdx) {
        this.insIdx = insIdx;
    }

    public String getInsCompany(){
        return insCompany;
    }

    public void setInsCompany(String insCompany) {
        this.insCompany = insCompany;
    }
    
    public String getInsName(){
        return insName;
    }

    public void setInsName(String insName) {
        this.insName = insName;
    }
    
    public String getInsEmail(){
        return insEmail;
    }

    public void setInsEmail(String insEmail) {
        this.insEmail = insEmail;
    }
    
    public String getInsHp(){
        return insHp;
    }

    public void setInsHp(String insHp) {
        this.insHp = insHp;
    }
    
    public int getInsStaffNumber(){
        return insStaffNumber;
    }

    public void setInsStaffNumber(int insStaffNumber) {
        this.insStaffNumber = insStaffNumber;
    }
    
    public int getInsUserNumber(){
        return insUserNumber;
    }

    public void setInsUserNumber(int insUserNumber) {
        this.insUserNumber = insUserNumber;
    }
    
    public String getInsItem(){
        return insItem;
    }

    public void setInsItem(String insItem) {
        this.insItem = insItem;
    }
    
    public String getInsBusiness(){
        return insBusiness;
    }

    public void setInsBusiness(String insBusiness) {
        this.insBusiness = insBusiness;
    }
    
    public String getInsServerLocation(){
        return insServerLocation;
    }

    public void setInsServerLocation(String insServerLocation) {
        this.insServerLocation = insServerLocation;
    }
    
    public String getInsNetwork(){
        return insNetwork;
    }

    public void setInsNetwork(String insNetwork) {
        this.insNetwork = insNetwork;
    }
    
    public Timestamp getInsWdate() {
		return insWdate;
	}

    public void setInsWdate(Timestamp insWdate) {
        this.insWdate = insWdate;
    }
}
