package com.admin.entity.orders;

import java.io.Serializable;
import java.sql.Timestamp;

public class OriginalOrders implements Serializable{
	private static final long serialVersionUID = -4934121248391065115L;
	/**
	 * 原始订单的实体类
	 */
	private Integer stoId;
	
	private Integer strId;
	
	private String orderId;
	
	private String orderCreatedTime;
	
	private String paidTime;
	
	private String lastModifiedTime;
	
	private String createdBy;
	
	private Timestamp creationDate;
	
	private String lastUpdateBy;
	
	private Timestamp lastUpdateDate;
	
	private int callCnt;
	
	private String remark;
	
	private char stsCd;
	
	private String plateformType;
	
	private String cancelCompleteDate;

	public OriginalOrders()
	{
		
	}
	
	public void setEntity(String key,String value)
	{
		String e=key;
		switch (e)
		{
		case "STO_ID":
		{
			this.setStoId(Integer.parseInt(value));
			break;
		}
		case "STR_ID":
		{
			this.setStrId(Integer.parseInt(value));
			break;
		}
		case "ORDER_ID":
		{
			this.setOrderCreatedTime(value);
			break;
		}
		case "ORDER_CREATED_TIME":
		{
			this.setOrderCreatedTime(value);
			break;
		}
		case "PAID_TIME":
		{
			this.setPaidTime(value);
			break;
		}
		case "LAST_MODIFIED_TIME":
		{
			this.setLastModifiedTime(value);
			break;
		}
		case "CREATED_BY":
		{
			this.setCreatedBy(value);
			break;
		}
		case "CREATION_DATE":
		{
			this.setCreationDate(Timestamp.valueOf(value));
			break;
		}
		default:
			break;
		}
	}
	public int getStoId() {
		return stoId;
	}

	public void setStoId(int stoId) {
		this.stoId = stoId;
	}

	public int getStrId() {
		return strId;
	}

	public void setStrId(int strId) {
		this.strId = strId;
	}

	public String getOrderId() {
		return orderId;
	}

	public void setOrderId(String orderId) {
		this.orderId = orderId;
	}

	public String getOrderCreatedTime() {
		return orderCreatedTime;
	}

	public void setOrderCreatedTime(String orderCreatedTime) {
		this.orderCreatedTime = orderCreatedTime;
	}

	public String getPaidTime() {
		return paidTime;
	}

	public void setPaidTime(String paidTime) {
		this.paidTime = paidTime;
	}

	public String getLastModifiedTime() {
		return lastModifiedTime;
	}

	public void setLastModifiedTime(String lastModifiedTime) {
		this.lastModifiedTime = lastModifiedTime;
	}

	public String getCreatedBy() {
		return createdBy;
	}

	public void setCreatedBy(String createdBy) {
		this.createdBy = createdBy;
	}

	public Timestamp getCreationDate() {
		return creationDate;
	}

	public void setCreationDate(Timestamp creationDate) {
		this.creationDate = creationDate;
	}

	public String getLastUpdateBy() {
		return lastUpdateBy;
	}

	public void setLastUpdateBy(String lastUpdateBy) {
		this.lastUpdateBy = lastUpdateBy;
	}

	public Timestamp getLastUpdateDate() {
		return lastUpdateDate;
	}

	public void setLastUpdateDate(Timestamp lastUpdateDate) {
		this.lastUpdateDate = lastUpdateDate;
	}

	public int getCallCnt() {
		return callCnt;
	}

	public void setCallCnt(int callCnt) {
		this.callCnt = callCnt;
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	public char getStsCd() {
		return stsCd;
	}

	public void setStsCd(char stsCd) {
		this.stsCd = stsCd;
	}

	public String getPlateformType() {
		return plateformType;
	}

	public void setPlateformType(String plateformType) {
		this.plateformType = plateformType;
	}

	public String getCancelCompleteDate() {
		return cancelCompleteDate;
	}

	public void setCancelCompleteDate(String cancelCompleteDate) {
		this.cancelCompleteDate = cancelCompleteDate;
	}
	
}
