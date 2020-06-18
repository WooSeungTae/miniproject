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
		width:100%;
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
	.orderView tr{
		
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
	.btn_css input{
		border-color: black;
		background-color: black;
		color: white;
		font-size: 11px;
		height: 25px;
		width: 70px;
	}
	/* 페이지 설정 */
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
<script type="text/javascript">
function delivery() {
	var con = confirm("정말 주문을 취소하시겠습니까?");
	if(con){
		fo.submit();
	}
}
</script>
<body> 
<c:set var="order" value="${order }"/>
<c:import url="/header"/>
<form id ="fo" action="orderdeliveryChange">
<section>
	<div class="wrap">
		<c:import url="/aside"/>
			<div class="detail_div">
				<div class="titleArea">
					<h2>ORDER DETAIL</h2>
				</div>
				<div>
					<!-- 주문정보 -->
					<div>
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
					<div>
						<div class="title">
							<h3>결제정보</h3>
						</div>
						<div class="orderView">
							<table class="">
							<c:forEach items="${orderView}" var="orderView_num">
								<tbody>
									<tr>
										<th scope="row">총 주문금액</th>
										<td>
											<strong><fmt:formatNumber value="${orderView_num.totalprice }" pattern="###,###,###"/>원</strong>
										</td>
									</tr>
									<tr>
										<th scope="row">마일리지 사용 금액</th>
										<td>
										<strong><fmt:formatNumber value="${orderView_num.mile }" pattern="###,###,###"/> Mile</strong>
										</td>
									</tr>
									<tr>
										<th scope="row">배송비</th>
										<td><strong>0</strong> 원</td>
									</tr>
									<tr>
										<th scope="row" style="background-color: #f7f7f7;">총 결제금액</th>
										<td>
											<strong style="color:#b22222; font-size: 15px;">
											<fmt:formatNumber value="${orderView_num.totalprice - orderView_num.mile }" pattern="###,###,###"/>원</strong>
										</td>
									</tr>
									<tr>
										<th scope="row" style="background-color: #f7f7f7;">결제수단</th>
										<td><strong>무통장 입금</strong></td>
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
					</table>
					</div>
					<!-- 배송상태 변경 위한 버튼 -->	
					<div class="btn_css" style="margin-top: 4px;">
						<table style="border-color: white;">
							<tr align="right">
							<c:choose>
								<c:when test="${order eq '입금중' }">
								<td>
									<input type="submit"  value="주문취소">
								</td>
								</c:when>
								<c:otherwise>
								<td>
									<input type="button" value="주문취소" disabled="disabled">
								</td>
								</c:otherwise>
							</c:choose>
							<c:choose>
								<c:when test="${order eq '배송중' }">
								<td style="width: 72px;">
									<a href="deliveryChange?ordernum=${ordernum }&delivery=배송완료">
									<input type="button" value="구매확정"></a>
								</td>
								</c:when>
								<c:otherwise>
								<td style="width: 72px;">
									<input type="button" value="구매확정" disabled="disabled">
								</td>
								</c:otherwise>
							</c:choose>
							</tr>
						</table>
					</div>
					<!-- 배송지정보 -->
					<div>
						<div class="title">
							<h3>배송지정보</h3>
						</div>
						<div class="orderView">
							<table>
							<c:forEach items="${orderView}" var="orderView_num">
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
							</c:forEach>
							</table>
						</div>
					</div>
				</div>
			</div>
	</div>
</section>

<c:forEach items="${orderList }" var="orderList">
<input type="hidden" name="code" value="${orderList.code }">
<input type="hidden" name="ordersize" value="${orderList.ordersize }">
<input type="hidden" name="count" value="${orderList.count }">
</c:forEach>
<input type="hidden" name="ordernum" value="${ordernum }">
<input type="hidden" name="delivery" value="주문취소">
</form>
	<div style="float: left; width:100%;">
		<c:import url="/footer"/>
	</div>
</body>
</html>