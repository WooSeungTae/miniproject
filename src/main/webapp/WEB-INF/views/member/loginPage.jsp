<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<style type="text/css">
	header{max-width: 100%; height:100%; text-align: center;}
	.minilogo{width: 100px; height: 80px;}
	.wrapper{max-width: 100%; max-height: 100%; display: block; text-align: center;}
	.input01{height: 15px; width: 330px; margin: 10px; padding: 10px;}
</style>
</head>
<body >
	<c:import url="/header"></c:import>
	<header>
		<div>
			<img class="minilogo" src="image/nike.jpg">
			<h2>나이키 로그인</h2>		
		</div>
	</header>
	<form action="loginChk" method="post">
		<div class="wrapper">
			<input class="input01" type="text" name="id" placeholder="아이디"><br>
			<input class="input01" type="password" name="pwd" placeholder="비밀번호"><br>
			<div style="padding: 10px;">
				<span><input type="checkbox" name="saveLogin" value="check"><font color="gray" size="2">로그인 유지</font></span>
				<font size="2" ><a href="userReset" style="padding: 0 0 0 130px;">아이디/비밀번호 찾기</a></font>				
			</div><br>
			<div style="padding: 10px;">
				<input type="submit" value="로그인" style="width: 360px; height: 40px; background-color: black; color: white;">
			</div>
			<div>
				<a href="https://kauth.kakao.com/oauth/authorize?
				client_id=ced6c950f8e687c8d26beefb5315561a
				&redirect_uri=http://localhost:8080/nike
				&response_type=code">
	            <img style="width: 360px;" src="image/kakao_login_large_wide.png"></a>
			</div>
			<span ><font size="2" color="gray">회원이 아니신가요?</font></span>
			<a href="memberJoin">회원가입</a><br><br>
			<!-- 비회원 주문 페이지 만들어야함 -->
			<a href=""><font size="2" color="gray">비회원 주문 조회</font></a>
		</div>
	</form>
		<c:import url="/nike/footer"></c:import>
</body>
</html>