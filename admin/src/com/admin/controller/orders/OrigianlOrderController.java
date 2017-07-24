package com.admin.controller.orders;
/*
 * 
 */
import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

import javax.annotation.Resource;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.admin.controller.base.BaseController;
import com.admin.entity.StrStore;
import com.admin.entity.orders.AddressModify;
import com.admin.entity.orders.Fretemp;
import com.admin.entity.orders.OriginalOrderAndAddress;
import com.admin.entity.orders.OriginalOrderItems;
import com.admin.entity.orders.OriginalOrders;
import com.admin.entity.orders.PayPara;
import com.admin.entity.orders.SaoSalesOrder;
import com.admin.entity.orders.SaoSalesOrderItems;
import com.admin.entity.orders.ShaShippingAddress;
import com.admin.service.dropshipper.StrStoreService;
import com.admin.service.orders.FreightService;
import com.admin.service.orders.OriginalOrderItemsService;
import com.admin.service.orders.OriginalOrderService;
import com.admin.service.orders.SaoSalesOrderItemsService;
import com.admin.service.orders.SaoSalesOrderService;
import com.admin.service.orders.ShaShippingAddressService;
import com.admin.service.system.menu.MenuService;

import com.admin.controller.*;
import com.admin.util.Const;
import com.admin.util.PageData;
import com.alibaba.fastjson.JSON;


//import com.admin.service.product.ProductService;
//import com.admin.service.product.packages.PackageService;
//import com.admin.entity.ProductBean;
//import com.admin.entity.productEntity.PackageBean;
@Controller
@RequestMapping(value = "/orders")
public class OrigianlOrderController extends BaseController{
	
	@Autowired
	private  OriginalOrderItemsService originalOrderItemsService;
	
	@Autowired
	private OriginalOrderService originalOrderService;
	
	@Autowired
	private ShaShippingAddressService shaShippingAddressService;
	
	@Autowired
	private SaoSalesOrderItemsService saoSalesOrderItemsService;
	
	@Autowired
	private SaoSalesOrderService saoSalesOrderService;

	@Autowired
	private StrStoreService strStoreService;
	
	@Autowired
	private FreightService freightService;
	
	//@Autowired 
	//private ProductService 	productService;
	
	//@Autowired
	//private PackageService packageService;
	
	/*
	@RequestMapping(value="/findAllOriginalOrders")
	public ModelAndView findAllOriginalOrders() throws Exception {
		List<OriginalOrders> originalOrdersList=new ArrayList<OriginalOrders>();
		originalOrdersList=originalOrderService.findOriginalOrder();
		ModelAndView mv=new ModelAndView();
		mv.setViewName("/");
		mv.addObject("originalOrdersList",originalOrdersList);
		return mv;
	}
	*/
	
