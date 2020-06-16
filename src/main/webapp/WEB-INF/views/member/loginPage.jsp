<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<style type="text/css">
	.loginPage_all{width: 100%; margin: auto; margin-top: 170px;}
	.loginPage_title{text-align: center; }
	.minilogo{width: 80px; height: 50px; margin-bottom: -10px;}
	.wrapper{max-width: 100%; max-height: 100%; display: block; text-align: center;}
	.input01{height: 15px; width: 330px; margin: 10px; padding: 10px;}
</style>
</head>
<body >
<c:import url="/header"></c:import>
<div class="loginPage_all">
	<div class="loginPage_title">
		<img class="minilogo" src="image/NikeSwoosh.png">
		<h2>나이키 로그인</h2>		
	</div>
	<form action="loginChk" method="post">
		<div class="wrapper">
			<input class="input01" type="text" name="id" placeholder="아이디"><br>
			<input class="input01" type="password" name="pwd" placeholder="비밀번호"><br>
			<div style="padding: 10px;">
				<span><input type="checkbox" name="saveLogin" value="check"><font color="gray" size="2">로그인 유지</font></span>
				<font size="2" ><a href="userReset" style="padding: 0 0 0 130px; text-decoration: none; color:gray;">아이디/비밀번호 찾기</a></font>				
			</div>
			<div style="padding: 10px;">
				<input type="submit" value="로그인" style="width: 355px; height: 45px; border-radius: 5px; 
					border-color:black;	background-color: black; font-size:17px; color: white;">
			</div>
			<div style="margin-bottom: 10px;">
				<a href="https://kauth.kakao.com/oauth/authorize?
				client_id=ced6c950f8e687c8d26beefb5315561a
				&redirect_uri=http://localhost:8080/nike
				&response_type=code">
	            <img style="width: 355px; height: 47px;" src="image/kakao_login_large_wide.png"></a>
			</div>
			<span><font size="2" color="gray">회원이 아니신가요?</font></span>
			<a href="memberJoin" style="color:black; font-size: 12px;">회원가입</a><br><br>
			<!-- 비회원 주문 페이지 만들어야함 -->
			<a href="" style="color:black; font-size: 12px;">비회원 주문 조회</a>
		</div>
	</form>
</div>
</body>
</html>