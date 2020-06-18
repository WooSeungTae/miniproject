<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>나이키. Just Do It. Nike.com</title>
<style>

/*첫 메인 사진*/
	.img_main{
		background:url('image/NikeMain.png');
		background-size: cover;
		width: 94%;
		height: 700px;
		margin-top: -7px;
		margin-left: auto;
		margin-right: auto;
		margin-bottom: 80px;
	}
	
/*사진 가로정렬 3개*/
	.parent{
	    width: 94%;
	    display: flex;
	    margin-left: auto;
		margin-right: auto;
		margin-bottom: 80px;
	}
	
	.first {
	    flex:1;
	    box-sizing: border-box;
	}
	.first img{
		width:458px;
		height: 580px;
	}
	
	.second{
	    flex:1;
	    margin: 0px 10px;
	    box-sizing: border-box;
	}
	.second img{
		width:458px;
		height: 580px;
	}
	
	.third{
	    flex:1;
	    box-sizing: border-box;
	}
	.third img{
		width:458px;
		height: 580px;
	}
	
	.parent a{
	color:black;
	text-decoration: none;
	}
	.first .second .third a{
	color:black;
	text-decoration: none;
	}
	.font_h4{
	font-size: 17.5px;
	}
	
/*사진 가로정렬 3개-2*/
	.comboImg{
		width:94%;
		margin-left: auto;
		margin-right: auto;
	}
</style>
</head>
<body>
<c:import url="/header"/>
	<div style="width: 100%; margin: auto; margin-top: 132px;">
		<div class="img_main"></div>
		<div class="parent">
			<div class="first">
				<a href="/nike/Women"> <img src="image/zebraGirl.png"
					alt="zebraGirl">
				</a> <a href="/nike/Women">
					<h4 class="font_h4">여성 컬렉션 보러가기</h4>
				</a>
			</div>
			<div class="second">
				<a href="/nike/Men"> <img src="image/TheQuiett.png"
					alt="TheQuiett">
				</a> <a href="/nike/Men" class="secondImg">
					<h4 class="font_h4">남성 컬렉션 보러가기</h4>
				</a>
			</div>
			<div class="third">
				<a href="/nike/Kids"> <img src="image/babyGirl.png"
					alt="babyGirl">
				</a> <a href="/nike/Kids" class="secondImg">
					<h4 class="font_h4">키즈 컬렉션 보러가기</h4>
				</a>
			</div>
		</div>
		<div align="center">
			<img src="image/comboImg.png" class="comboImg">
		</div>
	</div>
<c:import url="/footer"/>
</body>
</html>