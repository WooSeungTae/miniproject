<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>최근 구매 내역 - 나이키</title>
<style type="text/css">

	.table1 th{
		font-size:11px;
		font-weight: 500;
		vertical-align: middle;
	 }
	.table1 tr{
	 	display: table-row;
	 	vertical-align: inherit;
	 	border-color: inherit;
	 }
	.table1 td{
	 	font-size: 11px;
	 	text-align: center;
	 	padding-left: 0;
	 	padding-right: 0;
	 	padding: 14px 10px;
	 }
	 .table1 img{
	 	width: 150px;
		height: 135px;
	 	vertical-align: middle;
	 	border: none;
	 	margin: 0;
	 	padding: 0;
	 	cursor: pointer;
	 }
	 
	 .btnSubmit{
	 	display: inline-block;
	 	box-sizing: border-box;
	 	padding: 2px 8px;
	 	border: 1px solid transparent;
	 	border-radius: 0;
	 	font-size: 11px;
	 	line-height: 18px;
	 	text-decoration: none;
	 	vertical-align: middle;
	 	text-align: center;
	 	color: #fff;
	 	background-color: #333;
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
	.order_hr {
		border: solid 0.5px #e8ebed;
	}
	.order_text {
		font-size: 11.5px;
		font-weight: bold;
		margin-bottom: 15px;
	}
</style>
<script type="text/javascript">
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
</head>
<body>
<form action="myPage1">
<c:import url="/header"/>
<section>
	<div class="wrap">
<c:import url="/aside"/>
	<div class="detail_div">
	<!--  마이페이지 상단  -->
		<div>
			<h2>최근 구매 내역</h2>
			<div class="order_text">* 나이키가 당신의 모든 움직임을 응원합니다.</div>
			<hr class="order_hr">
		</div><br>
	<table class="table1" style="width: 100%;">
		<colgroup>
			<col width="110px;">
			<col width="143px;">
			<col width="180px;">
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
			<c:choose>
				<c:when test="${Ddto.size()!=0 }">
					<tbody>
					<c:forEach var="Ddto" items="${Ddto }">
					<tr>
						<td>${Ddto.orderDate}<br>[${Ddto.ordernum }]</td>
						<td><img id="${Ddto.image1}${Ddto.orderDate}" src="/nike/${Ddto.image1}" onerror="this.onerror=null; chageSrc(this)"></td> 
						<td><h4>${Ddto.codename}<br>size : ${Ddto.ordersize }</h4></td>
						<td>${Ddto.count }</td>
						<td><h4>KRW <fmt:formatNumber value="${Ddto.price}" pattern="#,###"/></h4></td>
						<td>배송완료<br><a href="towritelistall" class="btnSubmit">구매후기</a></td>
						<td>-</td>
					</tr>
					</c:forEach>
					</tbody>
				</c:when>
				<c:otherwise>
					<tbody class="displaynone">
						<tr>
							<td colspan="7" class="empty" height="70px;">주문 내역이 없습니다</td>
						</tr>
					</tbody>
				</c:otherwise>
			</c:choose>
	</table>
	</div>
	</div>
</section>
	<div style="float: left; width:100%;">
	<c:import url="/footer"/>
	</div>
</form>
</body>
</html>