package com.admin.service.dropshipper;


import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.admin.dao.DaoSupport;
import com.admin.entity.StrStore;
@Service("strStoreService")
public class StrStoreService {
	
	@Resource(name = "daoSupport")
	private DaoSupport daoSupport;
	
	/**
	 * 
	 * @param strStore
	 * @throws Exception
	 * 增加网店
	 */
	public void saveStrStore(StrStore strStore) throws Exception {
		daoSupport.save("StrStoreMapper.insertStore", strStore);
	}
	/**
	 * 
	 * @param strStore
	 * @return
	 * @throws Exception
	 * 根据借卖方ID获得网店信息
	 */
	public List<StrStore> findStoreByDsrId(StrStore strStore) throws Exception {
		return (List<StrStore>)daoSupport.findForList("StrStoreMapper.findStoreByDsrId", strStore);
	}
	
	/**
	 * 根据网店ID来获取网店信息
	 * @param strStore
	 * @return
	 * @throws Exception
	 */
	public StrStore findStoreByStrId(StrStore strStore) throws Exception{
		return (StrStore)daoSupport.findForObject("StrStoreMapper.findStoreByStrId", strStore);
	}
	
	/**
	 * 关闭网店,并没有删除
	 * @param strStore
	 * @throws Exception
	 */
	public void closeStrStore(StrStore strStore) throws Exception {
		daoSupport.update("StrStoreMapper.closeStrStore", strStore);
	}
	/**
	 * 删除网店
	 * @param strStore
	 * @throws Exception
	 */
	public void deleteStrStore(StrStore strStore)throws Exception{
		daoSupport.update("StrStoreMapper.deleteStrStore", strStore);
	}
	
}
