package com.admin.service.orders;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.admin.dao.DaoSupport;
import com.admin.entity.orders.OriginalOrders;
import com.admin.util.PageData;

@Service("originalOrderService")
public class OriginalOrderService {
	
	@Resource(name = "daoSupport")
	private DaoSupport daoSupport;
	
	public OriginalOrders findOriginalOrderById(Integer stoId) throws Exception {
		return (OriginalOrders) daoSupport.findForObject("OriginalOrdersMapper.findOriginalOrderById", stoId);
	}
	
	public List<OriginalOrders> findOriginalOrder() throws Exception{
		return (List<OriginalOrders>) daoSupport.findForList("OriginalOrdersMapper.findOriginalOrder", null);
	}
	
	public void saveOriginalOrder(OriginalOrders originalOrders) throws Exception{
		daoSupport.save("OriginalOrdersMapper.saveOriginalOrder",originalOrders);
	}
	
	public void deletOrderById(Integer stoId) throws Exception{
		daoSupport.update("OriginalOrdersMapper.deletOrderById", stoId);
	}
	
	public void updateOrderById(OriginalOrders originalOrders) throws Exception{
		daoSupport.update("OriginalOrdersMapper.updateOrderById", originalOrders);
	}
	
	//未测试
	public List<OriginalOrders> findOriginalOrderByStrId(Integer strId) throws Exception
	{
		return (List<OriginalOrders>) daoSupport.findForList("OriginalOrdersMapper.findOriginalOrderByStrId", strId);
	}
	
}
