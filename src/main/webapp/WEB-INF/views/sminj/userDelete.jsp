<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	.mainHome_btn{
	background-color: black;
	border-color: black;
	color: white;
	font-size: 13.5px;
	font-weight: bold;
	width: 370px;
	height: 45px;
	border-radius: 1.5px;
	}
	.userDelete_center{
	text-align:center;
	margin-top: 200px;
	}
	.userDelete_margin{
	margin-top: 70px;
	margin-bottom: 40px;
	}
	.userDelete_p{
	text-align: center;
    line-height: 20px;
    color: #999999;
    font-size: 13.5px;
    font-weight: bold;
	}
</style>
</head>
<body style="width:100%; margin:auto;">
<c:import url="/header"/>
<section>
	<form action="/nike/">
		<div class="userDelete_center">
			<div class="userDelete_margin">
				<div>
					<h2>회원탈퇴 신청이 완료되었습니다.</h2>
					<p class="userDelete_p">Nike를 이용해 주셔서 감사합니다.</p>
				</div>
			</div>
			<div>
				<input type="submit" value="메인화면으로 이동" class="mainHome_btn">
			</div>
		</div>
	</form>
</section>
<c:import url="/footer"></c:import>
</body>
</html>