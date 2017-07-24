package com.admin.service.orders;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.admin.dao.DaoSupport;
import com.admin.entity.orders.ShaShippingAddress;

/**
 * @author kongxy
 *
 */
@Service("shaShippingAddressService")
public class ShaShippingAddressService {
	
	@Resource(name = "daoSupport")
	private DaoSupport daoSupport;
	
	public ShaShippingAddress getShaShippingAddressBystoId(Integer stoId) throws Exception {
		return (ShaShippingAddress) daoSupport.findForObject("ShaShippingAddressMapper.getShaShippingAddressBystoId", stoId);
	}
	
	public void saveShaShippingAddress(ShaShippingAddress shaShippingAddress) throws Exception{
		daoSupport.save("ShaShippingAddressMapper.saveShaShippingAddress",shaShippingAddress);
	}
	
	public void deletShashippingAddressById(Integer stoId) throws Exception{
		daoSupport.update("ShaShippingAddressMapper.deletShashippingAddressById", stoId);
	}
	
	public void updateShaShippingAddressById(ShaShippingAddress shaShippingAddress) throws Exception{
		daoSupport.update("ShaShippingAddressMapper.updateShaShippingAddressById", shaShippingAddress);
	}
	
}
