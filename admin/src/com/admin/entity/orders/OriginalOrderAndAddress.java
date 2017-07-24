package com.admin.entity.orders;

import java.io.Serializable;
import java.sql.Timestamp;
import java.util.List;

public class OriginalOrderAndAddress implements Serializable{

	/**
	 * @author kongxy
	 */
	private static final long serialVersionUID = -2425190672850577920L;
    
    private OriginalOrders	origianlOrders;
    private ShaShippingAddress shaShippingAddress;
    private List<OriginalOrderItems> orderItems;
	public OriginalOrders getOrigianlOrders() {
		return origianlOrders;
	}
	public void setOrigianlOrders(OriginalOrders origianlOrders) {
		this.origianlOrders = origianlOrders;
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
