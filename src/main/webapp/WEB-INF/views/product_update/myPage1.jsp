<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	th{
		font-size:11px;
		font-weight: 500;
		vertical-align: middle;
	 }
	 tr{
	 	display: table-row;
	 	vertical-align: inherit;
	 	border-color: inherit;
	 }
	 td{
	 	font-size: 11px;
	 	text-align: center;
	 	padding-left: 0;
	 	padding-right: 0;
	 	padding: 14px 10px;
	 }
	 img{
	 	width: 133px;
	 	vertical-align: middle;
	 	border: none;
	 	margin: 0;
	 	padding: 0;
	 	cursor: pointer;
	 }
	 
	 
</style>
</head>
<body>
	<c:import url="/header"></c:import>
<div  style="width: 90%; margin: auto; padding-top: 80px;">
	<c:import url="/aside"></c:import>
<title>마이페이지</title>
</head>
<body>
<c:import url="/header"></c:import>
	<div style="width: 60%; margin: auto; padding-top: 80px;">
<c:import url="/aside"></c:import>
	<!--  마이페이지 상단  -->
	<div>
	<h2>최근 주문 내역</h2>
	<h5>*나이키가 당신의 모든 움직임을 응원합니다.</h5>
	<hr>
	</div>
	<div style="margin: 40px 0 10;">
		<h5>주문 상품 정보</h5>
	</div>
	<table>
		<colgroup>
			<col style="width:135px;">
			<col style="width:133px;">
			<col style="width:230px;">
			<col style="width:31px;">
			<col style="width:111px;">
			<col style="width:111px;">
			<col style="width:111px;">
		</colgroup>
		<thead style="display: table-header-group; vertical-align: middle; border-color: inherit; background: #eaeaea;">
			<tr>
				<th scope="col">주문일자<br>[주문번호]</th>
				<th scope="col">이미지</th>
				<th scope="col">상품정보</th>
				<th scope="col">수량</th>
				<th scope="col">상품구매금액</th>
				<th scope="col">주문처리상태</th>
				<th scope="col">취소/교환/반품</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<!-- 임의로 값들 넣어둠 주문한 상품과 정보를 불러와서 넣어줘야함 -->
				<td>2020-06-06<br><a href="#" style="text-decoration: underline; font-weight: 500;">[20200606-00002329]</a></td>
				<td><a href="#"><img src="image/pd1-1.png"></a></td> 
				<td><h4>나이키  리액트 Men</h4></td>
				<td>1</td>
				<td><h4>129,000</h4></td>
				<td>배송중</td>
				<td>-</td>
			</tr>
		</tbody>
	</table>
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