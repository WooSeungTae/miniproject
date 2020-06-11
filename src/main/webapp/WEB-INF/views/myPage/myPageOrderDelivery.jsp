<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
	.order_a {
	text-decoration:none; 
	color:black;
	}
	.order_img{
		width: 150px;
		height: 135px;
	}

	td, th{
		font-size: 11px;
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
<script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script>

	$(document).ready(function(){
		$('.orderCancel').click(function(){
			alert('확인 버튼을 클릭하면 주문이 취소됩니다.')
			$('.delivery').text("주문취소");
		});
		$('.orderFinish').click(function(){
			alert('구매확정이 완료되었습니다.')
			$('.delivery').text("배송완료");
		});
	});

	function chageSrc(obj) {
		var imgId = obj.id;
		var imgName = obj.src;
		imgName = imgName.toLowerCase();
		var firstName = imgName.substring(0, imgName.indexOf('.') + 1);
		var lastName = imgName.substring(imgName.indexOf('.') + 1);
		lastName = lastName.toUpperCase();
		var changeName = firstName + lastName;
		document.getElementById(imgId).src = changeName;
		console.log(changeName);
	}
	
</script>
<body>
<c:import url="/header"></c:import>
	<div style="width: 80%; margin: auto; margin-top: 170px; padding-bottom: 25px;">
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
					<c:forEach items="${list }" var="list">
					<tr>
						<td class="orderDate">
							<fmt:formatDate value="${list.orderDate }" pattern="yyyy.MM.dd"/>
							<p><a href="#">[${list.ordernum }]</a></p> 
						</td>
						<td class="image1">
							<a href="/nike/productdetail?code=${list.code }">
							<img id="${list.code }" src="/nike/${list.image1 }" 
							class="order_img" onerror="this.onerror=null; chageSrc(this)"></a>
						</td>
						<td class="product">
							<strong class="CodeName"><a	href=""	class="order_a">${list.codeName }</a></strong>
							<div class="orderSize">[사이즈 : ${list.ordersize }]</div>
						</td>
						<td class="count">${list.count }</td>
						<td class="price">
							<strong>
							<fmt:formatNumber value="${list.price }" pattern="###,###,###"/>
							</strong>
						</td>
						<td class="">
							<p class="delivery">${list.delivery }</p>
						</td>
						<td class="service">
							<a href="orderCancel"><input type="button" value="주문취소" class="orderCancel"></a><br><br>
							<a href="orderFinish"><input type="button" value="구매확정" class="orderFinish"></a>
						</td>
					</tr>
					</c:forEach>
				</tbody>
			</table>
		</section><br>
		
		<hr class="order_hr">
	</div>
<c:import url="/footer"></c:import>
</body>
</html>