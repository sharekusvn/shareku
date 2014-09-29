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
	<input type="hidden" name="coursesId" id="coursesId" value="${courses.coursesId }"/>
	<table border="0" cellpadding="0" cellspacing="0">
		<tr class="info">
			<th>公共课id:</th>
			<td><input type="text" name="coursesCommonid" id="coursesCommonid" class="input_txt" value="${courses.coursesCommonid }"/></td>
		</tr>
		<tr class="info">
			<th>课程名称:</th>
			<td><input type="text" name="coursesName" id="coursesName" class="input_txt" value="${courses.coursesName }"/></td>
		</tr>
		<tr class="info">
			<th>课程广告词:</th>
			<td><input type="text" name="coursesJingle" id="coursesJingle" class="input_txt" value="${courses.coursesJingle }"/></td>
		</tr>
		<tr class="info">
			<th>学校id:</th>
			<td><input type="text" name="storeId" id="storeId" class="input_txt" value="${courses.storeId }"/></td>
		</tr>
		<tr class="info">
			<th>学校名称:</th>
			<td><input type="text" name="storeName" id="storeName" class="input_txt" value="${courses.storeName }"/></td>
		</tr>
		<tr class="info">
			<th>课程分类id:</th>
			<td><input type="text" name="gcId" id="gcId" class="input_txt" value="${courses.gcId }"/></td>
		</tr>
		<tr class="info">
			<th>品牌id:</th>
			<td><input type="text" name="brandId" id="brandId" class="input_txt" value="${courses.brandId }"/></td>
		</tr>
		<tr class="info">
			<th>课程价格:</th>
			<td><input type="text" name="coursesPrice" id="coursesPrice" class="input_txt" value="${courses.coursesPrice }"/></td>
		</tr>
		<tr class="info">
			<th>市场价:</th>
			<td><input type="text" name="coursesMarketprice" id="coursesMarketprice" class="input_txt" value="${courses.coursesMarketprice }"/></td>
		</tr>
		<tr class="info">
			<th>商家编号:</th>
			<td><input type="text" name="coursesSerial" id="coursesSerial" class="input_txt" value="${courses.coursesSerial }"/></td>
		</tr>
		<tr class="info">
			<th>课程点击率:</th>
			<td><input type="text" name="coursesClick" id="coursesClick" class="input_txt" value="${courses.coursesClick }"/></td>
		</tr>
		<tr class="info">
			<th>销售数量:</th>
			<td><input type="text" name="coursesSalenum" id="coursesSalenum" class="input_txt" value="${courses.coursesSalenum }"/></td>
		</tr>
		<tr class="info">
			<th>收藏数量:</th>
			<td><input type="text" name="coursesCollect" id="coursesCollect" class="input_txt" value="${courses.coursesCollect }"/></td>
		</tr>
		<tr class="info">
			<th>课程章节序列化:</th>
			<td><input type="text" name="coursesSpec" id="coursesSpec" class="input_txt" value="${courses.coursesSpec }"/></td>
		</tr>
		<tr class="info">
			<th>课程库存:</th>
			<td><input type="text" name="coursesStorage" id="coursesStorage" class="input_txt" value="${courses.coursesStorage }"/></td>
		</tr>
		<tr class="info">
			<th>课程主图:</th>
			<td><input type="text" name="coursesImage" id="coursesImage" class="input_txt" value="${courses.coursesImage }"/></td>
		</tr>
		<tr class="info">
			<th>课程状态:</th>
			<td>
				<select name="coursesState" id="coursesState" class="input_txt">
					<c:forEach items="${coursesStateList }" var="code">
						<c:choose>
							<c:when test="${code.code == courses.coursesState }">
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
			<th>课程审核:</th>
			<td>
				<select name="coursesVerify" id="coursesVerify" class="input_txt">
					<c:forEach items="${coursesVerifyList }" var="code">
						<c:choose>
							<c:when test="${code.code == courses.coursesVerify }">
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
			<th>课程添加时间:</th>
			<td><input type="text" name="coursesAddtime" id="coursesAddtime" class="input_txt Wdate" value="<fmt:formatDate value="${courses.coursesAddtime }" pattern="yyyy-MM-dd HH:mm:ss"/>" onclick="WdatePicker({dateFmt:'yyyy-M-d H:mm:ss'})" readonly="readonly"/></td>
		</tr>
		<tr class="info">
			<th>课程编辑时间:</th>
			<td><input type="text" name="coursesEdittime" id="coursesEdittime" class="input_txt Wdate" value="<fmt:formatDate value="${courses.coursesEdittime }" pattern="yyyy-MM-dd HH:mm:ss"/>" onclick="WdatePicker({dateFmt:'yyyy-M-d H:mm:ss'})" readonly="readonly"/></td>
		</tr>
		<tr class="info">
			<th>课程推荐:</th>
			<td>
				<select name="coursesCommend" id="coursesCommend" class="input_txt">
					<c:forEach items="${coursesCommendList }" var="code">
						<c:choose>
							<c:when test="${code.code == courses.coursesCommend }">
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
			<th>学校分类id:</th>
			<td><input type="text" name="coursesStcids" id="coursesStcids" class="input_txt" value="${courses.coursesStcids }"/></td>
		</tr>
		<tr class="info">
			<th>好评星级:</th>
			<td><input type="text" name="evaluationGoodStar" id="evaluationGoodStar" class="input_txt" value="${courses.evaluationGoodStar }"/></td>
		</tr>
		<tr class="info">
			<th>评价数:</th>
			<td><input type="text" name="evaluationCount" id="evaluationCount" class="input_txt" value="${courses.evaluationCount }"/></td>
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