	/*
	@RequestMapping(value="/findOriginalOrderById",produces="text/html;charset=UTF-8")
	@ResponseBody
	public String findOriginalOrderById(@RequestBody OriginalOrders originalOrders) throws Exception
	{
		originalOrders=originalOrderService.findOriginalOrderById(originalOrders.getStoId());
		return JSON.toJSONString(originalOrders);	
	}
	*/
	/*
	 * 
	 * 录入原始订单，收货地址和原始订单中的list明细
	 */
	@RequestMapping(value="/addOriginalOrderAndAddressAndItems",produces="text/html;charset=UTF-8")
	@ResponseBody
	public String addOriginalOrderAndAddress(@RequestBody OriginalOrderAndAddress entity){
		OriginalOrders originalOrders=new OriginalOrders();
		//此处要获取的，前端必须录入！！！否则可能有非空字段而导致插入失败
		originalOrders.setStrId(entity.getOriginalOrders().getStrId());			//重点内容，与借卖方关联，通过借卖方查看他的所有网店
		originalOrders.setOrderId(entity.getOriginalOrders().getOrderId());
		originalOrders.setCreatedBy(entity.getOriginalOrders().getCreatedBy());
		Date d = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String dateNowStr = sdf.format(d);
		originalOrders.setOrderCreatedTime(dateNowStr);
		originalOrders.setStsCd('A');
		try{
			originalOrderService.saveOriginalOrder(originalOrders);		//原始订单录入
		}catch (Exception e) 
		{
			logger.error("保存原始订单失败结果失败！！！！！！！！！！！！！！！！！！！！！！！！！！！", e);
		}
		
		ShaShippingAddress shaShippingAddress=new ShaShippingAddress();
		shaShippingAddress.setStoId(originalOrders.getStoId());
		shaShippingAddress.setStsCd('A');
		shaShippingAddress.setFamilyName(entity.getShaShippingAddress().getFamilyName());
		shaShippingAddress.setGivenName(entity.getShaShippingAddress().getGivenName());
		if(entity.getShaShippingAddress().getCountryName()!=null)
			shaShippingAddress.setCountryName(entity.getShaShippingAddress().getCountryName());
		shaShippingAddress.setCountryIsoCd(entity.getShaShippingAddress().getCountryIsoCd());	//非空字段
		shaShippingAddress.setStateOrProvinceName(entity.getShaShippingAddress().getStateOrProvinceName());
		shaShippingAddress.setStateOrProvinceCd(entity.getShaShippingAddress().getStateOrProvinceCd());
		shaShippingAddress.setCityName(entity.getShaShippingAddress().getCityName());
		shaShippingAddress.setAddressLine1(entity.getShaShippingAddress().getAddressLine1());
		shaShippingAddress.setPostalCd(entity.getShaShippingAddress().getPostalCd());		//非空字段
		if(entity.getShaShippingAddress().getContactPhoneNo()!=null)
			shaShippingAddress.setContactPhoneNo(entity.getShaShippingAddress().getContactPhoneNo());
		if(entity.getShaShippingAddress().getEmail()!=null)
			shaShippingAddress.setEmail(entity.getShaShippingAddress().getEmail());
		if(entity.getShaShippingAddress().getCityName()!=null)
			shaShippingAddress.setCarrierName(entity.getShaShippingAddress().getCityName());
		try{
			shaShippingAddressService.saveShaShippingAddress(shaShippingAddress);	//原始订单收货地址录入
		}catch (Exception e){
			logger.error("保存原始订单收货地址失败！！！！！！！！！！！！！！！！！！！！！！！！！！！！", e);
		}
		
		List<OriginalOrderItems> orderItems=entity.getOrderItems();
		//原始订单明细的skuNo必须需要，没有这个值无法拆分订单。
		for(Iterator<OriginalOrderItems> i=orderItems.iterator();i.hasNext();)
		{	
			OriginalOrderItems originalOrderItems=new OriginalOrderItems();
			originalOrderItems=i.next();
			originalOrderItems.setStoId(originalOrders.getStoId());
			try{
				originalOrderItemsService.saveOriginalOrderItems(originalOrderItems);	//原始订单明细录入
			}
			catch (Exception e){
				logger.error("保存原始订单明细失败！！！！！！！！！！！！！！！！！！！！！！！！！！！！", e);
			}
			
			String skuNo=originalOrderItems.getSkuNO();
			//通过该原始订单明细的sku_NO查找商品ID-----通过查找pro_product   find proid by skuno
			/*List<ProductBean> productBean=new ArrayList();
			PageData pageData1=new PageData();
			pageData1.put("skuCd", "skuNo");
			try{
			productBean=productService.selectIDProductBySKUCD(pageData1);}
			catch(Exception e){
				logger.error("失败");
			}
			
			int proId=productBean.get(0).getProId();
			*/
			int proId=1;
			/*
			 * @author kxy
			 * 创建销售订单
			 */
			
			SaoSalesOrder saoSalesOrder=new SaoSalesOrder();
			saoSalesOrder.setStsCd("A");
			
			// 需要通过sku_NO查找制造商MAN_ID----通过查找pro_product   find proid by skuno
			
			//int manId=productBean.get(0).getManId();
			int manId=1;	
			saoSalesOrder.setManId(manId);
			
			//需要通过PRO_ID 查找WAR_ID ------通过查找pck_package_info
			/*PageData pageData2 =new PageData();
			pageData2.put("proId", "proId");
			PackageBean packageBean=new PackageBean();
			try{
				packageBean=packageService.findPackageByPROD(pageData2);
				
			}catch(Exception e){
				e.printStackTrace();
			}
			int warId=packageBean.getProId();
			*/
			int warId=1;
			saoSalesOrder.setWarId(warId);
			saoSalesOrder.setOrderSts("1");		//支付状态
			float qty=(float)originalOrderItems.getQty();
			float price =originalOrderItems.getSalesPrice().floatValue();
			float AllPrice=qty*price;
			BigDecimal productAmount=new BigDecimal(AllPrice);
			saoSalesOrder.setProductAmount(productAmount);
			saoSalesOrder.setOrderNo("SO00000001");			//这个还暂时没想好怎么生成（非空字段）
			saoSalesOrder.setStoId(originalOrderItems.getStoId());
			try{
				saoSalesOrderService.saveSaoSalesOrder(saoSalesOrder);
			}catch (Exception e){
				logger.error("保存销售订单失败！！！！！！！！！！！！！！！！！！！！！！！！！！！！", e);
			}
			
			/*
			 *@author kxy
			 * 创建销售订单明细
			 */
			SaoSalesOrderItems saoSalesOrderItems=new SaoSalesOrderItems();
			if(originalOrderItems.getCreatedBY()!=null)
				saoSalesOrderItems.setCreatedBy(originalOrderItems.getCreatedBY());
			saoSalesOrderItems.setStsCd("A");
			saoSalesOrderItems.setSaoId(saoSalesOrder.getSaoId());
			saoSalesOrderItems.setProId(proId);
			saoSalesOrderItems.setQty(originalOrderItems.getQty());
			saoSalesOrderItems.setPrice(originalOrderItems.getSalesPrice());
			saoSalesOrderItems.setSolId(originalOrderItems.getSolId());
			try{
				saoSalesOrderItemsService.saveSaoSalesOrderItems(saoSalesOrderItems);
			}catch (Exception e){
				logger.error("保存销售订单明细失败！！！！！！！！！！！！！！！！！！！！！！！！！！！！", e);
			}
		}
		return "新增成功";		//这个地方没有转json字符串
	}
	
