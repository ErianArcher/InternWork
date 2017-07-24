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
						<td id="familyName">${shaShippingAddress.familyName}</td>
						<td id="givenName">${shaShippingAddress.givenName}</td>
						<td id="contactPhoneNo">${shaShippingAddress.contactPhoneNo}</td>
						<td id="email">${shaShippingAddress.email}</td>
						<td id="countryName">${shaShippingAddress.countryName}</td>
						<td id="stateOrProvinceName">${shaShippingAddress.stateOrProvinceName}</td>
						<td id="cityName">${shaShippingAddress.cityName}</td>
						<td id="addressLine1">${shaShippingAddress.addressLine1}</td>
						<td id="postalCd">${shaShippingAddress.postalCd}</td>
						<td id="countryIsoCd">${shaShippingAddress.countryIsoCd}</td>
						<td id="stateOrProvinceCd">${shaShippingAddress.stateOrProvinceCd}</td>
						<td style="width: 30px;" class="center">
											<c:if test="${QX.edit != 1 && QX.del != 1 }">
											<span class="label label-large label-grey arrowed-in-right arrowed-in"><i class="icon-lock" title="无权限"></i></span>
											</c:if>
											<div>
											<c:if test="${QX.edit == 1 }">
											<button type="button" class="btn btn-primary" id="editAddress"
											data-toggle="modal" data-target="#operateAddressModalBox">修改</button>
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
								
								<th>商品图片</th>
								<th>商品名字</th>
								<th>商品单价</th>
								<th>商品数量</th>
							</tr>
						</thead>
						<tbody>    
							
							<!-- 开始循环 -->	
							<c:choose>
								<c:when test="${not empty saoSalesOrderItems}">
								<tr>
								
								<!--from tupian to shuliang -->
			
										<td>
										<img src="http://imgsrc.baidu.com/baike/pic/item/6a63f6246b600c338f25aa7f1a4c510fd9f9a12c.jpg" ></a>
										</td>							
										<td>${saoSalesOrderItems.proId}</td>
										<td>${saoSalesOrderItems.price}</td>
										<td>${saoSalesOrderItems.qty}</td>			
								</tr>
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
						<label id="frePrice"></label>
					</div>	
				</div>
				
				<div id="totalPrice">
					<div style="margin-left:10px">
						<label>总价：</label>
						<label>${saoSalesPrice}</label>
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

	
	<div class="modal fade" id="operateAddressModalBox" tabindex="-1"
			role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">

					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-hidden="true">×</button>
						<h4 class="modal-title" id="OAModalTitle">收货地址</h4>
					</div>
					<!-- address inputs -->
					<div id="addressInput" class="modal-body" style="overflow-y: auto">
						<div class="row">
							<label for="boxLastName" class="col-sm-2 control-label">姓
								<span class="warning" id="warn_boxLastName">*</span>
							</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="boxLastName"
									value="${shaShippingAddress.familyName}" placeholder="姓氏">
							</div>
						</div>

						<div class="row">
							<label for="boxFirstName" class="col-sm-2 control-label">名
								<span class="warning" id="warn_boxFirstName">*</span>
							</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="boxFirstName"
									value="${shaShippingAddress.givenName}" placeholder="名字">
							</div>
						</div>

						<div class="row">
							<label for="boxPhone" class="col-sm-2 control-label">电话 <span
								class="warning" id="warn_boxPhone">*</span>
							</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="boxPhone"
									value="${shaShippingAddress.contactPhoneNo}" placeholder="电话">
							</div>
						</div>

						<div class="row">
							<label for="boxEmail" class="col-sm-2 control-label">邮箱 <span
								class="warning" id="warn_boxEmail">*</span>
							</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="boxEmail"
									value="${shaShippingAddress.email}" placeholder="邮箱">
							</div>
						</div>

						<div class="row">
							<div class="col-sm-6">
								<label for="boxCountry" class="col-sm-4 control-label">国家
									<span class="warning" id="warn_boxCountry">*</span>
								</label>
								<div class="col-sm-8">
									<input type="text" class="form-control" id="boxCountry"
										value="${shaShippingAddress.countryName}" placeholder="国家">
									</textarea>
								</div>
							</div>

							<div class="col-sm-6">
								<label for="boxCountryCode" class="col-sm-6 control-label">国家编码
									<span class="warning" id="warn_boxCountryCode">*</span>
								</label>
								<div class="col-sm-6">
									<input type="text" class="form-control" id="boxCountryCode"
										value="${shaShippingAddress.countryIsoCd}" placeholder="国家编码">
									</textarea>
								</div>
							</div>
						</div>

						<div class="row">
							<div class="col-sm-6">
								<label for="boxProvince" class="col-sm-4 control-label">省份
									<span class="warning" id="warn_boxProvince">*</span>
								</label>
								<div class="col-sm-8">
									<input type="text" class="form-control" id="boxProvince"
										value="${shaShippingAddress.stateOrProvinceName}" placeholder="省份">
									</textarea>
								</div>
							</div>
							<div class="col-sm-6">
								<label for="boxProvinceCode" class="col-sm-6 control-label">省份编码
									<span class="warning" id="warn_boxProvinceCode">*</span>
								</label>
								<div class="col-sm-6">
									<input type="text" class="form-control" id="boxProvinceCode"
										value="${shaShippingAddress.stateOrProvinceCd}" placeholder="省份编码">
									</textarea>
								</div>
							</div>
						</div>

						<div class="row">
							<label for="boxCity" class="col-sm-2 control-label">城市 <span
								class="warning" id="warn_boxCity">*</span>
							</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="boxCity"
									value="${shaShippingAddress.cityName}" placeholder="城市">
							</div>
						</div>

						<div class="row">
							<label for="boxDetailAddress" class="col-sm-3 control-label">详细地址
								<span class="warning" id="warn_boxDetailAddress">*</span>
							</label>
							<div class="col-sm-9">
								<input type="text" class="form-control" id="boxDetailAddress"
									value="${shaShippingAddress.addressLine1}" placeholder="详细地址">
							</div>
						</div>

						<div class="row">
							<label for="boxZipCode" class="col-sm-2 control-label">邮编
								<span class="warning" id="warn_boxZipCode">*</span>
							</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="boxZipCode"
									value="${shaShippingAddress.postalCd}" placeholder="邮编">
							</div>
						</div>
					</div>

					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
						<button type="button" id="boxConfirmBtn" class="btn btn-primary">保存</button>
					</div>

				</div>
			</div>

		</div>

		

