package com.admin.service.orders;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.admin.dao.DaoSupport;
import com.admin.entity.orders.SaoSalesOrderItems;

@Service("saoSalesOrderItemsService")
public class SaoSalesOrderItemsService {
	@Resource(name = "daoSupport")
	private DaoSupport daoSupport;
	public void saveSaoSalesOrderItems(SaoSalesOrderItems saoSalesOrderItems) throws Exception {
		daoSupport.save("SaoSalesOrdersItemsMapper.saveSaoSalesOrderItems", saoSalesOrderItems);
	}
	
	public void deleteSaoSalesOrderItems(Integer salId) throws Exception {
		daoSupport.update("SaoSalesOrdersItemsMapper.deleteSaoSalesOrderItems", salId);
	}
	
	public void updateSaoSalesOrderItems(SaoSalesOrderItems saoSalesOrderItems) throws Exception {
		daoSupport.update("SaoSalesOrdersItemsMapper.updateSaoSalesOrderItems", saoSalesOrderItems);
	}
	
	public SaoSalesOrderItems findSaoSalesOrderItemsById(Integer salId) throws Exception{
		return (SaoSalesOrderItems)daoSupport.findForObject("SaoSalesOrdersItemsMapper.findSaoSalesOrderItemsById", salId);
	}
	
	public SaoSalesOrderItems findSaoSalesOrderItemsBySaoId(Integer saoId) throws Exception
	{
		return (SaoSalesOrderItems)daoSupport.findForObject("SaoSalesOrdersItemsMapper.findSaoSalesOrderItemsBySaoId",saoId);
	}
}