	/*
	 * 
	 * 显示所有销售订单
	 * url提交
	 * 无参数
	 * (已完成测试)
	 */
	@RequestMapping(value="/showSaoSalesOrderItems",produces="text/html;charset=UTF-8")
	public ModelAndView showSaoSalesOrderItems(){
		Subject currentUser=SecurityUtils.getSubject();
		Session session=currentUser.getSession();
		//String manBuyerId=session.getAttribute(Const.MAN_BUYER_ID);
		//int mBuyerId=Integer.parseInt(manBuyerId);
		int mBuyerId=5;
		//需要通过manbyid找到它对应的所有网店
		StrStore strStore=new StrStore();
		strStore.setDsrId(mBuyerId);
		List<SaoSalesOrder> saoSalesOrderListAll=new ArrayList<SaoSalesOrder>();
		List<StrStore> strStorelist=new ArrayList<StrStore>();
		try{
			//通过借卖方id,查询他名下的所有网店
			strStorelist =strStoreService.findStoreByDsrId(strStore);
		}catch (Exception e){
			logger.error("通过借卖方id查询对应网店列表失败！！！！！！！！！！！！！！！！！！！！！！！！！！！", e);
		}

		for(Iterator<StrStore> i=strStorelist.iterator();i.hasNext();)
		{
			int strId=i.next().getStrId();
			//通过网店找原始订单
			List<OriginalOrders> originalOrdersList=new ArrayList<OriginalOrders>();
			try{
				originalOrdersList=originalOrderService.findOriginalOrderByStrId(strId);
			}catch (Exception e){
				logger.error("通过网店原始订单列表失败！！！！！！！！！！！！！！！！！！！！！！！！！！！", e);
			}
			//通过原始订单id查找他名下的所有销售订单
			for(Iterator<OriginalOrders> j=originalOrdersList.iterator();j.hasNext();)
			{
				int stoId=j.next().getStoId();
				List<SaoSalesOrder> saoSalesOrderList=new ArrayList<SaoSalesOrder>();
				//通过原始订单再找到对应
				try{
					saoSalesOrderList=saoSalesOrderService.findSaoSalesOrderByStoId(stoId);
				}catch (Exception e){
					logger.error("通过网店原始订单查询销售订单列表失败！！！！！！！！！！！！！！！！！！！！！！！！！！！", e);
				}
				for(Iterator<SaoSalesOrder> k=saoSalesOrderList.iterator();k.hasNext();)
				{
					saoSalesOrderListAll.add(k.next());
				}
			}
		}
		ModelAndView mv=new ModelAndView();
		mv.setViewName("drop_shipper_order/orderList");		//前端跳转页面
		mv.addObject("saoSalesOrderListAll", saoSalesOrderListAll);
		return mv; 
	}

