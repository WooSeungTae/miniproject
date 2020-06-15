<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	.headerimg{  
	opacity: 1;
	display: block;
	width: 100px;
	height: 100px;
	transition: .5s ease;
	backface-visibility: hidden;
	}
	.headermainimg{  
	width: 150px;
	height: 100px;
	}
	.headerimg:hover{
	opacity: 0.3;
	}
	.headerstyle{
	background : white;
	position: fixed;
	top: 0;
	/* width: 100% */
	left: 0;
	right: 0;
	border-top : 3px solid #d2d2d2;
	border-bottom : 3px solid #d2d2d2;
	padding:10px;
	display:flex; text-align: center;
	}
	.headericon{margin-right: 20px; margin-left: 20px;}
	.headericon a{
	text-decoration:none; 
	color:black; 
	font-weight: bold; 
	font-size: 18px;
	}
	body {
	padding-top: 150px;
	margin: 0;
	}
</style>
</head>
<body>
<div class="headerstyle">
	<div class="headericon"><a href="main">
	<img src="image/nike.png" class="headermainimg"></a>
	</div>
	<div class="headericon"><a href="inventory">
	<img src="image/inventory.png" class="headerimg">
	<label>상품 관리</label></a>
	</div>
	<div class="headericon"><a href="customer_care">
	<img src="image/customer.png" class="headerimg"><label>고객 관리</label></a>
	</div>
	<div class="headericon"><a href="QnA_board_care">
	<img src="image/qna.png" class="headerimg"><label>Q&A 관리</label></a>
	</div>
	<div class="headericon"><a href="review_board_care">
	<img src="image/board.png" class="headerimg"><label>REVIEW 관리</label></a>
	</div>
	<div class="headericon"><a href="order_care">
	<img src="image/order.png" class="headerimg"><label>주문 관리</label></a>
	</div>
	<div class="headericon"><a href="product_management">
	<img src="image/plus.png" class="headerimg"><label>상품 등록</label></a>
	</div>
</div>
</body>
</html>