</body>
<script type="text/javascript">
		
		$(top.hangge());		

		var ele = [ 'familyName', 'givenName', 'contactPhoneNo', 'email',
					'countryName', 'stateOrProvinceName', 'cityName',
					'addressLine1', 'postalCd', 'countryIsoCd', 'stateOrProvinceCd' ];
		var origin_ele = [ 'boxLastName', 'boxFirstName', 'boxPhone', 'boxEmail',
				'boxCountry', 'boxProvince', 'boxCity', 'boxDetailAddress',
				'boxZipCode', 'boxCountryCode', 'boxProvinceCode' ];
		//Box confirm button
		$("#boxConfirmBtn")
				.on(
						'click',
						function() {
							var address = {};

							var isIncomplete = false;// Mark if some of the inputs are not filled.

							$.each(ele, function(index, value) {
								var eleId = $('#' + origin_ele[index]);
								var tmp = eleId.val();
								//console.log(tmp);
								if (tmp == "" || tmp == undefined || tmp == null) {
									shake(origin_ele[index]);
									isIncomplete = true;
								} else {
									
									address[value] = tmp;//add value to dict if the value is valid
								}
							});

							if (isIncomplete === false) {
								$
										.each(
												ele,
												function(index, value) {
													$('#'+value).text(address[value]);
													//console.log(value+' '+address[value]);
												});
								$.ajax({
									type : "post",
						            url : "orders/AddressModify",
						            dataType : "json",
						            data : JSON.stringify({
						                shaShippingAddress : address
						            }),
						            success : function(msg) {
						                console.log(msg);
						                
						            },
						            error : function(msg) {
						                console.log(msg);
						            }
								});
								$('#operateAddressModalBox').modal('hide');
							}
						});
		
		function getAddress() {
            var address = {}
            $.each(origin_ele, function(index, value) {
                address[value] = $('input#'+value).val();
            });
            address['saoId'] = parseInt(salesOrderId);
            return address;
        }
		function shake(id) {
			$('#' + id).effect('shake', {
				distance : 5
			});
		}
		
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
			 //diag.show();
		}
		
		var salesOrderId = ${saoSalesOrder.saoId};
		$('#submitPayment').on('click', function() {
			window.location.replace("orders/goPayForSalesOrder?saoId="+salesOrderId);
		});
		
		function getFreCompany(){
			var val=$('input:radio[name="sendMethod"]:checked').val();
			
			return val;	
		}
		$('input:radio[name="sendMethod"]').on('click', function() {
			
			$.ajax({
				type : "post",
				url: "orders/calculateFreight?saoId="+salesOrderId+"&freCompany="+getFreCompany(),
				success : function(data) {
					$('#frePrice').text(data);
					console.log(data);
				},
				error : function(data) {
					console.log(data);
				}
			});
		});
		

		</script>
</html>

