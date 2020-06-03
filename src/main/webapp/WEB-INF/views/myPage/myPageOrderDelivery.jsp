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
	.order_hr {
		border: solid 0.5px #e8ebed;
	}
	
	.order_text {
		font-size: 11.5px;
		font-weight: bold;
		margin-bottom: 15px;
	}
	td, th{
		font-size: 11px;

	}
	.order_img{
		width: 150px;
		height: 135px;
	}
	td{
	padding: 15px 0;
    text-align: center;
    vertical-align: middle;
    word-wrap: break-word;
    border-top: 1px solid #e8e8e8;
	}
	th{
		padding: 10px 0;
	    font-weight: normal;
	    vertical-align: middle;
	}
	.orderDate{
	}
</style>
<body>
	<header>
		<c:import url="/header"></c:import>
	</header>
	<div
		style="width: 80%; margin: auto; padding-top: 20px; padding-bottom: 250px;">
		<c:import url="/aside"></c:import>
		<!-- 마이페이지 상단  -->
		<section>
		<div>
			<h2>주문내역/배송현황</h2>
			<div class="order_text">* 나이키가 당신의 모든 움직임을 응원합니다.</div>
			<hr class="order_hr">
		</div><br>
			<table style="border: solid 0.5px #e8ebed; width: 70%;">
				<thead>
					<tr class="order_th">
						<th>주문일자<br>[주문번호]</th>
						<th>이미지</th>
						<th>상품정보</th>
						<th>수량</th>
						<th>상품구매금액</th>
						<th>주문처리상태</th>
						<th>취소/반품</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td class="orderDate">2020.06.02
							<p>	<a href="#">[20200602-0123456]</a> </p> 
						</td>
						<td class="image1"><a href=""><img src="image/pd3-3.PNG" onerror="" alt="" class="order_img"></a></td>
						<td class="product">
							<strong class="CodeName"><a	href=""	class="" style="text-decoration:none; color:black;">나이키 에어 줌 페가수스 37</a></strong>
							<div class="orderSize">[사이즈 : 220]</div>
						</td>
						<td class="count">1</td>
						<td class="price">
							<strong>19,000원</strong>
						</td>
						<td class="delivery">
							<p>배송완료</p>
						</td>
						<td class="service">
							<input type="button" value="주문취소"><br><br>
							<input type="button" value="구매확정">
						</td>
					</tr>
				</tbody>
				<tbody>
					<tr>
						<td class="orderDate">${orderDate }
							<p>	<a href="#">[${orderNum }]</a> </p> 
						</td>
						<td class="image1"><a href=""><img src="" onerror="" alt=""></a></td>
						<td class="product">
							<strong class="CodeName"><a	href=""	class="">${codeName }</a></strong>
							<div class="orderSize">[사이즈 : ${orderSize }]</div>
						</td>
						<td class="count">${count }</td>
						<td class="price">
							<strong>${price }</strong>
						</td>
						<td class="delivery">
							<p>배송완료</p>
						</td>
						<td class="service">
							<input type="button" value="주문취소"><br><br>
							<input type="button" value="구매확정">
						</td>
					</tr>
				</tbody>
			</table>
		</section><br>
		
		<hr class="order_hr">
	</div>
	<footer>
		<c:import url="/footer"></c:import>
	</footer>
</body>
</html>