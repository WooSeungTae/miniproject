<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>나이키</title>
<style>
	.pwd_modify_input{
	width: 450px;
	height: 35px;
	margin-top:10px;
	text-indent:10px;
	border: 1px solid #e8ebed;
	}
	.pwd_modify_input2{
	background-color: black;
	border-color: black;
	color: white;
	font-size: 16px;
	width: 450px;
	height: 50px;
	}
	.pwd_modify_font{
	font-size: 11px;
	}
</style>
</head>
<body>
<header><c:import url="/header"></c:import></header>
<div style="width: 70%; margin: auto; padding-top: 80px; padding-bottom: 150px;">
	<c:import url="/aside"></c:import>
		<h2>비밀번호 변경</h2>
		<form action="">
			<div class="pwd_modify_font">기존 비밀번호</div>
			<input type="text" id="pwd" name="pwd" value="${pwd }" class="pwd_modify_input"><br><br>
			<div class="pwd_modify_font">새 비밀번호</div>
			<input type="text" placeholder="새 비밀번호 입력" class="pwd_modify_input"><br><br>
			<div class="pwd_modify_font">새 비밀번호 확인</div>
			<input type="text" placeholder="새 비밀번호 확인" class="pwd_modify_input"><br><br><br>
			<input type="submit" value="변경하기" class="pwd_modify_input2">
		</form>
</div>
		<h2>${pwd }</h2>
<footer><c:import url="/footer"></c:import></footer>
</body>
</html>