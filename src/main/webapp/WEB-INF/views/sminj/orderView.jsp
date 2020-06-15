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
<body>
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
								<td>${orderView_num.ordernum }</td>
							</tr>
							<tr>
								<th scope="row">주문일자</th>
								<td>${orderView_num.orderDate }</td>
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
						<tbody>
							<tr class="">
								<th scope="row">총 주문금액</th>
								<td>
									<span class=""> <strong>${orderView_num.totalprice }</strong>원 </span>
								</td>
							</tr>
						</tbody>
						<tbody class="">
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
						<th>주문일자<br>[주문번호]</th>
						<th>이미지</th>
						<th>상품정보</th>
						<th>수량</th>
						<th>상품구매금액</th>
						<th>주문처리상태</th>
						<th>취소/반품</th>
					</tr>
				</thead>
				<tbody class="">
					<c:forEach items="${orderList }" var="orderList">
					<tr>
			<!-- 주문일자, 주문번호 -->		
						<td class="orderDate">
							<fmt:formatDate value="${orderList.orderDate }" pattern="yyyy.MM.dd"/>
							<p><a href="#">[${orderList.ordernum }]</a></p> 
						</td>
			<!-- 구매 사진 이미지 -->		
						<td class="image1">
							<a href="/nike/productdetail?code=${orderList.code }">
							<img id="${orderList.code }" src="/nike/${orderList.image1 }" 
							class="order_img" onerror="this.onerror=null; chageSrc(this)"></a>
						</td>
			<!-- 상품 이름, 상품 사이즈 -->	
						<td class="product">
							<strong class="CodeName"><a	href="/nike/productdetail?code=${orderList.code }" class="order_a">${orderlist.codeName }</a></strong>
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
						<td class="deliveryChange">
							<form role="form" method="post" class="deliveryForm">
								<input type="hidden" name="ordernum" value="${orderList.ordernum }">
								<input type="hidden" name="delivery" class="delivery" value="">
							
								<input type="button" class="orderCancel" value="주문취소" name="orderCancel" id="orderCancel"><br><br>
								<input type="button" class="orderFinish" value="구매확정" name="orderFinish" id="orderFinish">
							</form>
						</td>
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
<c:import url="/footer"></c:import>
</body>
</html>