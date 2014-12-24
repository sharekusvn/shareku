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
	<form action="/add_video.shtml" name="userForm" id="userForm" target="result" method="post" enctype="multipart/form-data">
	<input type="hidden" name="course" id="course" value="${course }"/>
	<table border="0" cellpadding="0" cellspacing="0">
		<tr class="info">
			<th>所属课程ID:</th>
			<td><input type="text" name="courseId" id="courseId" class="input_txt" value="${course.courseId }"/></td>
		</tr>
		<tr>
			<th>视频文件</th>
			<td><input type="file" name="file" id="file" class="input_txt"/></td>
		</tr>
		<tr>
			<td><input type="button" name="submit" value="确认上传" class="input_txt" /></td>
		</tr>
	</table>
	</form>
	<iframe name="result" id="result" src="about:blank" frameborder="0" width="0" height="0"></iframe>
	<script type="text/javascript" src="../js/jquery-1.5.1.min.js"></script>
	<script type="text/javascript" src="../js/datePicker/WdatePicker.js"></script>
	<script type="text/javascript">
		function checkInfo(){
			return true;
		}
	</script>
</body>
</html>