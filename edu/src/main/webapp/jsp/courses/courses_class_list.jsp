<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>My Test</title>
<link type="text/css" rel="stylesheet" href="css/main.css"/>
</head>
<body>
	<form action="courses_class.shtml" method="post" name="userForm" id="userForm">
	<div class="search_div">
		分类名称：<input type="text" name="ccName" value="${courses_class.ccName }"/>
		类型名称：<input type="text" name="typeName" value="${courses_class.typeName }"/>
		<a href="javascript:search();" class="myBtn"><em>查询</em></a>
	</div>
	<table width="100%" border="0" cellpadding="0" cellspacing="0" class="main_table">
		<tr class="main_head">
			<th><input type="checkbox" name="sltAll" id="sltAll" onclick="sltAllUser()"/></th>
			<th>序号</th>
			<th>分类名称</th>
			<th>类型id</th>
			<th>类型名称</th>
			<th>父id</th>
			<th>排序</th>
			<th>名称</th>
			<th>关键字</th>
			<th>描述</th>
			<th>操作</th>
		</tr>
		<c:choose>
			<c:when test="${not empty ccList}">
				<c:forEach items="${ccList}" var="cc" varStatus="vs">
				<tr class="main_info">
				<td><input type="checkbox" name="userIds" id="userIds${cc.ccId }" value="${cc.ccId }"/></td>
				<td>${vs.index+1}</td>
				<td>${cc.ccName }</td>
				<td>${cc.typeId }</td>
				<td>${cc.typeName }</td>
				<td>${cc.ccParentId }</td>
				<td>${cc.ccSort }</td>
				<td>${cc.ccTitle }</td>
				<td>${cc.ccKeywords }</td>
				<td>${cc.ccDescription }</td>
				<td><a href="javascript:editUser(${cc.ccId });">修改</a> | <a href="javascript:delUser(${cc.ccId });">删除</a></td>
				</tr>
				</c:forEach>
			</c:when>
			<c:otherwise>
				<tr class="main_info">
					<td colspan="11">没有相关数据</td>
				</tr>
			</c:otherwise>
		</c:choose>
	</table>
	<div class="page_and_btn">
		<div>
			<a href="javascript:addUser();" class="myBtn"><em>新增</em></a>
		</div>
		${courses_class.page.pageStr }
	</div>
	</form>
	<script type="text/javascript" src="js/jquery-1.5.1.min.js"></script>
	<script type="text/javascript" src="js/datePicker/WdatePicker.js"></script>
	<script type="text/javascript" src="js/lhgdialog/lhgdialog.min.js?t=self&s=areo_blue"></script>
	<script type="text/javascript">
		$(document).ready(function(){
			$(".main_info:even").addClass("main_table_even");
		});
		
		function sltAllUser(){
			if($("#sltAll").attr("checked")){
				$("input[name='userIds']").attr("checked",true);
			}else{
				$("input[name='userIds']").attr("checked",false);
			}
		}
		
		function addUser(){
			var dg = new $.dialog({
				title:'新增用户',
				id:'user_new',
				width:330,
				height:400,
				iconTitle:false,
				cover:true,
				maxBtn:false,
				xButton:true,
				resize:false,
				page:'courses_class/add.shtml'
				});
			dg.ShowDialog();
		}
		
		function editUser(ccId){
			var dg = new $.dialog({
				title:'修改用户',
				id:'user_edit',
				width:330,
				height:400,
				iconTitle:false,
				cover:true,
				maxBtn:false,
				resize:false,
				page:'courses_class/edit.shtml?ccId='+ccId
				});
			dg.ShowDialog();
		}
		
		function delUser(ccId){
			if(confirm("确定要删除该记录？")){
				var url = "courses_class/delete.shtml?ccId="+ccId;
				$.get(url,function(data){
					if(data=="success"){
						document.location.reload();
					}
				});
			}
		}
		
		function search(){
			$("#userForm").submit();
		}
	</script>
</body>
</html>