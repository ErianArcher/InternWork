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
		<title>修改地址</title>
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
    </head>

<body>
    <form name="Form" id="Form" method="post" enctype="multipart/form-data">
		<input type="hidden" name="saoId" id="saoId" value="${ShaShippingAddress.saoId}"/>
		<div id="zhongxin">
		<table id="table_report" class="table table-striped table-bordered table-hover">
			<tr>
				<th>姓氏:</th>
				<td><input type="text" name="familyName" id="familyName" value="${familyName}" maxlength="32" style="width:95%;" placeholder="这里输入姓氏" title="姓氏"/></td>
			</tr>
			<tr>
				<th>名字:</th>
				<td><input type="text" name="givenName" id="givenName" value="${givenName}" maxlength="32" placeholder="这里输入名字" title="名字"/></td>
			</tr>
			<tr>
				<th>联系电话:</th>
				<td><input type="text" name="contactPhoneNo" id="contactPhoneNo" value="${contactPhoneNo}" maxlength="32" placeholder="这里输入联系电话" title="联系电话"/></td>
			</tr>
			<tr>
				<th>邮箱:</th>
				<td><input type="text" name="email" id="email" value="${email}" maxlength="32" placeholder="这里输入邮箱" title="邮箱"/></td>
			</tr>
			<tr>
				<th>国家:</th>
				<td><input type="text" name="countryName" id="countryName" value="${countryName}" maxlength="32" style="width:95%;" placeholder="这里输入国家" title="国家"/></td>
			</tr>
			<tr>
                <th>省份:</th>
                <td><input type="text" name="stateOrProvinceName" id="stateOrProvinceName" value="${stateOrProvinceName}" maxlength="32" placeholder="这里输入省份" title="省份"/></td>
            </tr>
			<tr>
				<th>城市名:</th>
				<td><input type="text" name="cityName" id="cityName" value="${cityName}" maxlength="32" placeholder="这里输入城市名" title="城市名"/></td>
			</tr>
			<tr>
				<th>详细地址:</th>
				<td><input type="text" name="addressLine1" id="addressLine1" value="${addressLine1}" maxlength="32" placeholder="这里输入详细地址" title="详细地址"/></td>
			</tr>
			<tr>
				<th>邮编:</th>
				<td><input type="text" name="postalCd" id="postalCd" value="${postalCd}" maxlength="32" placeholder="这里输入邮编" title="邮编"/></td>
			</tr>
			<tr>
				<th>国家编码:</th>
				<td><input type="text" name="coutryIsoCd" id="coutryIsoCd" value="${coutryIsoCd}" maxlength="32" placeholder="这里输入国家编码" title="国家编码"/></td>
			</tr>
			<tr>
				<th>省份编码:</th>
				<td><input type="text" name="stateOrProvinceCd" id="stateOrProvinceCd" value="${stateOrProvinceCd}" maxlength="32" placeholder="这里输入省份编码" title="省份编码"/></td>
			</tr>
			<tr>
				<td style="text-align: center;" colspan="2">
					<a class="btn btn-mini btn-danger" onclick="save();">保存</a>
					<a class="btn btn-mini btn-danger" onclick="top.Dialog.close();">取消</a>
				</td>
			</tr>
		</table>
		</div>
		
		<div id="zhongxin2" class="center" style="display:none"><br/><br/><br/><br/><br/><br/><h4 class="lighter block green">提交中...</h4></div>
		
	</form>

</body>

<script type="text/javascript">
    //保存
    $(top.hangge());

    function save() {
        if($("#familyName").val()==""){
            $("#familyName").tips({
                side:3,
                msg:'请输入姓氏',
                bg:'#AE81FF',
                time:2
            })
        $("#familyName").focus();
        return false;
        }

        if($("#givenName").val()==""){
            $("#givenName").tips({
                side:3,
                msg:'请输入名字',
                bg:'#AE81FF',
                time:2
            })
        $("#givenName").focus();
        return false;
        }
        if($("#contactPhoneNo").val()==""){
            $("#contactPhoneNo").tips({
                side:3,
                msg:'请输入联系电话',
                bg:'#AE81FF',
                time:2
            })
        $("#contactPhoneNo").focus();
        return false;
        }

        if($("#email").val()==""){
            $("#email").tips({
                side:3,
                msg:'请输入邮箱',
                bg:'#AE81FF',
                time:2
            })
        $("#email").focus();
        return false;
        }

        if($("#countryName").val()==""){
            $("#countryName").tips({
                side:3,
                msg:'请输入国家',
                bg:'#AE81FF',
                time:2
            })
        $("#countryName").focus();
        return false;
        }

        if($("#stateOrProvinceNamw").val()==""){
            $("#stateOrProvinceCName").tips({
                side:3,
                msg:'请输入省份',
                bg:'#AE81FF',
                time:2
            })
        $("#stateOrProvinceCd").focus();
        return false;
        }

        if($("#cityName").val()==""){
            $("#cityName").tips({
                side:3,
                msg:'请输入城市名',
                bg:'#AE81FF',
                time:2
            })
        $("#cityName").focus();
        return false;
        }

        if($("#addressLine1").val()==""){
            $("#addressLine1").tips({
                side:3,
                msg:'请输入详细地址',
                bg:'#AE81FF',
                time:2
            })
        $("#addressLine1").focus();
        return false;
        }

        if($("#postalCd").val()==""){
            $("#postalCd").tips({
                side:3,
                msg:'请输入邮编',
                bg:'#AE81FF',
                time:2
            })
        $("#postalCd").focus();
        return false;
        }

        if($("#coutryIsoCd").val()==""){
            $("#coutryIsoCd").tips({
                side:3,
                msg:'请输入国家编码',
                bg:'#AE81FF',
                time:2
            })
        $("#coutryIsoCd").focus();
        return false;
        }

        if($("#stateOrProvinceCd").val()==""){
            $("#stateOrProvinceCd").tips({
                side:3,
                msg:'请输入省份编码',
                bg:'#AE81FF',
                time:2
            })
        $("#stateOrProvinceCd").focus();
        return false;
        }
        $.ajax({
            type : "post",
            url : '<%=basePath%>'+"orders/addOriginalOrderAndAddressAndItems",
            dataType : "json",
            data : JSON.stringify({
                shaShippingAddress : getAddress()
            }),
            success : function(msg) {
                console.log(msg);
            },
            error : function(msg) {
                console.log(msg);
            }
        });
    }
</script>
<html>