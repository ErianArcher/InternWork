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
			<h1>网店${strId}的销售订单</h1>
		</div>
		
		<div id="order_list">
			<div id="receiveAddress" class="table-responsive">
				<table class="table" id="addressTable">
					<caption>销售订单：</caption>
					<thead>
						<tr>
							<th>销售订单ID</th>
							<th>操作</th>
						</tr>
					</thead>
					<tbody>
						<c:choose>
							<c:when test="${not empty saoSaleOrderListAll}">
								<c:forEach items="${saoSaleOrderListAll}" var="saoSaleOrder" varStatus="vs">
								<tr>
								<td><label>${saoSaleOrder.saoId}</label></td>
								
								<td>
								<button type="button" class="btn btn-default" onclick="payButton(${saoSaleOrder.saoId})"></button>
								</td>
								</tr>
							</c:forEach>
						</c:when>
			</c:choose>
					</tbody>
				</table>
			
		</div>
	</div>
	
</body>

<script type="text/javascript">
<!-- stop loading -->
$(top.hangge());
function payButton(saoId) {
	windows.location.href='<%=basePath%>'+"/getOrderInformation/"+saoId;
}
</script>
</html>