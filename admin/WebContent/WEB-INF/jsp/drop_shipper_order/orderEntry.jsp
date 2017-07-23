<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html>
<head>
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

<script src="https://code.jquery.com/ui/1.12.0/jquery-ui.js"></script>

<base href="<%=basePath%>">

<style type="text/css">
div#commodityEntry {
	margin: 20px;
	-webkit-box-shadow: 3px 3px 3px grey;
	-moz-box-shadow: 3px 3px 3px grey;
	box-shadow: 3px 3px 3px grey;
}

.row {
	padding: 1px;
}

.delete {
	font-size: 14px;
	color: blue;
}

.necessary {
	color: red;
}

.warning {
	float: right;
	color: Red;
	text-decoration: none;
	font-size: 20px;
	font-weight: bold;
	margin-right: 20px;
	display: none;
}
</style>

<title>模拟购物车</title>
</head>
<body>
	<div class="container">
		<div>
			<div id="addressBlock" class="container">
				<div id="receiveAddress" class="table-responsive">
					<table class="table" id="addressTable">
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
							</tr>
						</tbody>
					</table>
					<div class="center">
						<button type="button" class="btn btn-primary" id="addAddress"
							data-toggle="modal" data-target="#operateAddressModalBox">新增收货地址</button>
					</div>
				</div>
			</div>

			<div id="commodityBlock" class="container">
				<div id="commodityEntry" class="container" style="boder: 1px solid">

				</div>

				<div class="row">
					<button type="button" class="btn btn-primary" id="addAddress"
						data-toggle="modal" data-target="#addCommodity">新增商品</button>
				</div>
			</div>
		</div>

		<div class="modal fade" id="addCommodity" tabindex="-1" role="dialog"
			aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-hidden="true">×</button>
						<h4 class="modal-title">商品</h4>
					</div>

					<div class="modal-body">
						<div class="row">
							<label class="col-sm-2" for="commoditySKU">商品SKU</label>
							<div class="col-sm-10">
								<input id="commoditySKU" class="form-control" type="text"
									placeholder="SKU">
							</div>
						</div>

						<div class="row">
							<label class="col-sm-2" for="commodityQuantity">商品数量</label>
							<div class="col-sm-10">
								<input id="commodityQuantity" class="form-control" value="1"
									type="number">
							</div>
						</div>
					</div>

					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
						<button type="button" id="commodityConfirmBtn"
							class="btn btn-primary">保存</button>
					</div>

				</div>
			</div>
		</div>


		<div class="row">
			<div class="text-center">
				<button type="button" class="btn btn-primary" id="submitOrder">提交订单</button>
			</div>
		</div>
	</div>

	<!-- address operation popup box -->
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
								placeholder="姓氏">
						</div>
					</div>

					<div class="row">
						<label for="boxFirstName" class="col-sm-2 control-label">名
							<span class="warning" id="warn_boxFirstName">*</span>
						</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="boxFirstName"
								placeholder="名字">
						</div>
					</div>

					<div class="row">
						<label for="boxPhone" class="col-sm-2 control-label">电话 <span
							class="warning" id="warn_boxPhone">*</span>
						</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="boxPhone"
								placeholder="电话">
						</div>
					</div>

					<div class="row">
						<label for="boxEmail" class="col-sm-2 control-label">邮箱 <span
							class="warning" id="warn_boxEmail">*</span>
						</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="boxEmail"
								placeholder="邮箱">
						</div>
					</div>

					<div class="row">
						<div class="col-sm-6">
							<label for="boxCountry" class="col-sm-4 control-label">国家
								<span class="warning" id="warn_boxCountry">*</span>
							</label>
							<div class="col-sm-8">
								<input type="text" class="form-control" id="boxCountry"
									placeholder="国家">
							</div>
						</div>

						<div class="col-sm-6">
							<label for="boxCountryCode" class="col-sm-6 control-label">国家编码
								<span class="warning" id="warn_boxCountryCode">*</span>
							</label>
							<div class="col-sm-6">
								<input type="text" class="form-control" id="boxCountryCode"
									placeholder="国家编码">
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
									placeholder="省份">
							</div>
						</div>
						<div class="col-sm-6">
							<label for="boxProvinceCode" class="col-sm-6 control-label">省份编码
								<span class="warning" id="warn_boxProvinceCode">*</span>
							</label>
							<div class="col-sm-6">
								<input type="text" class="form-control" id="boxProvinceCode"
									placeholder="省份编码">
							</div>
						</div>
					</div>

					<div class="row">
						<label for="boxCity" class="col-sm-2 control-label">城市 <span
							class="warning" id="warn_boxCity">*</span>
						</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="boxCity"
								placeholder="城市">
						</div>
					</div>

					<div class="row">
						<label for="boxDetailAddress" class="col-sm-3 control-label">详细地址
							<span class="warning" id="warn_boxDetailAddress">*</span>
						</label>
						<div class="col-sm-9">
							<input type="text" class="form-control" id="boxDetailAddress"
								placeholder="详细地址">
						</div>
					</div>

					<div class="row">
						<label for="boxZipCode" class="col-sm-2 control-label">邮编
							<span class="warning" id="warn_boxZipCode">*</span>
						</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="boxZipCode"
								placeholder="邮编">
						</div>
					</div>
				</div>

				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
					<button type="button" id="boxConfirmBtn" class="btn btn-primary">保存</button>
				</div>
				
			</div>
		</div>