	/*
	 * 
	 * 打开支付页面
	 * url传值
	 * saoId
	 * (测试完成)
	 */
    @RequestMapping(value = "/getOrderInformation",produces="text/html;charset=UTF-8")
    public ModelAndView getUrlParam(){ 
    	PageData pd=this.getPageData();
    	String saoId1=pd.getString("saoId");
    	ModelAndView mv = new ModelAndView();
		SaoSalesOrder saoSalesOrder=new SaoSalesOrder();
		int Id=Integer.parseInt(saoId1);
		try{
			saoSalesOrder=saoSalesOrderService.findSaoSalesOrderById(Id);
		}catch (Exception e){
			logger.error("通过销售订单id查询销售订单失败！！！！！！！！！！！！！！！！！！！！！！！！！！！", e);
		}
		mv.addObject("saoSalesOrder", saoSalesOrder);		//销售订单
		BigDecimal saoSalesPrice=saoSalesOrder.getProductAmount();
		mv.addObject("saoSalesPrice", saoSalesPrice);		//商品总价
        SaoSalesOrderItems saoSalesOrderItems=new SaoSalesOrderItems();
        try{
        	saoSalesOrderItems=saoSalesOrderItemsService.findSaoSalesOrderItemsBySaoId(Id);
        }catch (Exception e){
        	logger.error("通过销售订单id查询销售订单明细失败！！！！！！！！！！！！！！！！！！！！！！！！！！！", e);
        }
	    mv.addObject("saoSalesOrderItems",saoSalesOrderItems);		//销售订单明细
	    int stoId=saoSalesOrder.getStoId();
	    ShaShippingAddress shaShippingAddress=new ShaShippingAddress();
	    try{
	    	shaShippingAddress=shaShippingAddressService.getShaShippingAddressBystoId(stoId);
	    }catch (Exception e){
	    	logger.error("通过原始订单id查询收货地址失败！！！！！！！！！！！！！！！！！！！！！！！！！！！", e);
	    }
	    mv.addObject("shaShippingAddress", shaShippingAddress);		//该订单的收货地址
    	mv.setViewName("drop_shipper_order/order_show");		//前端设置，跳转到支付页面
    	return mv;
    }
    
    /*
     * 
     * 支付页面
     * url传值
     * saoId
     * 已测试
     */
    @RequestMapping(value = "/goPayForSalesOrder",produces="text/html;charset=UTF-8")
    public ModelAndView goPayForSalesOrder(){
    	PageData pageData=this.getPageData();
    	int saoId=Integer.parseInt(pageData.getString("saoId"));
    	
    	SaoSalesOrder saoSalesOrders=new SaoSalesOrder();
    	try{
    		saoSalesOrders=saoSalesOrderService.findSaoSalesOrderById(saoId);
    	}catch (Exception e){
    		logger.error("通过销售订单id查询销售订单失败！！！！！！！！！！！！！！！！！！！！！！！！！！！", e);
    	}
    	
    	ModelAndView mv=new ModelAndView();
    	BigDecimal freightCost=saoSalesOrders.getFreightCost();
    	BigDecimal saoSalesPrice=saoSalesOrders.getProductAmount();
    	BigDecimal allPrice=freightCost.add(saoSalesPrice);
    	mv.addObject("allPrice", allPrice);
    	mv.addObject("saoId",saoId);
    	/*
    	 * 之前前台获取到了运费和商品总价，计算支付金额，与这个allPrice比对
    	 * 若不同，那说明计算有误（注意精度的处理）。前端禁止支付。
    	 */
    	mv.setViewName("drop_shipper_order/pay_confirm");		//前端设置跳转页面
    	return mv;
    }
    
