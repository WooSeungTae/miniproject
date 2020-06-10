<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>
</head>
<body>
<c:import url="/header"></c:import>
	<div style="width: 70%; margin: auto; margin-top: 200px;">
<c:import url="/aside"></c:import>
	<!--  마이페이지 상단  -->
	<div>
	<h2>최근 주문 내역</h2>
	<h5>*나이키가 당신의 모든 움직임을 응원합니다.</h5>
	<hr>
	</div>
	<!-- 최근 등록 주문 내역 -->
	<section>
	<br><br><br><br><br>
	<img src="/nike/image/nike.jpg">
	
	
	<hr>
	</section>
	
	<!-- 가운데 부분 -->
	</div>
<c:import url="/footer"></c:import>
</body>
</html>