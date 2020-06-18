<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
	 	width: 143px;
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
<c:import url="/header"></c:import>
<form action="myPage1">
	<div style="width: 90%; margin: auto; padding-top: 80px; margin-top: 50px;">
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
	<table class="table1">
		<colgroup>
			<col width="110px;">
			<col width="143px;">
			<col width="180px;">
		</colgroup>
		
		<tbody>
			<tr>
				<c:choose>
				<c:when test="${Ddto.size()!=0 }">
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
					<c:forEach var="Ddto" items="${Ddto }">
						<td>${Ddto.orderDate}<br>[${Ddto.ordernum }]</a></td>
						<td><img id="${Ddto.image1}${Ddto.orderDate}" src="/nike/${Ddto.image1}" onerror="this.onerror=null; chageSrc(this)"></a></td> 
						<td><h4>${Ddto.codename}<br>size : ${Ddto.ordersize }</h4></td>
						<td>${Ddto.count }</td>
						<td><h4>KRW <fmt:formatNumber value="${Ddto.price}" pattern="#,###"/></h4></td>
						<td>배송완료<br><a href="towritelistall" class="btnSubmit">구매후기</a></td>
						<td>-</td>
					</c:forEach>
				</c:when>
				<c:otherwise>
					<hr>
					<br>
					<h2>최근 주문한 상품은 존재하지 않습니다.</h2>
				</c:otherwise>
				</c:choose>
			</tr>
		</tbody>
	</table>
</div>
<div style="padding: 300px 0 0 0;">
<c:import url="/footer"></c:import>
</div>
</form>
</body>
</html>