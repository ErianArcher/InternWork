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
    function save() {
    	if($("#FAMILY_NAME").val()==""){
    		$("#FAMILY_NAME").tips({
    			side:3,
    			msg:'请输入姓氏',
    			bg:'#AE81FF',
    			time:2
    		})
    	$("#FAMILY_NAME").focus();
    	return false;
        }

    	if($("#GIVEN_NAME").val()==""){
    		$("#GIVEN_NAME").tips({
    			side:3,
    			msg:'请输入名字',
    			bg:'#AE81FF',
    			time:2
    		})
    	$("#GIVEN_NAME").focus();
    	return false;
        }
    	if($("#CONTACT_PHONE_NO").val()==""){
    		$("#CONTACT_PHONE_NO").tips({
    			side:3,
    			msg:'请输入联系电话',
    			bg:'#AE81FF',
    			time:2
    		})
    	$("#CONTACT_PHONE_NO").focus();
    	return false;
        }

    	if($("#EMAIL").val()==""){
    		$("#EMAIL").tips({
    			side:3,
    			msg:'请输入邮箱',
    			bg:'#AE81FF',
    			time:2
    		})
    	$("#EMAIL").focus();
    	return false;
        }

    	if($("#COUNTRY_NAME").val()==""){
    		$("#COUNTRY_NAME").tips({
    			side:3,
    			msg:'请输入国家',
    			bg:'#AE81FF',
    			time:2
    		})
    	$("#COUNTRY_NAME").focus();
    	return false;
        }

    	if($("#STATE_OR_PROVINCE_NAME").val()==""){
    		$("#STATE_OR_PROVINCE_NAME").tips({
    			side:3,
    			msg:'请输入省份',
    			bg:'#AE81FF',
    			time:2
    		})
    	$("#STATE_OR_PROVINCE_NAME").focus();
    	return false;
    	}

    	if($("#CITY_NAME").val()==""){
    		$("#CITY_NAME").tips({
    			side:3,
    			msg:'请输入城市名',
    			bg:'#AE81FF',
    			time:2
    		})
    	$("#CITY_NAME").focus();
    	return false;
        }

    	if($("#ADDRESS_LINE1").val()==""){
    		$("#ADDRESS_LINE1").tips({
    			side:3,
    			msg:'请输入详细地址',
    			bg:'#AE81FF',
    			time:2
    		})
    	$("#ADDRESS_LINE1").focus();
    	return false;
        }

    	if($("#POSTAL_CD").val()==""){
    		$("#POSTAL_CD").tips({
    			side:3,
    			msg:'请输入邮编',
    			bg:'#AE81FF',
    			time:2
    		})
    	$("#POSTAL_CD").focus();
    	return false;
        }

    	if($("#COUNTRY_ISO_CD").val()==""){
    		$("#COUNTRY_ISO_CD").tips({
    			side:3,
    			msg:'请输入国家编码',
    			bg:'#AE81FF',
    			time:2
    		})
    	$("#COUNTRY_ISO_CD").focus();
    	return false;
        }

    	if($("#STATE_OR_PROVINCE_CD").val()==""){
    		$("#STATE_OR_PROVINCE_CD").tips({
    			side:3,
    			msg:'请输入省份编码',
    			bg:'#AE81FF',
    			time:2
    		})
    	$("#STATE_OR_PROVINCE_CD").focus();
    	return false;
        }
    	
    	$("#Form").submit();
		$("#zhongxin").hide();
		$("#zhongxin2").show();
    }
</script>
    </head>

<body>
    <form action="pictures/${msg }.do" name="Form" id="Form" method="post" enctype="multipart/form-data">
		<input type="hidden" name="STO_ID" id="STO_ID" value="${pd.STO_ID}"/>
		<div id="zhongxin">
		<table id="table_report" class="table table-striped table-bordered table-hover">
			<tr>
				<th>姓氏:</th>
				<td><input type="text" name="FAMILY_NAME" id="FAMILY_NAME" value="${pd.FAMILY_NAME}" maxlength="32" style="width:95%;" placeholder="这里输入姓氏" title="姓氏"/></td>
			</tr>
			<tr>
				<th>名字:</th>
				<td><input type="text" name="GIVEN_NAME" id="GIVEN_NAME" value="${pd.GIVEN_NAME}" maxlength="32" placeholder="这里输入名字" title="名字"/></td>
			</tr>
			<tr>
				<th>联系电话:</th>
				<td><input type="text" name="CONTACT_PHONE_NO" id="CONTACT_PHONE_NO" value="${pd.CONTACT_PHONE_NO}" maxlength="32" placeholder="这里输入联系电话" title="联系电话"/></td>
			</tr>
			<tr>
				<th>邮箱:</th>
				<td><input type="text" name="EMAIL" id="EMAIL" value="${pd.EMAIL}" maxlength="32" placeholder="这里输入邮箱" title="邮箱"/></td>
			</tr>
			<tr>
				<th>国家:</th>
				<td><input type="text" name="COUNTRY_NAME" id="COUNTRY_NAME" value="${pd.COUNTRY_NAME}" maxlength="32" style="width:95%;" placeholder="这里输入国家" title="国家"/></td>
			</tr>
			<tr>
				<th>省份:</th>
				<td><input type="text" name="STATE_OR_PROVINCE_NAME" id="STATE_OR_PROVINCE_NAME" value="${pd.STATE_OR_PROVINCE_NAME}" maxlength="32" placeholder="这里输入省份" title="省份"/></td>
			</tr>
			<tr>
				<th>城市名:</th>
				<td><input type="text" name="CITY_NAME" id="CITY_NAME" value="${pd.CITY_NAME}" maxlength="32" placeholder="这里输入城市名" title="城市名"/></td>
			</tr>
			<tr>
				<th>详细地址:</th>
				<td><input type="text" name="ADDRESS_LINE1" id="ADDRESS_LINE1" value="${pd.ADDRESS_LINE1}" maxlength="32" placeholder="这里输入详细地址" title="详细地址"/></td>
			</tr>
			<tr>
				<th>邮编:</th>
				<td><input type="text" name="POSTAL_CD" id="POSTAL_CD" value="${pd.POSTAL_CD}" maxlength="32" placeholder="这里输入邮编" title="邮编"/></td>
			</tr>
			<tr>
				<th>国家编码:</th>
				<td><input type="text" name="COUNTRY_ISO_CD" id="COUNTRY_ISO_CD" value="${pd.COUNTRY_ISO_CD}" maxlength="32" placeholder="这里输入国家编码" title="国家编码"/></td>
			</tr>
			<tr>
				<th>省份编码:</th>
				<td><input type="text" name="STATE_OR_PROVINCE_CD" id="STATE_OR_PROVINCE_CD" value="${pd.STATE_OR_PROVINCE_CD}" maxlength="32" placeholder="这里输入省份编码" title="省份编码"/></td>
			</tr>
			<tr>
				<td style="text-align: center;" colspan="2">
					<a class="btn btn-mini btn-primary" onclick="save();">保存</a>
					<a class="btn btn-mini btn-danger" onclick="top.Dialog.close();">取消</a>
				</td>
			</tr>
		</table>
		</div>
		
		<div id="zhongxin2" class="center" style="display:none"><br/><br/><br/><br/><br/><br/><h4 class="lighter block green">提交中...</h4></div>
		
	</form>
	
</body>
</html>