<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문 상세 페이지</title>
</head>
<style>
	table{
		border: solid 0.5px #e8ebed; 
		font-size: 11px;
		width:70%;
	}
	th{
		padding: 10px 0;
	    font-weight: normal;
	    vertical-align: middle;
	}
	.order_a {
		text-decoration:none; 
		color:black;
	}
	.order_img{
		width: 150px;
		height: 135px;
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
	.orderList td{
		padding: 15px 0;
	    text-align: center;
	    vertical-align: middle;
	    word-wrap: break-word;
	    border-top: 0.5px solid #e8e8e8;
	}
	.orderView table{
		border: solid 0.5px #e8ebed; 
		border-collapse: collapse;
	}
	.orderView th{
		padding: 10px 0;
	    font-weight: normal;
	    vertical-align: middle;
	    border: solid 0.5px #e8ebed; 
	    width: 240px;
	}
	.orderView td{
		padding: 15px 0;
	    text-align: left;
	    text-indent: 20px;
	    vertical-align: middle;
	    word-wrap: break-word;
	    border: solid 0.5px #e8ebed; 
	}
</style>
<script type="text/javascript">
function delivery() {
	var con = confirm("정말 주문을 취소하시겠습니까?");
	if(con){
		fo.submit();
	}
}
</script>
<body>
<c:set var="order" value="${order }"></c:set>
<c:import url="/header"></c:import>
	<div style="width: 80%; margin: auto; margin-top: 170px; padding-bottom: 25px;">
<c:import url="/aside"></c:import>
<section>
	<div class="titleArea">
		<h2>ORDER DETAIL</h2>
	</div>
	<div>
		<input id="" name="" value="" type="hidden">
		<div>
			<!-- 주문정보 -->
			<div class="">
				<div class="title">
					<h3>주문정보</h3>
				</div>

				<div class="orderView">
					<table>
		
						<tbody>
						
							<tr>
								<th scope="row">주문번호</th>
								<td>${ordernum }</td>
							</tr>
							<tr>
								<th scope="row">주문일자</th>
								<td>${orderdate }</td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
			<!-- 결제정보 -->
			<div class="">
				<div class="title">
					<h3>결제정보</h3>
				</div>
				<div class="orderView">
					<table class="">
					<c:forEach items="${orderView}" var="orderView_num">
						<tbody>
							<tr class="">
								<th scope="row">총 주문금액</th>
								<td>
									<span class=""> <strong>${orderView_num.totalprice }</strong>원 </span>
								</td>
							</tr>
							<tr class="">
								<th scope="row">마일리지 사용 금액</th>
								<td><strong>${orderView_num.mile }</strong> Mile</td>
							</tr>
							<tr class="">
								<th scope="row">배송비</th>
								<td><strong>0</strong> 원</td>
							</tr>
							<tr class="">
								<th scope="row">총 결제금액</th>
								<td><strong>${orderView_num.totalprice - orderView_num.mile }</strong>원</td>
							</tr>
							<tr class="">
								<th scope="row">결제수단</th>
							
								<td><strong><span>무통장 입금</span></strong></td>
							</tr>
						</tbody>
						</c:forEach>
					</table>
				</div>
			</div>
			<br>
<!-- 주문상품 정보 -->
			<div class="orderList">
			<table>
			<!-- 테이블 th(제목) 고정 부분 -->
				<thead>
					<tr class="order_th">
						<th>이미지</th>
						<th>상품정보</th>
						<th>수량</th>
						<th>상품구매금액</th>
						<th>주문처리상태</th>
					</tr>
				</thead>
				<tbody class="">
					<c:forEach items="${orderList }" var="orderList">
					<tr>
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
							<fmt:formatNumber value="${orderList.price * orderList.count }" pattern="###,###,###"/>
							</strong>
						</td>
			<!-- 배송상태 -->		
						<td>
							<p class="delivery">${orderList.delivery }</p>
						</td>
			<!-- 배송상태 변경 위한 버튼 -->		
							
								
					</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>

			<!-- 배송지정보 -->
			<div class="">
				<div class="title">
					<h3>배송지정보</h3>
				</div>
				<div class="orderView">
					<table>
						<tbody>
							<tr>
								<th scope="row">받으시는분</th>
								<td><span>${orderView_num.name }</span></td>
							</tr>
							<tr class="">
								<th scope="row">주소</th>
								<td><span>${orderView_num.addr }</span></td>
							</tr>
							<tr>
								<th scope="row">휴대전화</th>
								<td><span>${orderView_num.tel }</span></td>
							</tr>
							<tr>
								<th scope="row">배송메시지</th>
								<td><span>${orderView_num.ordermemo }</span></td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
</section>
</div>
<form id ="fo" action="orderdeliveryChange">
<c:forEach items="${orderList }" var="orderList">
<input type="hidden" name="code" value="${orderList.code }">
<input type="hidden" name="ordersize" value="${orderList.ordersize }">
<input type="hidden" name="count" value="${orderList.count }">
</c:forEach>
<input type="hidden" name="ordernum" value="${ordernum }">
<input type="hidden" name="delivery" value="주문취소">
<input type="submit" value="주문 취소">
</form>
<c:import url="/footer"></c:import>
</body>
</html>