</body>

<script type="text/javascript">
	$(top.hangge());

	var ele = [ 'familyName', 'givenName', 'contactPhoneNo', 'email',
				'countryName', 'stateOrProvinceName', 'cityName',
				'addressLine', 'postalCd', 'countryIsoCd', 'stateOrProvinceCd' ];
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
								$('#warn_' + origin_ele[index]).css('display',
										'block');
								shake(origin_ele[index]);
								isIncomplete = true;
							} else {
								$('#warn_' + origin_ele[index]).css('display',
										'none');
								address[value] = tmp;//add value to dict if the value is valid
							}
						});

						if (isIncomplete === false) {
							$
									.each(
											ele,
											function(index, value) {
												$('#addressTable tbody tr')
														.append(
																'<td><input type="hidden" id="'+value+'"name="'+value+'" value="'+
	        											address[value]+'">'
																		+ address[value]
																		+ '</td>');
												//console.log(value+' '+address[value]);
											});
							$('#addressTable tbody tr')
									.append(
											'<td><a href="" id="deleteAddress" class="delete">删除</a></td>');
							$('#addressTable tbody tr')
									.append(
											'<td><button type="button" id="editAddress" class="btn btn-outline-info btn-sm" data-toggle="modal" data-target="#operateAddressModalBox">编辑</button></td>')
							$('#addAddress').css('display', 'none');
							$('#operateAddressModalBox').modal('hide');
						}
					});

	//delete address button
	$('.delete').on('click', function() {
		$('#addAddress').css('display', 'block');
		$(this).closest("tr").children().remove();
	});
	//edit address button

	// add focus action and blur action to the input in modal box
	// focus action: remove necessary hint
	// blur action: check if the necessary field is filled; if not, then hint
	$.each(origin_ele, function(index, value) {
		$('#' + value).on('focus', function() {
			$('#warn_' + value).css('display', 'none');
		});
		$('#' + value).on('blur', function() {
			var tmp = $(this).val();
			if (tmp == "" || tmp == undefined || tmp == null) {
				$('#warn_' + origin_ele[index]).css('display', 'block');
				isIncomplete = true;
			} else {
				$('#warn_' + origin_ele[index]).css('display', 'none');
			}
		});
	});

	var commodityCount = 0;
	$('#commodityConfirmBtn')
			.on(
					'click',
					function() {
						var skuNo = $('#commoditySKU').val();
						var qty = $('#commodityQuantity').val();
						if (sku == "" || sku == undefined || sku == null) {
							if (quantity == "" || quantity == undefined
									|| quantity == null) {
								shake('commoditySKU');

							} else {
								// warning sku
								shake('commoditySKU');
							}
						} else {
							if (quantity == "" || quantity == undefined
									|| quantity == null) {
								// warning quantity
								shake('quantity');
							} else {
								// both valid
								commodityCount += 1;
								$('#commodityEntry')
										.append(
												'<div class="row">'
														+ '<label class="col-sm-3"> 商品'
														+ commodityCount
														+ 'SKU：'
														+ '</label>'
														+ '<label class="col-sm-3" id="commoditySKU'+commodityCount +'">'
														+ sku
														+ '</label>'
														+ '<label class="col-sm-3"> 商品'
														+ commodityCount
														+ '数量：'
														+ '</label>'
														+ '<label class="col-sm-3" id="commodityQuantity'+commodityCount+'">'
														+ quantity + '</label>'
														+ '</div>');
								var sku = $('#commoditySKU').val("");
								var quantity = $('#commodityQuantity').val("1");
								$('#addCommodity').modal('hide');
							}
						}
					});

	function shake(id) {
		$('#' + id).effect('shake', {
			distance : 5
		});
	}
	
	function getAddress() {
		var address = {}
		$.each(ele, function(index, value) {
			address[value] = $('#'+value).attr('value');
			console.log(address[value]);
		});
	}
	function getCommodities() {
		var json = [];
		for (var i = 1; i <= commodityCount; i++) {
			json.push({
				skuNo : $('#commoditySKU' + i).text(),
				qty : $('#commodityQuantity' + i).text()
			});
			//console.log({commoditySKU:$('#commoditySKU'+i).text(), commodityQuantity:$('#commodityQuantity'+i).text()});
		}
		//console.log(json.toString());
		return json;
	}
	$('#submitOrder').on('click', function() {
		$.ajax({
			type : "post",
			url : '<%=basePath%>'+"orders/addOriginalOrderAndAddressAndItems",
			dataType : "json",
			data : JSON.stringify({
				stoStoreOrder: {strId:"12654388"},
				shaShippingAddress : getAddress(),
				orderItems : getCommodities()
			}),
			success : function(msg) {
				console.log(msg);
			},
			error : function(msg) {
				console.log(msg);
			}
		});
	});
</script>
</html>
