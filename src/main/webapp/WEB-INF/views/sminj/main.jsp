<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>나이키. Just Do It. Nike.com</title>
<style>

/*전체 가운데 정렬*/
	#wrapper{
	max-width: 1920px;
	max-height:1600px;
	margin: auto;
	margin-bottom: 450px;
	}
	
/*첫 메인 사진*/
	.img1{
	background-image:url(''); 
	background-color: pink;
	width:95%;
	height:700px;
	margin: auto;
	}
	
/*사진 가로정렬 3개*/
	.img1-1{
	background-image:url(''); 
	background-color: skyblue;
	width:32%;
	height:500px;
	float: left;
	}
	.img1-2{
	background-image:url(''); 
	background-color: skyblue;
	width:32%;
	height:500px;
	float: left;
	margin-left: 15px;
	}
	.img1-3{
	background-image:url(''); 
	background-color: skyblue;
	width:32%;
	height:500px;
	float: left;
	margin-left: 15px;
	}
	
/*사진 가로정렬 3개-2*/
	.img2-1{
	background-image:url(''); 
	background-color: orange;
	width:33%;
	height:500px;
	float: left;
	}
	.img2-2{
	background-image:url(''); 
	background-color: gray;
	width:33%;
	height:500px;
	float: left;
	}
	.img2-3{
	background-image:url(''); 
	background-color: orange;
	width:33%;
	height:500px;
	float: left;
	}

</style>
</head>
<body>
<%@include file="header.jsp" %>

<div id="wrapper">
		<div class="img1"></div>
	<br><br><br>
	<div style="height:500px; margin: auto;">
		<div class="img1-1"></div>
		<div class="img1-2"></div>
		<div class="img1-3"></div>
	</div>
	<br><br><br>
	<div style="height:500px; margin: auto;">
		<div class="img2-1"></div>
		<div class="img2-2"></div>
		<div class="img2-3"></div>
	</div>
</div>
	
<%@include file="footer.jsp" %>
</body>
</html>