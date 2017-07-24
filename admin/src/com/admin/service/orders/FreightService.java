package com.admin.service.orders;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import com.admin.dao.DaoSupport;
import com.admin.entity.orders.Fretemp;

@Service("freightService")
public class FreightService {
	
	@Resource(name = "daoSupport")
	private DaoSupport daoSupport;
	
	/**
	 * @Date 2017年7月1日下午4:14:31
	 * @author sunxiaoyue
	 * @Desc 运费结果列表
	 */
	@SuppressWarnings("unchecked")
	public List<Fretemp> getFreightList(Fretemp fretemp) throws Exception {
		return (List<Fretemp>) daoSupport.findForList("FreightMapper.getFreightList", fretemp);
	}
	
	/**
	 * @Date 2017年7月1日下午4:16:36
	 * @author linkaitao
	 * @Desc 新增运费结果
	 */
	public void insertFreightTemplete(Fretemp fretemp) throws Exception {
		daoSupport.save("FreightMapper.insertFreightTemplete", fretemp);
	}
	
	/**
	 * @Date 2017年7月11日下午4:17:52
	 * @author sunxiaoyue
	 * @Desc 更新运费结果
	 */
	public void updateFreight(Fretemp fretemp) throws Exception {
		daoSupport.update("FreightMapper.updateFreight", fretemp);
	}
	
	/**
	 * @Date 2017年7月11日下午4:17:52
	 * @author sunxiaoyue
	 * @Desc 删除运费结果
	 */
	public void deleteFreight(Fretemp fretemp) throws Exception {
		daoSupport.delete("FreightMapper.deleteFreight", fretemp);
	}
	/**
	 * @Date 2017年7月11日下午4:19:10
	 * @author linkaitao
	 * @Desc 根据DES_PROVINCE_ID查询运费结果
	 */
	public Fretemp findByProvinceId(Fretemp fretemp) throws Exception{
		return (Fretemp)daoSupport.findForObject("FreightMapper.findFreightByProvinceId", fretemp);
	}
	 
	/**
	 * @Date 2017年7月11日下午4:19:10
	 * @author linkaitao
	 * @Desc 根据SHIPPING_METHOD和DES_PROVINCE_ID查询运费结果
	 */
	public Fretemp findUnitfreByShipPro(Fretemp fretemp) throws Exception{
		return (Fretemp)daoSupport.findForObject("FreightMapper.findFreByShipProid", fretemp);
	}
}
