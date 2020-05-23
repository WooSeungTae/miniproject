<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!--  왼쪽 사이드바 부분 -->
	<aside style="float: left; margin: 0px 20px 0px 0px; height: auto; width:15%;">
		<div class="MyPage"><h1>MY PAGE</h1><hr></div>
		<div class="회원이름"><h3>회원이름</h3><hr></div>
		<div class="쇼핑정보">
			<label><b>쇼핑정보</b><br></label>
			<label><a href = "orders">주문 배송</a><br></label>
			<label><a href = "returnable">취소/반품</a><br><br></label><hr>
		</div>
		<div class="활동정보">
			<label><b>활동정보</b><br></label>
			<label><a href = "mileage">나의 MILE</a><br></label>
			<label><a href = "reviewintro">상품리뷰</a><br><br></label><hr>
		</div>
		<div class="나의정보">
			<label><b>나의정보</b><br></label>
			<label><a href = "account">회원정보 관리</a><br></label>
			<label><a href = "password">비밀번호 관리</a><br></label>
			<label><a href = "withdrawal">회원 탈퇴</a><br><br></label><hr>
		</div>
		<div class="나이키고객센터">
			<label><b>나이키닷컴 고객센터</b><br></label>
			<label><H3>080-022-0182</H3></label>
			<label><H4>월~일 : 오전 9시 ~ 오후 8시</H4><br></label><hr>
		</div>
		</aside>
</body>
</html>