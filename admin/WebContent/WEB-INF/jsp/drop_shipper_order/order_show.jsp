<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="<%=basePath%>"><!-- jsp文件头和头部 -->

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
<script src="https://cdn.bootcss.com/jquery/2.1.1/jquery.min.js"></script>

<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
<script
	src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<!-- 新 Bootstrap 核心 CSS 文件 -->
<link
	href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css"
	rel="stylesheet">

<style type="text/css">
#send div.sendMethod {
	float:left;
	margin-left:10px;
	font-size:14px;
}
#send div.sendButton {
	float:right;
	margin-right:10px;
	font-size:14px;
}
div#orderDetails {
	margin: 20px;
	-webkit-box-shadow: 3px 3px 3px grey;  
  	-moz-box-shadow: 3px 3px 3px grey;  
  	box-shadow: 3px 3px 3px grey;  
}

</style>

<title>Order</title>
</head>
<body>
	<div class="container">
		<form name="order" role="form" method="post" action="" onsubmit="">
			<div id="receiveAddress" class="table-responsive">
				<table class="table">
					<caption>收货地址：</caption>
					<thead>
						<tr>
							<th>姓</th>
							<th>名</th>
							<th>联系电话</th>
							<th>邮箱</th>
							<th>国家</th>
							<th>省份</th>
							<th>城市名</th>
							<th>详细地址</th>
							<th>邮编</th>
							<th>国家编码</th>
							<th>省份编码</th>
							<th>操作</th>
						</tr>
					</thead>
					<tbody>
						<tr>
						<td>${shaShippingAddress.familyName}</td>
						<td>${shaShippingAddress.givenNamecontactPhoneNo}</td>
						<td>${shaShippingAddress.contactPhoneNo}</td>
						<td>${shaShippingAddress.email}</td>
						<td>${shaShippingAddress.countryName}</td>
						<td>${shaShippingAddress.stateOfProvinceName}</td>
						<td>${shaShippingAddress.cityName}</td>
						<td>${shaShippingAddress.addressLine1}</td>
						<td>${shaShippingAddress.postalCd}</td>
						<td>${shaShippingAddress.countryIsoCd}</td>
						<td>${shaShippingAddress.stateOfProvinceCd}</td>
						<td style="width: 30px;" class="center">
											<c:if test="${QX.edit != 1 && QX.del != 1 }">
											<span class="label label-large label-grey arrowed-in-right arrowed-in"><i class="icon-lock" title="无权限"></i></span>
											</c:if>
											<div>
											<c:if test="${QX.edit == 1 }">
											<a style="cursor:pointer;" title="编辑" onclick="edit('${saoSaleOrder.saoId}');">edit</a>
											</c:if>
											<c:if test="${QX.del == 1 }">
											
											</c:if>
										</div>
								
						</td>
						</tr>
					</tbody>
				</table>
				
			</div>

			<div id="orderDetails">
				<div id="commodityList">
					<table class="table table-bordered">
						<caption>商品清单:</caption>
						<thead>
							<tr>
								<th>商品SUK</th>
								<th>商品图片</th>
								<th>商品名字</th>
								<th>商品单价</th>
								<th>商品数量</th>
							</tr>
						</thead>
						<tbody>    
							
							<!-- 开始循环 -->	
							<c:choose>
								<c:when test="${not empty saoSaleOrderList}">
								<c:if test="${QX.cha == 1 }">
								<c:forEach items="${saoSaleOrderList}" var="saoSaleOrder" varStatus="vs">
								<tr>
								<!-- xuhao -->								
								<td class='center' style="width: 30px;">${vs.index+1}</td>
								<!--from tupian to shuliang -->
								<td>${var.skuNo}</td>				
										<td>
										<img src="http://imgsrc.baidu.com/baike/pic/item/6a63f6246b600c338f25aa7f1a4c510fd9f9a12c.jpg" ></a>
										</td>							
										<td>${var.ptoId}</td>
										<td>${var.price}</td>
										<td>${var.qty}</td>			
								</tr>
						
								</c:forEach>
								</c:if>
						<c:if test="${QX.cha == 0 }">
							<tr>
								<td colspan="100" class="center">您无权查看</td>
							</tr>
						</c:if>
						</c:when>
						<c:otherwise>
							<tr class="main_info">
							<td colspan="100" class="center">没有相关数据</td>
							</tr>
						</c:otherwise>
						</c:choose>

						</tbody>
					</table>
				</div>
				
				<div id="postage">
					<div style="margin-left:10px;">
						<label>邮费：</label>
						<label>${saoSaleOrder.freightCost}</label>
					</div>	
				</div>
				
				<div id="totalPrice">
					<div style="margin-left:10px">
						<label>总价：</label>
						<label>${saoSaleOrder.productAmount}</label>
					</div>
				</div>
			</div>

			<div id="remark">
				<div class="form-group">
					<label for="customerRemark">买家留言：</label>
					<textarea class="form-control" id="customerRemark" placeholder="可选" rows="1">${saoSaleOrder.remark}</textarea>
				</div>
			</div>

			<div id="send">
				<div class="sendMethod">
					<div>
						<label>运送方式：</label>						
						<label class="checkbox-inline">
							<input name="sendMethod" id="shunfeng" value="shunfeng" type="radio">顺丰
						</label> 
						<label class="checkbox-inline">
							<input name="sendMethod" id="yuntong" value="yuntong" type="radio">圆通
						</label>
						<label class="checkbox-inline">
							<input name="sendMethod" id="zhongtong" value="zhongtong" type="radio">中通
						</label>
					</div>
				</div>
				
				<div class="sendButton">
					<button type="button" class="btn btn-default" onclick="payment()" id ="submitPayment">提交订单</button>
				</div>
			</div>
		</form>
	</div>

		

		

