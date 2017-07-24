<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html lang="en">
	<head>
	    <base href="<%=basePath%>">

	    <meta charset="utf-8" />
		<title></title>
		<meta name="description" content="overview & stats" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0" />
		<link href="static/css/bootstrap.min.css" rel="stylesheet" />
		<link rel="stylesheet" href="static/css/ace.min.css" />
		<link rel="stylesheet" href="static/css/ace-skins.min.css" />
		<link rel="stylesheet" href="static/assets/css/font-awesome.css" />
		<!-- ace styles -->
		<link rel="stylesheet" href="static/assets/css/ace.css" class="ace-main-stylesheet" id="main-ace-style" />

		<script type="text/javascript" src="static/js/jquery-1.7.2.js"></script>
		<script type="text/javascript" src="static/js/jquery.tips.js"></script>

		<%@ include file="../system/admin/top.jsp"%>
        <script type="text/javascript">
            $(top.hangge());
        </script>
        <script type="text/javascript">
    //保存
 
</script>
    </head>

<body>
    <form action="pictures/${msg }.do" name="Form" id="Form" method="post" enctype="multipart/form-data">
		
		<div id="zhongxin">
		<table id="table_report" class="table table-striped table-bordered table-hover">
			<tr>
				<th>订单总额:</th>
				<td><input type="hidden" name="saoId" value="${saoId}">${ddddd }</td>
			</tr>
			
			<tr>
				<td style="text-align: center;" colspan="2">
				<!-- <a class="btn btn-mini btn-primary" onclick="top.Dialog.close();" id="submitPayment">确认支付</a> -->
					
				
					<input type="submit" name="confirmPay" value="确认支付">
				</td>
			</tr>
		</table>
		</div>
		
		
	</form>
	
</body>
</html>