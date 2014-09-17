<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html lang="en"> 
<head> 
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>list</title> 
<link rel="stylesheet" href="css/examples.css" type="text/css" /> 
<style>
fieldset{
  margin:20px;
  margin-top:30px;
  padding: 0px;
  border: 1px solid #000;
  border-radius: 8px;
  background: #fff /*url("../images/pulp.jpeg") repeat*/;
  /*box-shadow: 0px 1px 2px rgba(0,0,0,0.20), inset 0 1px 0 #fff;*/
	}
header{
	margin-left:10px;
	margin-top:15px;
	margin-bottom:10px;
	}
.btn_go{
float:right;
padding-right:5px;

}
p{
color:#000;
margin-left:10px;
margin-bottom:15px;
font-size:15px;
font-family:"黑体";
}

</style>
</head> 
  <body>
      <fieldset>
          <header><h1>找到一下相关内容</h1></header>
      </fieldset>
    <div id="index">

      <div id="examples">
      	<c:forEach items="${sourceList }" var="ds">
      		<a href="message.html?id=${ds.sourceId }" target=_blank>${ds.content}
      		<p>${ds.mediaSource }</p></a>
      	</c:forEach>
      </div>
    </div>
  </body>
  <!--http://juzz.in/resources/Alienware.mp4
  http://127.0.0.1:8909/58.211.81.178/youku/697547806AE4B83EB77EA53CD7/03002001004F2B038D0D7C0495B84B3AFC3FFD-1177-3DB4-A483-644B4CEC02AC.mp4
  http://www2.porsche-event.cn/911.mp4
  -->
</html>
