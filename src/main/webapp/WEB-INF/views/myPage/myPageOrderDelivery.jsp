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
	.orderDate a{
		color:#2E2E2E;
	}
	.delivery{
		color:#b22222;
	}
	.orderSize{
		color:#848484;
		margin-top: 5px;
	}
	.detail_div{
		width:70%;
		float:left;
	}
	.wrap{
		margin-left: 15%;
		margin-right: 10%;
		margin-top: 160px;
	}
</style>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script>

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

		$(document).ready(function(){
		$('.orderCancel').click(function(){
			alert('확인 버튼을 클릭하면 주문이 취소됩니다.')
			$('.delivery').val("주문취소");
		});
	
		$('.orderFinish').click(function(){
			alert('구매확정이 완료되었습니다.')
			$('.delivery').val("배송완료");
		});});
		
</script>
<body>
<c:set var="size" value="${orderList.size()}"/>
<c:import url="/header"/>
<section>
	<div class="wrap">
		<c:import url="/aside"/>
			<div class="detail_div">
			<!-- 마이페이지 상단  -->
			<div>
				<h2>주문내역/배송현황</h2>
				<div class="order_text">* 나이키가 당신의 모든 움직임을 응원합니다.</div>
				<hr class="order_hr">
			</div><br>
			<table style="border: solid 0.5px #e8ebed; width: 100%;">
			<!-- 테이블 th(제목) 고정 부분 -->
				<thead>
					<tr class="order_th">
						<th>주문일자<br>[주문번호]</th>
						<th>이미지</th>
						<th>상품정보</th>
						<th>수량</th>
						<th>상품구매금액</th>
						<th>주문처리상태</th>
					</tr>
				</thead>
				<c:choose>
					<c:when test="${size ne 0}">
				<tbody>
					<c:forEach items="${orderList }" var="orderList">
					<tr>
			<!-- 주문일자, 주문번호 -->		
						<td class="orderDate">
							<fmt:formatDate value="${orderList.orderDate }" pattern="yyyy.MM.dd"/>
							<p><a href="/nike/orderView?ordernum=${orderList.ordernum }&orderDate=${orderList.orderDate}">[${orderList.ordernum }]</a></p> 
						</td>
			<!-- 구매 사진 이미지 -->		
						<td class="image1">
							<a href="/nike/productdetail?code=${orderList.code }">
							<img id="${orderList.code }" src="/nike/${orderList.image1 }" 
							class="order_img" onerror="this.onerror=null; chageSrc(this)"></a>
						</td>
			<!-- 상품 이름, 상품 사이즈 -->	
						<td class="product">
							<strong class="CodeName"><a	href="/nike/productdetail?code=${orderList.code }" class="order_a">${orderList.codename }</a></strong>
							<div class="orderSize">[사이즈 : ${orderList.ordersize }]</div>
						</td>
			<!-- 구매할 수량 -->		
						<td class="count">${orderList.count }</td>
			<!-- 구매 가격 -->		
						<td class="price">
							<strong>
							<fmt:formatNumber value="${orderList.price * orderList.count }" pattern="###,###,###"/>원
							</strong>
						</td>
			<!-- 배송상태 -->		
						<td>
							<p class="delivery">${orderList.delivery }</p>
						</td>
					</tr>
					</c:forEach>
				</tbody>
			</c:when>
			<c:otherwise>
		<!-- 주문 내역 없을 때 출력될 내용 -->		
				<tbody class="displaynone">
					<tr>
						<td colspan="7" class="empty" height="70px;">주문 내역이 없습니다</td>
					</tr>
				</tbody>
			</c:otherwise>
		</c:choose>
			</table>
		<br>
		<hr class="order_hr">
		</div>
	</div>
</section>
	<div style="float: left; width:100%;">
	<c:import url="/footer"/>
	</div>
</body>
</html>