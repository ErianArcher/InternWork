<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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

<style type="text/css">
#pay div.payMethod {
	float: left;
	margin-left: 10px;
	font-size: 14px;
}

#pay div.payButton {
	float: right;
	margin-right: 10px;
	font-size: 14px;
}

div#orderDetails {
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

<title>Order Payment</title>
</head>
<body>
	<div class="container">
		<div class="page-header">
			<h1>订单支付</h1>
		</div>

		<form name="order" role="form" method="post" action=""
			onsubmit="return validatePay();">
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
							<tr>
							</tr>
						</tbody>
					</table>
				</div>

				<div id="postage">
					<div style="margin-left: 10px;">
						<label>邮费：</label>
					</div>
				</div>

				<div id="totalPrice">
					<div style="margin-left: 10px">
						<label>总价：</label>
					</div>
				</div>
			</div>

			<div id="remark">
				<div class="form-group">
					<label for="customerRemark">买家留言：</label>
					<textarea class="form-control" id="customerRemark" placeholder="可选"
						rows="1"></textarea>
				</div>
			</div>

			<div id="pay">
				<div class="payMethod">
					<div>
						<label>支付方式： <span class="warning" id="warn_payMethod">*</span>
						</label> <label class="checkbox-inline"> <input name="payMethod"
							id="alipay" value="alipay" type="radio">支付宝
						</label> <label class="checkbox-inline"> <input name="payMethod"
							id="wechat" value="wechat" type="radio">微信支付
						</label>
					</div>
				</div>

				<div class="payButton">
					<input type="submit" id="pay" class="btn btn-default" value="支付">
				</div>
			</div>
		</form>

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
									</textarea>
								</div>
							</div>

							<div class="col-sm-6">
								<label for="boxCountryCode" class="col-sm-6 control-label">国家编码
									<span class="warning" id="warn_boxCountryCode">*</span>
								</label>
								<div class="col-sm-6">
									<input type="text" class="form-control" id="boxCountryCode"
										placeholder="国家编码">
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
										placeholder="省份">
									</textarea>
								</div>
							</div>
							<div class="col-sm-6">
								<label for="boxProvinceCode" class="col-sm-6 control-label">省份编码
									<span class="warning" id="warn_boxProvinceCode">*</span>
								</label>
								<div class="col-sm-6">
									<input type="text" class="form-control" id="boxProvinceCode"
										placeholder="省份编码">
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

		</div>
	</div>
</body>

<script type="text/javascript">
	// Cancel loading
	$(top.hangge());

	$(function($) {
		//Popup address edit
		$("#addAddress").hover(function() {
			$(this).stop().animate({
				opacity : '1'
			}, 500);
		}, function() {
			$(this).stop().animate({
				opacity : '0.6'
			}, 1000);
		}).on('click', function() {
			$("body").append("<div id='mask'></div>");
			$("#mask").addClass("mask").fadeIn("slow");
			$("#").fadeIn("slow");
		});

		var ele = [ 'familyName', 'givenName', 'contactPhoneNo', 'email',
				'countryName', 'stateOrProvinceName', 'cityName',
				'addressLine', 'postalCd', 'countryIsoCd', 'stateOrProvinceCd' ];
		var origin_ele = [ 'boxLastName', 'boxFirstName', 'boxPhone',
				'boxEmail', 'boxCountry', 'boxProvince', 'boxCity',
				'boxDetailAddress', 'boxZipCode', 'boxCountryCode',
				'boxProvinceCode' ];
		//Box confirm button
		$("#boxConfirmBtn")
				.on(
						'click',
						function() {
							var address = {};

							var isIncomplete = false;// Mark if some of the inputs are not filled.
							/*
							address['FAMILY_NAME'] = $('#boxLastName').val();
							address['GIVEN_NAME'] = $('#boxFirstName').val();
							address['COUNTRY_NAME'] = $('#boxCountry').val();
							address['COUNTRY_ISO_CD'] = $('#boxCountryCode').val();
							address['STATE_OR_PROVINCE_NAME'] = $('#boxProvince').val();
							address['STATE_OR_PROVINCE_CD'] = $('#boxProvinceCode').val();
							address['CITY_NAME'] = $('#boxCity').val();
							address['ADDRESS_LINE'] = $('#boxDetailAddress').val();
							address['POSTAL_CD'] = $('#boxZipCode').val();
							address['CONTACT_PHONE_NO'] = $('#boxPhone').val();
							address['EMAIL'] = $('#boxEmail').val();
							 */

							$.each(ele, function(index, value) {
								var tmp = $('#' + origin_ele[index]).val();
								console.log(tmp);
								if (tmp == "" || tmp == undefined
										|| tmp == null) {
									$('#warn_' + origin_ele[index]).css(
											'display', 'block');
									isIncomplete = true;
								} else {
									$('#warn_' + origin_ele[index]).css(
											'display', 'none');
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
																	'<td><input type="hidden" name="'+value+'" value="'+
							address[value]+'">'
																			+ address[value]
																			+ '</td>');
													//console.log(value+' '+address[value]);
												});
								$('#addressTable tbody tr')
										.append(
												'<td><a href="" id="deleteAddress" class="delete">删除</button></td>');
								$('#addAddress').css('display', 'none');
								$('#operateAddressModalBox').modal('hide');
							}

						});

		//delete address button
		$('.delete').on('click', function() {
			$('#addAddress').css('display', 'block');
			$(this).closest("tr").children().remove();
		});

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

		// add judgement to payment
		$.each([ 'alipay', 'wechat' ], function(index, value) {
			$('#' + value).on('focus', function() {
				$('#pay #warn_payMethod').css('display', 'none');
			});
		});

	});

	// form validation
	function validatePay() {
		var aliChecked = $('#alipay').is(':checked');
		var wechatChecked = $('#wechat').is(':checked');
		// Check if the address is added
		var isExistAddress = $('#addAddress').is(':hidden');

		if (!aliChecked && !wechatChecked) {
			$('#pay #warn_payMethod').css('display', 'block');
			return false;
		} else if (!isExistAddress) {
			return false;
		} else {
			return true;
		}
	}
</script>

</html>