</body>
<script type="text/javascript">
		
		$(top.hangge());		

		//修改
		function edit(Id){
			 top.jzts();
			 var diag = new top.Dialog();
			 diag.Drag=true;
			 diag.Title ="编辑";
			 diag.URL = '<%=basePath%>monitor/findMonitorView.do?viewName=drop_shipper_order/Address_Edit'+Id;
			 diag.Width = 600;
			 diag.Height = 465;
			 diag.CancelEvent = function(){ //关闭事件
				 if(diag.innerFrame.contentWindow.document.getElementById('zhongxin').style.display == 'none'){
					 nextPage();
				}
				diag.close();
			 };
			 diag.show();
		}
		function payment(){
			 top.jzts();
			 var diag = new top.Dialog();
			 diag.Drag=true;
			 diag.Title ="编辑";
			 diag.URL = '<%=basePath%>monitor/findMonitorView.do?viewName=drop_shipper_order/pay_confirm';
			 diag.Width = 300;
			 diag.Height = 200;
			 diag.CancelEvent = function(){ //关闭事件
				 if(diag.innerFrame.contentWindow.document.getElementById('zhongxin').style.display == 'none'){
					 nextPage();
				}
				diag.close();
			 };
			 diag.show();
		}
		
		
		$('#submitPayment').on('click', function() {
			$.ajax({
				type : "post",
				url : '<%=basePath%>'+"orders/addOriginalOrderAndAddressAndItems",
				dataType : "json",
				data : JSON.stringify({
					saoId : '${saoSalesOrder.saoId}',
				}),
				success : function(msg) {
					console.log(msg);
				},
				error : function(msg) {
					console.log(msg);
				}
			});
		});
		
		function getFreCompany(){
			var val=$('input:radio[name="sendMethod"]:checked').val();
			
			return val;	
		}
		$('input:radio[name="sendMethod"]').on('click', function() {
			$.ajax({
				type : "post",
				url: '<%=basePath%>'+"orders/calculateFreight",
				dataType : "json",
				data : JSON.stringify({
					saoId : '${saoSalesOrder.saoId}',
					freCompany: getFreCompany()
				}),
				success : function(data) {
					console.log(data);
				},
				error : function(data) {
					console.log(data);
				}
			});
		});
		

		</script>
</html>

