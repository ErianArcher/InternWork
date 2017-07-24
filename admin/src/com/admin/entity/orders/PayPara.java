package com.admin.entity.orders;

import java.io.Serializable;
import java.math.BigDecimal;

public class PayPara implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 3806415961574773684L;
	private Integer saoId;
	private BigDecimal freightCost;
	public Integer getSaoId() {
		return saoId;
	}
	public void setSaoId(Integer saoId) {
		this.saoId = saoId;
	}
	public BigDecimal getFreightCost() {
		return freightCost;
	}
	public void setFreightCost(BigDecimal freightCost) {
		this.freightCost = freightCost;
	}
}
