package com.test;


import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.admin.entity.system.User;
import com.admin.service.monitor.MonitorService;
import com.admin.util.Logger;
import com.admin.util.PageData;
import com.alibaba.fastjson.JSON;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:spring/ApplicationContext.xml"})
public class MonitorTest {
	
	private Logger logger = Logger.getLogger(this.getClass());
	
	@Autowired
	private MonitorService monitorService;
	
	@Test
	public void testSaveMonitor() throws Exception {
		PageData pageData = new PageData();
		pageData.put("className", "user");
		pageData.put("jsonString", "id:6,userName:user");
		pageData.put("stsCD", "A");
		monitorService.saveMonitor(pageData);
	}
	
	@Test
	public void testFindMonitorById() throws Exception {
		logger.info("-----info------------");
		logger.debug("--------debug-------------------");
		PageData pageData = new PageData();
		pageData.put("morId", "1");
		PageData pageDataRes = monitorService.findMonitorById(pageData);
		System.out.println(JSON.toJSON(pageDataRes));
		/*String className = pageDataRes.getString("CLASS_NAME");
		String jsonString = pageDataRes.getString("JSON_STRING");
		System.out.println("className=" + className + ",jsonString=" + jsonString);
		User user = (User)JSON.parseObject(jsonString, Class.forName(className));
		System.out.println("user" + user);*/
		
		
		
	}
	
	@Test
	public void testJsonParse()  throws Exception {
		System.out.println(User.class);
		System.out.println(Class.forName("com.admin.entity.system.User"));
		User user = new User();
		user.setUSER_ID("1");
		user.setNAME("test");
		user.setPASSWORD("123456");
		user.setSTATUS("A");
		System.out.println(JSON.toJSON(user));
		logger.debug("test");
		
	}
	
	@Test
	public void testFindMonitorList() throws Exception {
		PageData pageData = new PageData();
		List<PageData> pageDataList = monitorService.findMonitorListWithPage(pageData);
		logger.debug(pageDataList);
	}

}
