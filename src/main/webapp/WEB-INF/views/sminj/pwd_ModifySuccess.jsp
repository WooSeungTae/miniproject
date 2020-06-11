<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>pwdModifySuccess - 나이키</title>
<style type="text/css">
	.ContinueShopping_btn{
	background-color: black;
	border-color: black;
	color: white;
	font-size: 13.5px;
	font-weight: bold;
	width: 370px;
	height: 45px;
	border-radius: 1.5px;
	}
	.pwdSuccess_center{
	text-align:center;
	margin-bottom: -90px;
	}
	.pwdSuccess_margin{
	margin-top: 70px;
	margin-bottom: 40px;
	}
	.pwdSuccess_p{
	text-align: center;
    line-height: 20px;
    color: #999999;
    font-size: 13.5px;
    font-weight: bold;
	}
</style>
</head>
<body style="width:100%; margin:auto;">
<header><c:import url="/header"></c:import></header>
<section>
	<form action="/nike/main">
		<div class="pwdSuccess_center">
			<div class="pwdSuccess_margin">
				<div>
					<h2>비밀번호가 변경되었습니다.</h2>
					<p class="pwdSuccess_p">비밀번호가 성공적으로 변경 되었습니다.<br>나이키의 다양한 서비스를 이용해보세요.</p>
				</div>
			</div>
			<div>
				<input type="submit" value="계속 쇼핑하기" class="ContinueShopping_btn">
			</div>
		</div>
	</form>
</section>
<footer><c:import url="/footer"></c:import></footer>
</body>
</html>