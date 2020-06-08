<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문 관리</title>
<style type="text/css">
	/*회원 목록 테이블에 나타난 회원정보 테이블모양*/
	.membertable {
		width : 100%;
		border-top : 1px solid #d2d2d2;
		border-collapse: collapse;
	}
	.membertable th,td{
		border-bottom : 1px solid #d2d2d2;
		padding: 10px;
	}
	/*회원 목록 테이블 맨윗부분 적용 부분*/
	.tablehead { color: white; background:#c8c8c8; font-family: monospace; 
				font-size: 20px;}
	/*회원 목록 테이블 정보 부분*/
	.tablemain { font-family: monospace; font-size: 20px;}
	/*맨 위에 있는 제목*/
	.maintitle {font-family: monospace; font-size: 30px; font-weight: bold;}
	/*안에 있는 제목*/
	.subtitle {font-size: 20px; margin: 20px; }
	/*body전체 부분(배경)*/
	.bodyback {padding: 20px;}
	/*안에 있는 div부분*/
	.bodyinside {background: white; padding: 10px; margin-top:20px; 
				height: 50%; border: 2px solid #d2d2d2;}
</style>
<script>
	function selChange() {
		var sel = document.getElementById('cntPerPage').value;
		location.href="order_care?nowPage=${paging.nowPage}&cntPerPage="+sel;
	}
</script>
</head>
<!-- https://master.dubuplus.com/43/616002 -->
<body>
<c:set var="date" value="${viewAll.orderDate}"/>
<%@include file="product_header.jsp" %>
<div class="bodyback">
<p class="maintitle">주문 관리</p>
<div class="bodyinside">
<form action="orderserch">
<label>검색할 아이디</label>
<input type="text" name="id"> <input type="submit" value="검색">
</form>
</div>
<div class="bodyinside">
<div class="subtitle"><a>주문 목록</a></div>
<div id="outter">
	<table class="membertable" >
		<tr class="tablehead"><th>날짜</th><th>아이디</th><th>이름</th>
		<th>주소</th><th>전화번호</th><th>은행명</th><th>계좌번호</th>
		<th>총금액</th><th>배송 방벙</th><th>주문 번호</th><th>현재 상태</th><th>배송 메모</th>
		<th>입금 확인</th><th>배송 취소</th>
		</tr>
		<c:choose>
			<c:when test="${not empty date}">
				<tr align="center"><td>${viewAll.orderDate}</td><td>${viewAll.id}</td><td>${viewAll.name}</td>
					<td>${viewAll.addr}</td><td>${viewAll.tel}</td><td>${viewAll.bankName}</td><td>${viewAll.bank}</td>
					<td>${viewAll.totalPrice}</td><td>${viewAll.orderType }</td><td>${viewAll.orderNum}</td>
					<td>${viewAll.delivery}</td><td>${viewAll.orderMemo}</td>
					<td><a href="deliveryChange?orderNum=${viewAll.orderNum }&delivery=shipping"><input type="button" value="입금 확인"></a></td>
					<td><a href="deliveryChange?orderNum=${viewAll.orderNum }&delivery=deposit"><input type="button" value="배송 취소"></a></td>
				</tr>
			</c:when>
			<c:otherwise>
				<tr align="center"><th colspan="14">등록된 정보가 없습니다</th></tr>
			</c:otherwise>
		</c:choose>
	</table>
</div>
</div>
</div>
</body>
</html>