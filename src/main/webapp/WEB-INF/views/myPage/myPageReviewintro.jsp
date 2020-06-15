<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>나의 상품리뷰</title>
</head>
<body>
	<header>
		<c:import url="/header">
		</c:import>
	</header>

	<div style="width: 60%; margin: auto; padding-top: 150px; padding-bottom: 300px;">
		<div><c:import url="/aside"></c:import></div>
		<div>
		<h2>나의 리뷰모아 보기</h2>
		<label><a href="myreviewlistall">전체보기>></a></label><br>
		<hr>
		<br>
		<br>
		<br>
		</div>
	</div>

	<footer>
			<c:import url="/footer">
			</c:import>
	</footer>
</body>
</html>