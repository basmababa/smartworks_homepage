package com.maninsoft.smart.homepage.member;

import java.sql.Timestamp;

public class MemberBean {

    private int memIdx;
    private String memId;
    private String memPass;
    private String memName;
    private String memJumin;
    private String memTel;
    private String memHp;
    private String memZipCode;
    private String memAddress;
    private String memEmail;
    private Timestamp memRegister;
    private Timestamp memLastLogin;
    private String memLevId;

    public MemberBean() {
    }

    public int getMemIdx() {
        return memIdx;
    }

    public void setMemIdx(int memIdx) {
        this.memIdx = memIdx;
    }

    public String getMemId() {
        return memId;
    }

    public void setMemId(String memId) {
        this.memId = memId;
    }

    public String getMemPass() {
        return memPass;
    }

    public void setMemPass(String memPass) {
        this.memPass = memPass;
    }

    public String getMemName() {
        return memName;
    }

    public void setMemName(String memName) {
        this.memName = memName;
    }

    public String getMemJumin() {
        return memJumin;
    }

    public void setMemJumin(String memJumin) {
        this.memJumin = memJumin;
    }

    public String getMemTel() {
        return memTel;
    }

    public void setMemTel(String memTel) {
        this.memTel = memTel;
    }

    public String getMemHp() {
        return memHp;
    }

    public void setMemHp(String memHp) {
        this.memHp = memHp;
    }

    public String getMemZipCode() {
        return memZipCode;
    }

    public void setMemZipCode(String memZipCode) {
        this.memZipCode = memZipCode;
    }

    public String getMemAddress() {
        return memAddress;
    }

    public void setMemAddress(String memAddress) {
        this.memAddress = memAddress;
    }

    public String getMemEmail() {
        return memEmail;
    }

    public void setMemEmail(String memEmail) {
        this.memEmail = memEmail;
    }

    public Timestamp getMemRegister() {
        return memRegister;
    }

    public void setMemRegister(Timestamp memRegister) {
        this.memRegister = memRegister;
    }

    public Timestamp getMemLastLogin() {
        return memLastLogin;
    }

    public void setMemLastLogin(Timestamp memLastLogin) {
        this.memLastLogin = memLastLogin;
    }

    public String getMemLevId() {
        return memLevId;
    }

    public void setMemLevId(String memLevId) {
        this.memLevId = memLevId;
    }

}