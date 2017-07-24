package com.admin.entity.orders;

import java.io.Serializable;
import java.math.BigDecimal;
import java.sql.Timestamp;

public class OriginalOrderItems implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 9017615007762480240L;
	private Integer solId;
	private String orderItemId;
	private Integer stoId;
	private BigDecimal salesPrice;
	private Integer qty;
	private String skuNo;
	private String createdBy;
	private Timestamp creationDate;
	private String lastUpdateBy;
	private Timestamp lastUpdateDate;
	private Integer callCnt;
	private String remark;
	private char stsCd;
	private String buyerCheckoutMessage;
	
	public OriginalOrderItems()
	{
		
	}

	public Integer getSolId() {
		return solId;
	}

	public void setSolId(Integer solId) {
		this.solId = solId;
	}

	public String getOrderItemId() {
		return orderItemId;
	}

	public void setOrderItemId(String orderItemId) {
		this.orderItemId = orderItemId;
	}

	public Integer getStoId() {
		return stoId;
	}

	public void setStoId(Integer stoId) {
		this.stoId = stoId;
	}

	public BigDecimal getSalesPrice() {
		return salesPrice;
	}

	public void setSalesPrice(BigDecimal d) {
		this.salesPrice = d;
	}

	public Integer getQty() {
		return qty;
	}

	public void setQty(Integer qty) {
		this.qty = qty;
	}

	public String getSkuNO() {
		return skuNo;
	}

	public void setSkuNO(String skuNO) {
		this.skuNo = skuNO;
	}

	public String getCreatedBY() {
		return createdBy;
	}

	public void setCreatedBY(String createdBY) {
		this.createdBy = createdBY;
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

	public char getStsCd() {
		return stsCd;
	}

	public void setStsCd(char stsCd) {
		this.stsCd = stsCd;
	}

	public String getBuyerCheckoutMessage() {
		return buyerCheckoutMessage;
	}

	public void setBuyerCheckoutMessage(String buyerCheckoutMessage) {
		this.buyerCheckoutMessage = buyerCheckoutMessage;
	}
	
}
