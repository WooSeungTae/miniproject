<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib  prefix="spring" uri="http://www.springframework.org/tags" %>
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
	
	<header>
		<div>
			<img class="minilogo" src="<spring:url value='/resources/img/nikelogo.jpg'/>">
			<h2>나이키 로그인</h2>		
		</div>
	</header>
	<form action="" method="post">
		<div class="wrapper">
			<input class="input01" type="text" name="id" placeholder="아이디"><br>
			<input class="input01" type="password" name="pwd" placeholder="비밀번호"><br>
			<div>
				<span><input type="checkbox" name="saveLogin" value="check"><font color="gray" size="2">로그인 유지</font></span>
				<font size="2" ><a href="userReset" style="padding: 0 0 0 130px;">아이디/비밀번호 찾기</a></font>				
			</div><br>
			<span ><font size="2" color="gray">회원이 아니신가요?</font></span>
			<a href="memberJoin">회원가입</a><br><br>
			<!-- 비회원 주문 페이지 만들어야함 -->
			<a href=""><font size="2" color="gray">비회원 주문 조회</font></a>
		</div>
	</form>
</body>
</html>