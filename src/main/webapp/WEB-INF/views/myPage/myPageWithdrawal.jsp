<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div style="width: 60%; margin: auto; padding-top: 80px;">
		<c:import url="/aside"></c:import>
		<h2>회원 탈퇴</h2>
		<form action="">
			회원탈퇴 사유<br>
			<br> <input type="radio" name="reason"> 회원탈퇴 후 재가입을 위해서
			<br> <input type="radio" name="reason"> 상품 구매 빈도가 낮아 이용할
			필요가 없어서<br> <input type="radio" name="reason"> 서비스 및
			고객지원이 만족스럽지 못해서<br> <input type="radio" name="reason">
			사용 PC 또는 모바일의 환경과 맞지 않아서<br> <input type="radio" name="reason">
			별다른 이유없이 탈퇴<br>
			<br> 탈퇴하시려는 사유를 입력해주세요.<br>
			<textarea rows="5" cols="58">NIKE에 하시고 싶은 말씀이 있으시면 남겨주세요. 2,000자까지 입력 할 수 있습니다.</textarea>
			<br>
			<br> 회원 탈퇴 동의<br> <input type="checkbox"> 회원탈퇴 안내를
			모두 확인하였으며 탈퇴에 동의합니다.<br> <input type="submit" value="탈퇴하기">
		</form>
	</div>
</body>
</html>