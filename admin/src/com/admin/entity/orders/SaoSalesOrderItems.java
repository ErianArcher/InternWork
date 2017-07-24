package com.admin.entity.orders;

import java.io.Serializable;
import java.math.BigDecimal;
import java.sql.Timestamp;

public class SaoSalesOrderItems implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 5246551973480613764L;
	private Integer salId;
	private String createdBy;
	private Timestamp creationDate;
	private String lastUpdateBy;
	private Timestamp lastUpdateDate;
	private Integer callCnt;
	private String remark;
	private String stsCd;
	private Integer saoId;
	private Integer proId;
	private Integer qty;
	private BigDecimal price;
	private Integer solId;
	private String trackingNo;
	private String wspName;
	
	public SaoSalesOrderItems(){
		
	}

	public Integer getSalId() {
		return salId;
	}

	public void setSalId(Integer salId) {
		this.salId = salId;
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

	public Integer getCallCnt() {
		return callCnt;
	}

	public void setCallCnt(Integer callCnt) {
		this.callCnt = callCnt;
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	public String getStsCd() {
		return stsCd;
	}

	public void setStsCd(String stsCd) {
		this.stsCd = stsCd;
	}

	public Integer getSaoId() {
		return saoId;
	}

	public void setSaoId(Integer saoId) {
		this.saoId = saoId;
	}

	public Integer getProId() {
		return proId;
	}

	public void setProId(Integer proId) {
		this.proId = proId;
	}

	public Integer getQty() {
		return qty;
	}

	public void setQty(Integer qty) {
		this.qty = qty;
	}

	public BigDecimal getPrice() {
		return price;
	}

	public void setPrice(BigDecimal price) {
		this.price = price;
	}

	public Integer getSolId() {
		return solId;
	}

	public void setSolId(Integer solId) {
		this.solId = solId;
	}

	public String getTrackingNo() {
		return trackingNo;
	}

	public void setTrackingNo(String trackingNo) {
		this.trackingNo = trackingNo;
	}

	public String getWspName() {
		return wspName;
	}

	public void setWspName(String wspName) {
		this.wspName = wspName;
	}


}
