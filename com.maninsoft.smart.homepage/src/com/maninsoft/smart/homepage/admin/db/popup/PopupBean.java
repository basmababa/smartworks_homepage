package com.maninsoft.smart.homepage.admin.db.popup;

import java.sql.Timestamp;

public class PopupBean {
	private int popIdx;
    private String popTitle;
    private String popImgName;
    private int popImgWidth;
    private int popImgHeight;
    private int popImgSize;
    private String popImgPath;
    private Timestamp popStartDate;
    private Timestamp popEndDate;
    private int popPointTop;
    private int popPointLeft;
    private String popLinkUrl;
    private String popUseCookie;
    private String popStatus;
    private String popSection;

    public PopupBean() {
    }

    public int getPopIdx(){
        return popIdx;
    }

    public void setPopIdx(int popIdx) {
        this.popIdx = popIdx;
    }

    public String getPopTitle(){
        return popTitle;
    }

    public void setPopTitle(String popTitle) {
        this.popTitle = popTitle;
    }

    public String getPopImgName(){
        return popImgName;
    }

    public void setPopImgName(String popImgName) {
        this.popImgName = popImgName;
    }

    public int getPopImgWidth(){
        return popImgWidth;
    }

    public void setPopImgWidth(int popImgWidth) {
        this.popImgWidth = popImgWidth;
    }

    public int getPopImgHeight(){
        return popImgHeight;
    }

    public void setPopImgHeight(int popImgHeight) {
        this.popImgHeight = popImgHeight;
    }

    public int getPopImgSize(){
        return popImgSize;
    }

    public void setPopImgSize(int popImgSize) {
        this.popImgSize = popImgSize;
    }

    public String getPopImgPath(){
        return popImgPath;
    }

    public void setPopImgPath(String popImgPath) {
        this.popImgPath = popImgPath;
    }

    public Timestamp getPopStartDate() {
        return popStartDate;
    }

    public void setPopStartDate(Timestamp popStartDate) {
        this.popStartDate = popStartDate;
    }

    public Timestamp getPopEndDate() {
        return popEndDate;
    }

    public void setPopEndDate(Timestamp popEndDate) {
        this.popEndDate = popEndDate;
    }

    public int getPopPointTop(){
        return popPointTop;
    }

    public void setPopPointTop(int popPointTop) {
        this.popPointTop = popPointTop;
    }

    public int getPopPointLeft(){
        return popPointLeft;
    }

    public void setPopPointLeft(int popPointLeft) {
        this.popPointLeft = popPointLeft;
    }

    public String getPopLinkUrl(){
        return popLinkUrl;
    }

    public void setPopLinkUrl(String popLinkUrl) {
        this.popLinkUrl = popLinkUrl;
    }

    public String getPopUseCookie(){
        return popUseCookie;
    }

    public void setPopUseCookie(String popUseCookie) {
        this.popUseCookie = popUseCookie;
    }

    public String getPopStatus(){
        return popStatus;
    }

    public void setPopStatus(String popStatus) {
        this.popStatus = popStatus;
    }

    public String getPopSection(){
        return popSection;
    }

    public void setPopSection(String popSection) {
        this.popSection = popSection;
    }
}
