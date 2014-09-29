<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>My Test</title>
<link type="text/css" rel="stylesheet" href="../css/main.css"/>
<style type="text/css">
body{width:100%;height:100%;background-color: #FFFFFF;text-align: center;}
.input_txt{width:200px;height:20px;line-height:20px;}
.info{height:40px;line-height:40px;}
.info th{text-align: right;width:65px;color: #4f4f4f;padding-right:5px;font-size: 13px;}
.info td{text-align:left;}
</style>
</head>
<body>
	<form action="save.shtml" name="userForm" id="userForm" target="result" method="post" onsubmit="return checkInfo();">
	<input type="hidden" name="ccId" id="ccId" value="${courses_class.ccId }"/>
	<table border="0" cellpadding="0" cellspacing="0">
		<tr class="info">
			<th>分类名称:</th>
			<td><input type="text" name="ccName" id="ccName" class="input_txt" value="${courses_class.ccName }"/></td>
		</tr>
		<tr class="info">
			<th>类型id:</th>
			<td><input type="text" name="typeId" id="typeId" class="input_txt" value="${courses_class.typeId }"/></td>
		</tr>
		<tr class="info">
			<th>类型名称:</th>
			<td><input type="text" name="typeName" id="typeName" class="input_txt" value="${courses_class.typeName }"/></td>
		</tr>
		<tr class="info">
			<th>父id:</th>
			<td><input type="text" name="ccParentId" id="ccParentId" class="input_txt" value="${courses_class.ccParentId }"/></td>
		</tr>
		<tr class="info">
			<th>排序:</th>
			<td><input type="text" name="ccSort" id="ccSort" class="input_txt" value="${courses_class.ccSort }"/></td>
		</tr>
		<tr class="info">
			<th>名称:</th>
			<td><input type="text" name="ccTitle" id="ccTitle" class="input_txt" value="${courses_class.ccTitle }"/></td>
		</tr>
		<tr class="info">
			<th>关键字:</th>
			<td><input type="text" name="ccKeywords" id="ccKeywords" class="input_txt" value="${courses_class.ccKeywords }"/></td>
		</tr>
		<tr class="info">
			<th>描述:</th>
			<td><input type="text" name="ccDescription" id="ccDescription" class="input_txt" value="${courses_class.ccDescription }"/></td>
		</tr>
	</table>
	</form>
	<iframe name="result" id="result" src="about:blank" frameborder="0" width="0" height="0"></iframe>
	
	<script type="text/javascript" src="../js/jquery-1.5.1.min.js"></script>
	<script type="text/javascript">
		var dg;
		$(document).ready(function(){
			dg = frameElement.lhgDG;
			dg.addBtn('ok','保存',function(){
				$("#userForm").submit();
			});
		});
		
		function checkInfo(){
			return true;
		}
		
		function success(){
			if(dg.curWin.document.forms[0]){
				dg.curWin.document.forms[0].action = dg.curWin.location+"";
				dg.curWin.document.forms[0].submit();
			}else{
				dg.curWin.location.reload();
			}
			dg.cancel();
		}
		
		function failed(){
			alert("添加或修改失败！");
		}
	</script>
</body>
</html>