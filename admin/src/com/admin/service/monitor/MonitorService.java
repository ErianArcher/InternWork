package com.admin.service.monitor;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.admin.dao.DaoSupport;
import com.admin.util.PageData;

@Service("monitorService")
public class MonitorService {
	
	@Resource(name = "daoSupport")
	private DaoSupport daoSupport;
	
	/**
	 * @Date 2017年7月11日下午4:14:31
	 * @author linkaitao
	 * @Desc 模拟结果列表
	 */
	public List<PageData> findMonitorListWithPage(PageData pageData) throws Exception {
		return (List<PageData>) daoSupport.findForList("MonitorMapper.findMonitorListWithPage", pageData);
	}
	
	/**
	 * @Date 2017年7月11日下午4:16:36
	 * @author linkaitao
	 * @Desc 新增模拟结果
	 */
	public void saveMonitor(PageData pageData) throws Exception {
		daoSupport.save("MonitorMapper.saveMonitor", pageData);
	}
	
	/**
	 * @Date 2017年7月11日下午4:17:52
	 * @author linkaitao
	 * @Desc 更新模拟结果
	 */
	public void updateMonitor(PageData pageData) throws Exception {
		daoSupport.update("MonitorMapper.updateMonitor", pageData);
	}
	
	/**
	 * @Date 2017年7月11日下午4:19:10
	 * @author linkaitao
	 * @Desc 根据id查询模拟结果
	 */
	public PageData findMonitorById(PageData pageData) throws Exception{
		return (PageData)daoSupport.findForObject("MonitorMapper.findMonitorById", pageData);
	}
	
	
}
