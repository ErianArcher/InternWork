package com.admin.controller.monitor;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.admin.controller.base.BaseController;
import com.admin.entity.Page;
import com.admin.service.monitor.MonitorService;
import com.admin.util.PageData;
import com.alibaba.fastjson.JSON;

/**
 * 
 * @Date 2017年7月11日下午1:40:47
 * @author linkaitao
 * @Desc 提供前端模拟调用的控制层
 */
@Controller
@RequestMapping(value="/monitor")
public class MonitorController extends BaseController {
	
	@Autowired
	private MonitorService monitorService;
	/**
	 * 
	 * @Date 2017年7月11日下午2:14:07
	 * @author linkaitao
	 * @Desc 打开添加页面
	 */
	@RequestMapping(value="/goAddMonitor")
	public ModelAndView goAddMonitor() {
		ModelAndView modelAndView = new ModelAndView();
		/**
		 * 待实现
		 */
		return modelAndView;
	}
	
	/**
	 * 
	 * @Date 2017年7月11日下午2:14:07
	 * @author linkaitao
	 * @Desc 打开编辑页面
	 */
	@RequestMapping(value="/goEditMonitor")
	public ModelAndView goEditMonitor() {
		ModelAndView modelAndView = new ModelAndView();
		/**
		 * 待实现
		 */
		return modelAndView;
	}
	
	/**
	 * 
	 * @Date 2017年7月11日下午2:14:07
	 * @author linkaitao
	 * @Desc 保存信息
	 */
	@RequestMapping(value="/saveMonitor")
	public ModelAndView saveMonitor() {
		ModelAndView modelAndView = new ModelAndView();
		/**
		 * 待实现
		 */
		return modelAndView;
	}
	
	/**
	 * 
	 * @Date 2017年7月11日下午2:14:07
	 * @author linkaitao
	 * @throws Exception 
	 * @Desc 查询模拟结果
	 */
	@RequestMapping(value="/findMonitor")
	@ResponseBody
	public String findMonitor() {
		String result = "";
		PageData pageData = this.getPageData();
		logger.debug("pageData=" + JSON.toJSONString(pageData));
		try {
			PageData pageDataResp = monitorService.findMonitorById(pageData);
			String jsonString = (String) pageDataResp.get("JSON_STRING");
			result = jsonString;
			logger.debug("查询模拟结果:" + result);
		} catch (Exception e) {
			logger.error("查询模拟结果失败", e);
		}
		return result;
	}
	
	/**
	 * 
	 * @Date 2017年7月11日下午2:14:07
	 * @author linkaitao
	 * @throws Exception 
	 * @Desc 查询模拟结果
	 */
	@RequestMapping(value="/findMonitorView")
	@ResponseBody
	public ModelAndView findMonitorView() {
		ModelAndView modelAndView = new ModelAndView();
		PageData pageData = this.getPageData();
		String viewName = (String)pageData.get("viewName");
		logger.debug("viewName=" + viewName);
		if (StringUtils.isEmpty(viewName)) {
			viewName = "monitor/monitorList";
		}
		modelAndView.setViewName(viewName);
		return modelAndView;
	}
	
	/**
	 * 
	 * @Date 2017年7月11日下午1:57:36
	 * @author linkaitao
	 * @Desc 模拟结果列表
	 */
	@RequestMapping(value="/showMonitorList")
	public ModelAndView showMonitorList(HttpSession session, Page page) {
		ModelAndView modelAndView = new ModelAndView();
		PageData pageData = this.getPageData();
		try {
			List<PageData> pageDataList = monitorService.findMonitorListWithPage(pageData);
			modelAndView.addObject("pageDataList", pageDataList);
			modelAndView.setViewName("monitor/monitorList");
		} catch (Exception e) {
			logger.error("查询模拟结果列表异常", e);
		}
		return modelAndView;
	}
	
	/*
	 * Test request
	 */
	@RequestMapping(value="/testRequest")
	@ResponseBody
	public ModelAndView testRequest() {
		/*
		ModelAndView modelAndView = new ModelAndView();
		PageData pageData = this.getPageData();
		try {
			String msg = (String) pageData.get("msg");
			modelAndView.addObject("msg", msg);
			modelAndView.setViewName("drop_shipper_order/orderPayment");
		} catch (Exception e) {
			// TODO: handle exception
			logger.error("msg error", e);
		}
		return modelAndView;
		*/
		ModelAndView modelAndView = new ModelAndView();
		PageData pageData = this.getPageData();
		String viewName = (String)pageData.get("viewName");
		logger.debug("viewName=" + viewName);
		if (StringUtils.isEmpty(viewName)) {
			viewName = "monitor/monitorList";
		}
		modelAndView.setViewName(viewName);
		return modelAndView;
	}
}