    /*
     * 
     * 点击最终的支付按钮所调用的方法
     * （已完成测试）
     * url传值
     * saoId,allPrice,payMethod
     */
    @RequestMapping(value = "/payForSalesOrder",produces="text/html;charset=UTF-8")
    @ResponseBody
    public String payForSalesOrder() throws Exception
    {
    	PageData pageData = this.getPageData();
    	int saoId=Integer.valueOf(pageData.getString("saoId"));
    	BigDecimal allPrice=new BigDecimal(pageData.getString("allPrice"));
    	//int payMethod=Integer.valueOf(pageData.getString("payMethod")); 自己从数据库获取啦
    	//调用钱包接口减钱
    	SaoSalesOrder saoSalesOrder=new SaoSalesOrder();
    	saoSalesOrder=saoSalesOrderService.findSaoSalesOrderById(saoId);
		//ConsumeController cc=new ConsumeController();
		//String s=cc.consumeRequest(saoId,saoSalesOrder.getManId(),allPrice,payMethod);
    	SaoSalesOrder saoSalesOrder1=new SaoSalesOrder();
    	saoSalesOrder1.setSaoId(saoId);
    	saoSalesOrder1.setOrderSts("2");
    	saoSalesOrderService.updateOriginalOrder(saoSalesOrder1);
    	//if(s.equals("success"))
    		//return "支付成功";
    	return "支付失败";
    }
    
    
    /*
     * 修改地址
     * (已完成测试)
     * 对象实体传值
     */
	@RequestMapping(value="/AddressModify",produces="text/html;charset=UTF-8")
	@ResponseBody
	public String AddressModify(@RequestBody AddressModify addrentity) throws Exception{
		System.out.println(JSON.toJSON(addrentity));
		int saoId2 = addrentity.getSaoId();//获得传入的销售订单的id值
		SaoSalesOrder stoIdEntity = saoSalesOrderService.findSaoSalesOrderById(saoId2);
		System.out.println(JSON.toJSON(stoIdEntity));
		int stoId2 = stoIdEntity.getSaoId();//根据销售订单的SAOID得到原始订单的STOID
		ShaShippingAddress newaddress = new ShaShippingAddress();//创建新的地址表实体
		newaddress.setCreatedBy(addrentity.getCreatedBy());
		newaddress.setCreationDate(addrentity.getCreationDate());
		newaddress.setLastUpdateBy(addrentity.getLastUpdateBy());
		newaddress.setLastUpdateDate(addrentity.getLastUpdateDate());
		newaddress.setCallCnt(addrentity.getCallCnt());
		newaddress.setRemark(addrentity.getRemark());
		newaddress.setStsCd('A');
		newaddress.setFamilyName(addrentity.getFamilyName());
		newaddress.setGivenName(addrentity.getGivenName());
		newaddress.setCountryName(addrentity.getCountryName());
		newaddress.setCountryIsoCd(addrentity.getCountryIsoCd());
		newaddress.setStateOrProvinceName(addrentity.getStateOrProvinceName());
		newaddress.setStateOrProvinceCd(addrentity.getStateOrProvinceCd());
		newaddress.setCityName(addrentity.getCityName());
		newaddress.setAddressLine1(addrentity.getAddressLine1());
		newaddress.setAddressLine2(addrentity.getAddressLine2());
		newaddress.setAddressLine3(addrentity.getAddressLine3());
		newaddress.setPostalCd(addrentity.getPostalCd());
		newaddress.setContactPhoneNo(addrentity.getContactPhoneNo());
		newaddress.setEmail(addrentity.getEmail());
		newaddress.setStoId(stoId2);//将查询到的stoid放入该新地址表实体
		newaddress.setCarrierName(addrentity.getCarrierName());
		System.out.println(JSON.toJSON(newaddress));
		shaShippingAddressService.updateShaShippingAddressById(newaddress);	//地址表更改 update
		return "true";
	}
	
	
	/*
	 * 
	 * 计算运费
	 * (已完成最终测试)
	 * url传值
	 * 
	 * 地址修改之后必须重新提交计算运费申请！！！！！
	 */
	@RequestMapping(value="/calculateFreight",produces="text/html;charset=UTF-8")
	@ResponseBody
	public String calFre() {
		String freightStr = new String();
			PageData pageData = this.getPageData();
			System.out.println("----------------------------------------------debugggggg");
			int saoId1 =Integer.parseInt(pageData.getString("saoId"));
			System.out.println(saoId1);
    		String freCompany1 = (String)pageData.getString("freCompany");
    		System.out.println(freCompany1);
    		SaoSalesOrderItems qtyEntity=new SaoSalesOrderItems();
    		try{
    			 qtyEntity= saoSalesOrderItemsService.findSaoSalesOrderItemsBySaoId(saoId1);
    		}catch (Exception e)
    		{
    			logger.error("查询销售订单条目失败！！！！！！！！！！！！！！！！！！！！！！！！！！！", e);
    		}
    		int qty1 = qtyEntity.getQty();//根据销售订单号saoid获取商品数量
    		
    		SaoSalesOrder stoIdEntity=new SaoSalesOrder();
    		try{
    		stoIdEntity = saoSalesOrderService.findSaoSalesOrderById(saoId1);
    		}catch (Exception e)
    		{
    			logger.error("查询销售订单失败！！！！！！！！！！！！！！！！！！！！！！！！！！！", e);
    		}
    		int stoId1 = stoIdEntity.getSaoId();//根据销售订单号saoid获取原始订单号stoid
    		int warId1 = stoIdEntity.getWarId();//销售订单号saoid获取仓库号warid
    		ShaShippingAddress proCdEntity=new ShaShippingAddress();
    		try{
    			proCdEntity = shaShippingAddressService.getShaShippingAddressBystoId(stoId1);
    		}catch (Exception e)
    		{
    			logger.error("查询订单地址失败！！！！！！！！！！！！！！！！！！！！！！！！！！！", e);
    		}
    		System.out.println("----------------------------------------------111111111");
    		String pcd=proCdEntity.getStateOrProvinceCd();
    		System.out.println(pcd);
    		Fretemp shipProFre=new Fretemp();
    		shipProFre.setFreCompany(freCompany1);
    		shipProFre.setDesProvinceId(pcd);	
    		shipProFre.setWarId(warId1);//将仓库号、快递公司和收货省编号三个字段放入新建Fretemp实体
    		Fretemp unitFreEntity=new Fretemp();
    		
    		try{
    			unitFreEntity = freightService.findUnitfreByShipPro(shipProFre);
    		}catch(Exception e)
    		{
    			logger.error("查询单元运费失败！！！！！！！！！！！！！！！！！！！！！！！！！！！", e);
    		}
    		BigDecimal unitfre = unitFreEntity.getFreFee();//查询，得到单元运费
    		
    		double unitfre1 = 1.0;//unitfre.doubleValue();
    		double freight = qty1 * unitfre1;//计算=单元运费*商品数量
    		BigDecimal fre = new BigDecimal(freight);
    		SaoSalesOrder freSave = new SaoSalesOrder();
    		freSave.setFreightCost(fre);
    		freSave.setSaoId(saoId1);
    		try{
    			saoSalesOrderService.updateOriginalOrder(freSave);//更新运费数据
    		}catch (Exception e)
    		{
    			logger.error("计算/运费失败！！！！！！！！！！！！！！！！！！！！！！！！！！！", e);
    		}
    		freightStr = String.valueOf(freight);//运费double类型转换为字符串String类型
    		
		return freightStr; 
	}
	
}
