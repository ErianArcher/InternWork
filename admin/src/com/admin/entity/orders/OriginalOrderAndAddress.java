package com.admin.entity.orders;

import java.io.Serializable;
import java.sql.Timestamp;
import java.util.List;

public class OriginalOrderAndAddress implements Serializable{

	/**
	 * @author kongxy
	 */
	private static final long serialVersionUID = -2425190672850577920L;
    
    private OriginalOrders	originalOrders;
    private ShaShippingAddress shaShippingAddress;
    private List<OriginalOrderItems> orderItems;
	public OriginalOrders getOriginalOrders() {
		return originalOrders;
	}
	public void setOriginalOrders(OriginalOrders origianlOrders) {
		this.originalOrders = origianlOrders;
	}
	public ShaShippingAddress getShaShippingAddress() {
		return shaShippingAddress;
	}
	public void setShaShippingAddress(ShaShippingAddress shaShippingAddress) {
		this.shaShippingAddress = shaShippingAddress;
	}
	public List<OriginalOrderItems> getOrderItems() {
		return orderItems;
	}
	public void setOrderItems(List<OriginalOrderItems> orderItems) {
		this.orderItems = orderItems;
	}

    
    
}
