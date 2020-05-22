<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디/비밀번호 찾기</title>
<style type="text/css">

.userResetback {
position: absolute;
background-color : #BDBDBD;
width: 100%;
height : 1375px;
z-index:1;
top : 0;
left : 0;
opacity: 0.3;
}
.userResetTable{
	position: relative;
	z-index: 100;
	background-color: white;
	width: 500px;
	height : 500px;
	margin: auto;
	opacity: 1;
	
}

.userReset {
	max-width: 100%;
	height: 100%;
	padding: 10px;
	text-align: center;
}

.userResetHeader {
	margin: 30px;
	padding: 10px;
	text-align: center;
}

.userResetDiv {
	height: 40px;
	text-align: center;
}

.userRestExplanation {
	color: gray
}

input#write[type=text] {
	margin: 20px;
	padding: 10px;
	width: 400px;
	height: 15px;
}

.sub {
	background-color: #000000;
	font-size: 18px;
	width: 430px;
	padding: 10px;
	font-family: Open Sans, Helvetica, Arial, sans-serif;
	color: white;
	text-align: center;
	position: relative;
	-webkit-transition: border .25s linear, color .25s linear,
		background-color .25s linear;
	transition: border .25s linear, color .25s linear, background-color .25s
		linear;
}

.sub:hover {
	background-color: #333333;
	color: white;
	font-weight: 700;
	box-shadow: 5px 5px 5px 0px #000000;
}
</style>
</head>
<body >
<div class="userResetback"></div>
	<c:import url="/header"></c:import>
	<section class="userResetTable">
	<form action="userSearch" method="post">
		<header class="userResetHeader">
			<h2>아이디 찾기 . 비밀번호 재설정</h2>
			<font class="userRestExplanation">카카오 로그인을 연동하시면<br>아이디,
				비밀번호를 찾을 필요 없이
			</font><br>나이키 닷컴을 이용 하실 수 있습니다.<br>
		</header>
		<div class="userReset">
			<!--api만들어야함  -->
			<div class="userResetDiv">카카오계정 로그인 (API추후업뎃)</div>
			<div>
				<font class="userRestExplanation">계정에 연결된 이메일이나 전화번호를 입력하시면<br>아이디
					조회와 비밀번호를 재설정 하실 수 있습니다.
				</font>
			</div>
			<br>
			<!-- 아무것도 입력 안하고 다음 클릭 시 필수항목으로 작성해야함 로직 만들어야함  -->
			<input id="write" type="text" name="idtel"
				placeholder="아이디 또는 전화번호를 입력해 주세요."><br>
			<!-- 경로 설정해주기  로직 만들어야함 -->
			<button class="sub">Click Here!</button>
			<br>
	<div style="margin: 20px; position: relative; line-height: inherit; text-align: center;">
				<a href="loginPage" style="color: black; font-size: 15px;  vertical-align: inherit; "  >로그인 </a><font
					color="gray"  >으로돌아가기</font>
			</div>
		</div>
	</form>
	</section>
	<c:import url="/footer"></c:import>

</body>
</html>
