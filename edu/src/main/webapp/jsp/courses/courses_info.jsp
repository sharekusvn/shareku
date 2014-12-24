<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
.info th{text-align: right;width:100px;color: #4f4f4f;padding-right:5px;font-size: 13px;}
.info td{text-align:left;}
</style>
</head>
<body>
	<form action="save.shtml" name="userForm" id="userForm" target="result" method="post" onsubmit="return checkInfo();">
	<input type="hidden" name="coursesId" id="coursesId" value="${course.courseId }"/>
	<table border="0" cellpadding="0" cellspacing="0">
		<tr class="info">
			<th>一级分类:</th>
			<td><input type="text" name="courseOne" id="courseOne" class="input_txt" value="${course.courseOne }"/></td>
		</tr>
		<tr class="info">
			<th>二级分类:</th>
			<td><input type="text" name="courseTwo" id="courseTwo" class="input_txt" value="${course.courseTwo }"/></td>
		</tr>
		<tr class="info">
			<th>三级分类:</th>
			<td><input type="text" name="courseThree" id="courseThree" class="input_txt" value="${course.courseThree }"/></td>
		</tr>
		<tr class="info">
			<th>课程名称:</th>
			<td><input type="text" name="courseName" id="courseName" class="input_txt" value="${course.courseName }"/></td>
		</tr>
		<tr class="info">
			<th>关键词:</th>
			<td><input type="text" name="keywords" id="keywords" class="input_txt" value="${course.keywords }"/></td>
		</tr>
		<tr class="info">
			<th>课程价格:</th>
			<td><input type="text" name="coursePrice" id="coursePrice" class="input_txt" value="${course.coursePrice }"/></td>
		</tr>
		<tr class="info">
			<th>市场价:</th>
			<td><input type="text" name="valuations" id="valuations" class="input_txt" value="${course.valuations }"/></td>
		</tr>
		<tr class="info">
			<th>折扣:</th>
			<td><input type="text" name="discount" id="discount" class="input_txt" value="${course.discount }"/></td>
		</tr>
		<tr class="info">
			<th>图片:</th>
			<td><input type="text" name="imagePath" id="imagePath" class="input_txt" value="${course.imagePath }"/></td>
		</tr>
		<tr class="info">
			<th>销售数量:</th>
			<td><input type="text" name="sales" id="sales" class="input_txt" value="${course.sales }"/></td>
		</tr>
		<tr class="info">
			<th>讲师:</th>
			<td><input type="text" name="lecturer" id="lecturer" class="input_txt" value="${course.lecturer }"/></td>
		</tr>
		<tr class="info">
			<th>课程描述:</th>
			<td><input type="text" name="description" id="description" class="input_txt" value="${course.description }"/></td>
		</tr>
		<tr class="info">
			<th>课程状态:</th>
			<td>
				<select name="status" id="status" class="input_txt">
					<c:forEach items="${coursesStateList }" var="code">
						<c:choose>
							<c:when test="${code.code == course.status }">
								<option value="${code.code }" selected="selected">${code.view }</option>
							</c:when>
							<c:otherwise>
								<option value="${code.code }">${code.view }</option>
							</c:otherwise>
						</c:choose>
					</c:forEach>
				</select>
			</td>
		</tr>
		<tr class="info">
			<th>课程发布时间:</th>
			<td><input type="text" name="date" id="date" class="input_txt Wdate" value="<fmt:formatDate value="${course.date }" pattern="yyyy-MM-dd HH:mm:ss"/>" onclick="WdatePicker({dateFmt:'yyyy-M-d H:mm:ss'})" readonly="readonly"/></td>
		</tr>
		<tr class="info">
			<th>课程推荐:</th>
			<td>
				<select name="recommend" id="recommend" class="input_txt">
					<c:forEach items="${coursesCommendList }" var="code">
						<c:choose>
							<c:when test="${code.code == course.recommend }">
								<option value="${code.code }" selected="selected">${code.view }</option>
							</c:when>
							<c:otherwise>
								<option value="${code.code }">${code.view }</option>
							</c:otherwise>
						</c:choose>
					</c:forEach>
				</select>
			</td>
		</tr>
	</table>
	</form>
	<iframe name="result" id="result" src="about:blank" frameborder="0" width="0" height="0"></iframe>
	<script type="text/javascript" src="../js/jquery-1.5.1.min.js"></script>
	<script type="text/javascript" src="../js/datePicker/WdatePicker.js"></script>
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