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
<h2>회원정보 수정</h2>
<form action="">
아이디<br><br>
<input type="text" placeholder="com.nike.controller 접속 ID"><br><br>
이름<br><br>
<input type="text" placeholder="김개똥 이름"><br><br>
이메일<br><br>
<input type="text" placeholder="com.nike.controller 이메일"><br><br>
주소<br><br>
<input type="text" placeholder="주소 수정랑"><br><br>
휴대폰<br><br>
<input type="text" placeholder="휴대폰 번호"><br><br>
<input type="checkbox"> 이메일을 통한 상품 및 이벤트 정보 수신에 동의합니다.(선택)<br><br>
<input type="checkbox"> 휴대폰을 통한 상품 및 할인쿠폰 등의 정보 수신에 동의합니다.(선택)<br><br>
<input type="submit" value="수정하기">
</form>

</body>
</html>