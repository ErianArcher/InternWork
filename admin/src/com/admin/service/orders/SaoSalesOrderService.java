package com.admin.service.orders;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.admin.dao.DaoSupport;
import com.admin.entity.orders.SaoSalesOrder;

@Service("saoSalesOrderService")
public class SaoSalesOrderService {
	@Resource(name = "daoSupport")
	private DaoSupport daoSupport;
	public void saveSaoSalesOrder(SaoSalesOrder saoSalesOrder) throws Exception {
		daoSupport.save("SaoSalesOrderMapper.saveSaoSalesOrder", saoSalesOrder);
	}
	
	public void deleteOriginalOrder(SaoSalesOrder saoSalesOrder) throws Exception {
		daoSupport.update("SaoSalesOrderMapper.deleteSaoSalesOrder", saoSalesOrder);
	}
	
	public void updateOriginalOrder(SaoSalesOrder saoSalesOrder) throws Exception {
		daoSupport.update("SaoSalesOrderMapper.updateSaoSalesOrder", saoSalesOrder);
	}
	
	public SaoSalesOrder findSaoSalesOrderById(Integer saoId) throws Exception{
		return (SaoSalesOrder) daoSupport.findForObject("SaoSalesOrderMapper.findSaoSalesOrderById", saoId);
	}

	//未测试
	public List<SaoSalesOrder> findSaoSalesOrderByStoId(Integer stoId) throws Exception
	{
		return (List<SaoSalesOrder>) daoSupport.findForList("SaoSalesOrderMapper.findSaoSalesOrderByStoId", stoId);
	}
}