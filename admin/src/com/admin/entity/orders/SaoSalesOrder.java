package com.admin.entity.orders;

import java.io.Serializable;
import java.math.BigDecimal;
import java.sql.Timestamp;

public class SaoSalesOrder implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = -826693564176901215L;
	private Integer saoId;
	private String  createdBy;
	private Timestamp creationDate;
	private String lastUpdateBy;
	private Timestamp lastUpdateDate;
	private Integer callCnt;
	private String remark;
	private String stsCd;
	private Integer manId;
	private Integer warId;
	private Timestamp syncDate;
	private Timestamp paymentDate;
	private Timestamp pushDate;
	private Timestamp trackNoDate;
	private Timestamp fulfillmentDate;
	private Timestamp settlementDate;
	private BigDecimal productAmount;
	private BigDecimal freightCost;
	private BigDecimal handlingFee;
	private String customerRemark;
	private String orderNo;
	private String orderSts;
	private String refundSts;
	private String deliverySts;
	private Integer stoId;
	private BigDecimal lastFreightCost;
	private Timestamp cancleTime;
	private String autoPayStatus;
	private String buyerCheckoutMessage;
	private String autoPayTime;
	public SaoSalesOrder(){
		
	}
	public Integer getSaoId() {
		return saoId;
	}
	public void setSaoId(Integer saoId) {
		this.saoId = saoId;
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
	public Integer getManId() {
		return manId;
	}
	public void setManId(Integer manId) {
		this.manId = manId;
	}
	public Integer getWarId() {
		return warId;
	}
	public void setWarId(Integer warId) {
		this.warId = warId;
	}
	public Timestamp getSyncDate() {
		return syncDate;
	}
	public void setSyncDate(Timestamp syncDate) {
		this.syncDate = syncDate;
	}
	public Timestamp getPaymentDate() {
		return paymentDate;
	}
	public void setPaymentDate(Timestamp paymentDate) {
		this.paymentDate = paymentDate;
	}
	public Timestamp getPushDate() {
		return pushDate;
	}
	public void setPushDate(Timestamp pushDate) {
		this.pushDate = pushDate;
	}
	public Timestamp getTrackNoDate() {
		return trackNoDate;
	}
	public void setTrackNoDate(Timestamp trackNoDate) {
		this.trackNoDate = trackNoDate;
	}
	public Timestamp getFulfillmentDate() {
		return fulfillmentDate;
	}
	public void setFulfillmentDate(Timestamp fulfillmentDate) {
		this.fulfillmentDate = fulfillmentDate;
	}
	public Timestamp getSettlementDate() {
		return settlementDate;
	}
	public void setSettlementDate(Timestamp settlementDate) {
		this.settlementDate = settlementDate;
	}
	public BigDecimal getProductAmount() {
		return productAmount;
	}
	public void setProductAmount(BigDecimal productAmount) {
		this.productAmount = productAmount;
	}
	public BigDecimal getFreightCost() {
		return freightCost;
	}
	public void setFreightCost(BigDecimal freightCost) {
		this.freightCost = freightCost;
	}
	public BigDecimal getHandlingFee() {
		return handlingFee;
	}
	public void setHandlingFee(BigDecimal handlingFee) {
		this.handlingFee = handlingFee;
	}
	public String getCustomerRemark() {
		return customerRemark;
	}
	public void setCustomerRemark(String customerRemark) {
		this.customerRemark = customerRemark;
	}
	public String getOrderNo() {
		return orderNo;
	}
	public void setOrderNo(String orderNo) {
		this.orderNo = orderNo;
	}
	public String getOrderSts() {
		return orderSts;
	}
	public void setOrderSts(String orderSts) {
		this.orderSts = orderSts;
	}
	public String getRefundSts() {
		return refundSts;
	}
	public void setRefundSts(String refundSts) {
		this.refundSts = refundSts;
	}
	public String getDeliverySts() {
		return deliverySts;
	}
	public void setDeliverySts(String deliverySts) {
		this.deliverySts = deliverySts;
	}
	public Integer getStoId() {
		return stoId;
	}
	public void setStoId(Integer stoId) {
		this.stoId = stoId;
	}
	public BigDecimal getLastFreightCost() {
		return lastFreightCost;
	}
	public void setLastFreightCost(BigDecimal lastFreightCost) {
		this.lastFreightCost = lastFreightCost;
	}
	public Timestamp getCancleTime() {
		return cancleTime;
	}
	public void setCancleTime(Timestamp cancleTime) {
		this.cancleTime = cancleTime;
	}
	public String getAutoPayStatus() {
		return autoPayStatus;
	}
	public void setAutoPayStatus(String autoPayStatus) {
		this.autoPayStatus = autoPayStatus;
	}
	public String getBuyerCheckoutMessage() {
		return buyerCheckoutMessage;
	}
	public void setBuyerCheckoutMessage(String buyerCheckoutMessage) {
		this.buyerCheckoutMessage = buyerCheckoutMessage;
	}
	public String getAutoPayTime() {
		return autoPayTime;
	}
	public void setAutoPayTime(String autoPayTime) {
		this.autoPayTime = autoPayTime;
	}
	
	
	
}