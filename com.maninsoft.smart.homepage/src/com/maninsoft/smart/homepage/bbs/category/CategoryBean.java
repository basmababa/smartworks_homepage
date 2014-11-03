package com.maninsoft.smart.homepage.bbs.category;

public class CategoryBean {
	private int catIdx;
    private String catId;
    private String catName;
    private String catStatus;

    public CategoryBean() {
    }

    public int getCatIdx() {
        return catIdx;
    }

    public void setCatIdx(int catIdx) {
        this.catIdx = catIdx;
    }

    public String getCatId() {
        return catId;
    }

    public void setCatId(String catId) {
        this.catId = catId;
    }

    public String getCatName() {
        return catName;
    }

    public void setCatName(String catName) {
        this.catName = catName;
    }

    public String getCatStatus() {
        return catStatus;
    }

    public void setCatStatus(String catStatus) {
        this.catStatus = catStatus;
    }
}
