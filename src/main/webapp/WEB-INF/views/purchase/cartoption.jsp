<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>장바구니 옵션 변경</h2>
	<form action="cartoptionchange" method="get">
		<div class="option-wrap">
			<div class="size-grid-type padding radius">
				<strong class="tit">사이즈 선택</strong>
				<div class="product-option_radio square">
					<div class="opt-list">
						<c:forEach var="ordersize" begin="230" end="330" step="10">
							<input type="button" class="button5" name="ordersize" value="${ordersize}" id="${ordersize}" onclick="sizebuttonclick(this.id)">
							<input type="radio" id="${ordersize*10 }" name="ordersize" value="${ordersize }" hidden="" >
							<c:if test="${ordersize%270 eq 0 || ordersize%320 eq 0}">
								<br>
							</c:if>
						</c:forEach>
					</div>
				</div>
			</div>
			<div class="stocked-wrap line" id="set-restock-alarm" style="display:block">
				<div class="quantity" style="margin-bottom:15px;">
					<h2 class="tit"><span>수량</span></h2>
					<span class="btn-qy">
						<input id="count" name="count" class="label" type="text" value="1">
						<button type="button" class="btn-minus" style="width:20px; border:1px solid #EAEAEA; background-color:#EAEAEA; font-size:15px;" onclick="clickminus()">-</button>
						<button type="button" class="btn-plus" style="width:20px; border:1px solid #EAEAEA; background-color:#EAEAEA; font-size:15px;" onclick="clickplus()">+</button>
					</span>
				</div>
			</div>
		</div>
	</form>
</body>
</html>