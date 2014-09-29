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
	<form action="courses.shtml" method="post" name="userForm" id="userForm">
	<div class="search_div">
		课程名称：<input type="text" name="coursesName" value="${courses.coursesName }"/>
		学校名称：<input type="text" name="storeName" value="${courses.storeName }"/>
		<a href="javascript:search();" class="myBtn"><em>查询</em></a>
	</div>
	<table width="100%" border="0" cellpadding="0" cellspacing="0" class="main_table">
		<tr class="main_head">
			<th><input type="checkbox" name="sltAll" id="sltAll" onclick="sltAllUser()"/></th>
			<th>序号</th>
			<th>公共课id</th>
			<th>课程名称</th>
			<th>课程广告词</th>
			<th>学校id</th>
			<th>学校名称</th>
			<th>课程分类id</th>
			<th>品牌id</th>
			<th>课程价格</th>
			<th>市场价</th>
			<th>商家编号</th>
			<th>课程点击率</th>
			<th>销售数量</th>
			<th>收藏数量</th>
			<th>课程章节序列化</th>
			<th>课程库存</th>
			<th>课程主图</th>
			<th>课程状态</th>
			<th>课程审核</th>
			<th>课程添加时间</th>
			<th>课程编辑时间</th>
			<th>课程推荐</th>
			<th>学校分类id</th>
			<th>好评星级</th>
			<th>评价数</th>
			<th>操作</th>
		</tr>
		<c:choose>
			<c:when test="${not empty coursesList}">
				<c:forEach items="${coursesList}" var="c" varStatus="vs">
				<tr class="main_info">
				<td><input type="checkbox" name="userIds" id="userIds${c.coursesId }" value="${cc.coursesId }"/></td>
				<td>${vs.index+1}</td>
				<td>${c.coursesCommonid }</td>
				<td>${c.coursesName }</td>
				<td>${c.coursesJingle }</td>
				<td>${c.storeId }</td>
				<td>${c.storeName }</td>
				<td>${c.gcId }</td>
				<td>${c.brandId }</td>
				<td>${c.coursesPrice }</td>
				<td>${c.coursesMarketprice }</td>
				<td>${c.coursesSerial }</td>
				<td>${c.coursesClick }</td>
				<td>${c.coursesSalenum }</td>
				<td>${c.coursesCollect }</td>
				<td>${c.coursesSpec }</td>
				<td>${c.coursesStorage }</td>
				<td>${c.coursesImage }</td>
				<td>
					<c:forEach items="${coursesStateList }" var="code">
						<c:choose>
							<c:when test="${code.code == c.coursesState }">
								${code.view }
							</c:when>
						</c:choose>
					</c:forEach>
				</td>
				<td>
					<c:forEach items="${coursesVerifyList }" var="code">
						<c:choose>
							<c:when test="${code.code == c.coursesVerify }">
								${code.view }
							</c:when>
						</c:choose>
					</c:forEach>
				</td>
				<td><fmt:formatDate value="${c.coursesAddtime}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
				<td><fmt:formatDate value="${c.coursesEdittime}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
				<td>
					<c:forEach items="${coursesCommendList }" var="code">
						<c:choose>
							<c:when test="${code.code == c.coursesCommend }">
								${code.view }
							</c:when>
						</c:choose>
					</c:forEach>
				</td>
				<td>${c.coursesStcids }</td>
				<td>${c.evaluationGoodStar }</td>
				<td>${c.evaluationCount }</td>
				<td><a href="javascript:editUser(${c.coursesId });">修改</a> | <a href="javascript:delUser(${c.coursesId });">删除</a></td>
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
		${courses.page.pageStr }
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
				page:'courses/add.shtml'
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
				page:'courses/edit.shtml?coursesId='+coursesId
				});
			dg.ShowDialog();
		}
		
		function delUser(coursesId){
			if(confirm("确定要删除该记录？")){
				var url = "courses/delete.shtml?coursesId="+coursesId;
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