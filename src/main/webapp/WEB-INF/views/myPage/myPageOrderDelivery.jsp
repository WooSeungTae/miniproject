<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문내역/배송현황 - 나이키</title>
</head>
<style>
	.order_hr{border:solid 0.5px #e8ebed; }
	.order_text{font-size: 11.5px; font-weight: bold; margin-bottom: 15px;}
</style>
<body>
<header>
	<c:import url="/header"></c:import>
</header>
<div style="width: 80%; margin: auto; padding-top: 20px; padding-bottom: 450px;">
	<c:import url="/aside"></c:import>
		<!--  마이페이지 상단  -->
		<div>
			<h2>주문내역/배송현황</h2>
			<div class="order_text">* 나이키가 당신의 모든 움직임을 응원합니다.</div>
			<hr class="order_hr">
		</div>
		<!-- 최근 등록 주문 내역 -->
		<section>
			<form style="border: solid 0.5px #e8ebed; ">
			
			</form>



			<hr class="order_hr">
		</section>

		<!-- 가운데 부분 -->


</div>
<footer>
	<c:import url="/footer"></c:import>
</footer>
</body>
</html>