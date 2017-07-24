package com.admin.entity;

import java.io.Serializable;

/**
 * 
* 类名称：Drp_dropship_price.java
* 类描述： 
* @author HKJ
* 作者单位： JNU
* 联系方式：15626412293
* 创建时间：2017年7月17日
* @version 1.0
 */
public class StrStore implements Serializable{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 7820307298438729384L;
	private int strId;//
	private int dsrId;//借卖ID
	private String plataeformType;//平台类别，1Amazon；2Ebay
	private String storeName;//网店名-从api中获得
	private String storeStsCd;//API 对接状态 1. INI - 刚授权 2. WIP - 正常对接 3. EXP - token 过期 4. ERR - token 出错 5. CLS - 网店关闭
	private String createdBy;//
	private String creationDate;//
	private String lastUpdateBy;//
	private String lastUpdateDate;//
	private int callCnt;//
	private String stsCd;//
	private String remark;//
	public int getStrId() {
		return strId;
	}
	public void setStrId(int strId) {
		this.strId = strId;
	}
	public int getDsrId() {
		return dsrId;
	}
	public void setDsrId(int dsrId) {
		this.dsrId = dsrId;
	}
	public String getPlataeformType() {
		return plataeformType;
	}
	public void setPlataeformType(String plataeformType) {
		this.plataeformType = plataeformType;
	}
	public String getStoreName() {
		return storeName;
	}
	public void setStoreName(String storeName) {
		this.storeName = storeName;
	}
	public String getStoreStsCd() {
		return storeStsCd;
	}
	public void setStoreStsCd(String storeStsCd) {
		this.storeStsCd = storeStsCd;
	}
	public String getCreatedBy() {
		return createdBy;
	}
	public void setCreatedBy(String createdBy) {
		this.createdBy = createdBy;
	}
	public String getCreationDate() {
		return creationDate;
	}
	public void setCreationDate(String creationDate) {
		this.creationDate = creationDate;
	}
	public String getLastUpdateBy() {
		return lastUpdateBy;
	}
	public void setLastUpdateBy(String lastUpdateBy) {
		this.lastUpdateBy = lastUpdateBy;
	}
	public String getLastUpdateDate() {
		return lastUpdateDate;
	}
	public void setLastUpdateDate(String lastUpdateDate) {
		this.lastUpdateDate = lastUpdateDate;
	}
	public int getCallCnt() {
		return callCnt;
	}
	public void setCallCnt(int callCnt) {
		this.callCnt = callCnt;
	}
	
	public String getStsCd() {
		return stsCd;
	}
	public void setStsCd(String stsCd) {
		this.stsCd = stsCd;
	}
	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
	}
	
	
	
}
