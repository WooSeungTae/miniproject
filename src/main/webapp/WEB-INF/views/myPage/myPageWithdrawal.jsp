<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	/* 탈퇴하기 버튼 */
	.member_delete_input2{
	background-color: black;
	border-color: black;
	color: white;
	font-size: 16px;
	width: 450px;
	height: 50px;
	}
	/* 부제목 폰트 설정 */
	.member_delete_font{
	font-size: 11px;
	}
	/* 내용 폰트 설정 */
	.member_delete_font2{
	font-size: 12px;
	}
	/* textarea 설정 */
	.member_delete_area{
	font-size: 12px;
	color: #A6A6A6;
	background-color: #EAEAEA;
	width: 600px;
	height: 140px;
	text-indent:10px;
	border: 1px solid #D5D5D5;
	margin-bottom: 10px;
	}
	/* 라디오버튼 css-디자인 추후업뎃 */
	.radiobtn{
	width: 15px;
	height: 15px;
	}
	
</style>
</head>
<body>
<header><c:import url="/header"></c:import></header>
	<div style="width: 60%; margin: auto; padding-top: 80px; padding-bottom: 200px;">
		<c:import url="/aside"></c:import>
	<div style="line-height: 170%;">
		<h2>회원 탈퇴</h2>
		<form action="/nike/userDelete">
			<div class="member_delete_font">회원탈퇴 사유</div>
			<div class="member_delete_font2" style="margin-bottom: 10px;">
				<input type="radio" name="reason" class="radiobtn"> 회원탈퇴 후 재가입을 위해서<br>
				<input type="radio" name="reason" class="radiobtn"> 상품 구매 빈도가 낮아 이용할 필요가 없어서<br> 
				<input type="radio" name="reason" class="radiobtn"> 서비스 및 고객지원이 만족스럽지 못해서<br> 
				<input type="radio" name="reason" class="radiobtn"> 사용 PC 또는 모바일의 환경과 맞지 않아서<br> 
				<input type="radio" name="reason" class="radiobtn"> 별다른 이유없이 탈퇴<br>
			</div>
			<div class="member_delete_font">탈퇴하시려는 사유를 입력해주세요.</div>
			<textarea class="member_delete_area" placeholder="NIKE에 하시고 싶은 말씀이 있으시면 남겨주세요. 2,000자까지 입력 할 수 있습니다."></textarea>
			<br>
			<div class="member_delete_font">회원 탈퇴 동의</div>
			<div class="member_delete_font2">
				<input type="checkbox"> 회원탈퇴 안내를 모두 확인하였으며 탈퇴에 동의합니다
			</div>
			<br>
			<input type="submit" value="탈퇴하기" name="userDelete" class="member_delete_input2">
		</form>
	</div>
	</div>
<footer><c:import url="/footer"></c:import></footer>
</body>
</html>