<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body style="width: 60%; margin: auto; padding-top: 80px;">
<c:import url="/aside"></c:import>
<h2>비밀번호 변경</h2>
<form action="">
기존 비밀번호<br><br>
<input type="text" placeholder="기존 비밀번호"><br><br>
새 비밀번호<br><br>
<input type="text" placeholder="새 비밀번호"><br><br>
새 비밀번호 확인<br><br>
<input type="text" placeholder="새 비밀번호 확인"><br><br>
<input type="submit" value="변경하기">
</form>
</body>
</html>