package com.admin.service.orders;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.admin.dao.DaoSupport;
import com.admin.entity.orders.OriginalOrderItems;

@Service("originalOrderItemsService")
public class OriginalOrderItemsService {
	@Resource(name = "daoSupport")
	private DaoSupport daoSupport;
	
	
	public void saveOriginalOrderItems(OriginalOrderItems originalOrderItems) throws Exception {
		daoSupport.save("OriginalOrderItemsMapper.saveOriginalOrderItems", originalOrderItems);
	}
	
	public void deleteOriginalOrderItems(OriginalOrderItems originalOrderItems) throws Exception {
		daoSupport.update("OriginalOrderItemsMapper.deleteOriginalOrderItems", originalOrderItems);
	}
	
	public void updateOriginalOrderItems(OriginalOrderItems originalOrderItems) throws Exception {
		daoSupport.update("OriginalOrderItemsMapper.updateOriginalOrderItems", originalOrderItems);
	}
	
	public OriginalOrderItems findOriginalOrderItemsById(Integer solId) throws Exception{
		return (OriginalOrderItems)daoSupport.findForObject("OriginalOrderItemsMapper.findOriginalOrderItemsById", solId);
	}

}
