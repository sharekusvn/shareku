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
	<form action="course.shtml" method="post" name="userForm" id="userForm">
	<div class="search_div">
		课程名称：<input type="text" name="courseName" value="${course.courseName }"/>
		<a href="javascript:search();" class="myBtn"><em>查询</em></a>
	</div>
	<table width="100%" border="0" cellpadding="0" cellspacing="0" class="main_table">
			<tr class="main_head">
				<th><input type="checkbox" name="sltAll" id="sltAll"
					onclick="sltAllUser()" /></th>
				<th>一级分类:</th>
				<th>二级分类:</th>
				<th>三级分类:</th>
				<th>课程名称:</th>
				<th>关键词:</th>
				<th>课程价格:</th>
				<th>市场价:</th>
				<th>折扣:</th>
				<th>图片:</th>
				<th>销售数量:</th>
				<th>讲师:</th>
				<th>课程描述:</th>
				<th>课程状态:</th>
				<th>是否推荐:</th>
			</tr>
			<c:choose>
			<c:when test="${not empty courseList}">
				<c:forEach items="${courseList}" var="c" varStatus="vs">
				<tr class="main_info">
				<td><input type="checkbox" name="userIds" id="userIds${c.courseId }" value="${c.courseId }"/></td>
				<td>${c.courseOne }</td>
				<td>${c.courseTwo }</td>
				<td>${c.courseThree }</td>
				<td>${c.courseName }</td>
				<td>${c.keywords }</td>
				<td>${c.coursePrice }</td>
				<td>${c.valuations }</td>
				<td>${c.discount }</td>
				<td>${c.imagePath }</td>
				<td>${c.sales }</td>
				<td>${c.lecturer }</td>
				<td>${c.description }</td>
				<td>
					<c:forEach items="${courseStateList }" var="code">
						<c:choose>
							<c:when test="${code.code == c.status }">
								${code.view }
							</c:when>
						</c:choose>
					</c:forEach>
				</td>
				
				<td>
					<c:forEach items="${coursesCommendList }" var="code">
						<c:choose>
							<c:when test="${code.code == c.recommend }">
								${code.view }
							</c:when>
						</c:choose>
					</c:forEach>
				</td>
				<td><a href="javascript:editUser(${c.courseId });">修改</a> | <a href="javascript:delUser(${c.courseId });">删除</a></td>
				</tr>
				</c:forEach>
			</c:when>
			<c:otherwise>
				<tr class="main_info">
					<td colspan="27">没有相关数据</td>
				</tr>
			</c:otherwise>
		</c:choose>
	</table>
	<div class="page_and_btn">
		<div>
			<a href="javascript:addUser();" class="myBtn"><em>新增</em></a>
		</div>
		${course.page.pageStr }
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
				title:'新增课程',
				id:'user_new',
				width:380,
				height:500,
				iconTitle:false,
				cover:true,
				maxBtn:false,
				xButton:true,
				resize:false,
				page:'course/add.shtml'
				});
			dg.ShowDialog();
		}
		
		function editUser(coursesId){
			var dg = new $.dialog({
				title:'修改课程',
				id:'user_edit',
				width:380,
				height:500,
				iconTitle:false,
				cover:true,
				maxBtn:false,
				resize:false,
				page:'course/edit.shtml?coursesId='+coursesId
				});
			dg.ShowDialog();
		}
		
		function delUser(coursesId){
			if(confirm("确定要删除该记录？")){
				var url = "course/delete.shtml?coursesId="+coursesId;
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