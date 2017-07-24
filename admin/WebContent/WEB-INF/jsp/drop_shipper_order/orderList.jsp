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


	<title>Order List</title>

</head>
<body>
	<div class="container">
		<div class="page-header">
			<h3>网店${strId}的所有销售订单</h3>
		</div>

		<!-- 使用后端<ArrayList>SaoSalesOrder实体类 -->
		<div id="order_list">
			<div id="receiveAddress" class="table-responsive">
				<table class="table" id="addressTable">
					<label for="name">销售订单：</label>
					<thead>
						<tr>
							<th>销售订单ID</th> <!--saoId -->
							<th>订单创建时间</th> <!-- lastUpdateDate -->
							<th>订单价格</th> <!-- productAmount -->
							<th>备注</th> <!-- customerRemark -->
							<th>操作</th>
						</tr>
					</thead>
					<tbody>
						<c:when test="${not empty saoSalesOrderListAll}">
						<c:forEach items="${saoSalesOrderListAll}" var="saoSaleOrder" varStatus="vs">
						<tr>
							<td><label>${saoSaleOrder.saoId}</label></td>
							<td><label>${saoSaleOrder.lastUpdateDate}</label></td>
							<td><label>${saoSaleOrder.productAmount}</label></td>
							<td><label>${saoSaleOrder.customerRemark}</label></td>
							<td>
								<c:choose>
								<!-- 点开订单详情的按钮 -->
								<c:when test="${saoSaleOrder.stsCd != '1'}">
								<label>已支付</label>
							</c:when>
							<c:otherwise>
							<button type="button" class="btn btn-default" onclick="detailButton(${saoSaleOrder.saoId})"/>
						</c:otherwise>
					</td>
				</tr>
			</c:forEach>
		</c:when>
		<c:otherwise>
		
	</c:otherwise>

</c:choose>
</tbody>
</table>

</div>
</div>

</body>

<script type="text/javascript">
	<!-- stop loading -->
	$(top.hangge());
	function detailButton(saoId) {
		windows.location.href='<%=basePath%>'+"/getOrderInformation/"+saoId;
	}
</script>
</html>
