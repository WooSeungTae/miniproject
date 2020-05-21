<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디/비밀번호 찾기</title>
<style type="text/css">
	.wrapper{max-width: 100%; height: 100%; padding: 10px; text-align: center;}
</style>
</head>
<body>
<form action="" method="get">
	<header style="margin: 10px; padding: 10px; text-align: center;" >
		<h2>아이디 찾기 . 비밀번호 재설정</h2>
	</header>
	<div class="wrapper">
		<!-- 아무것도 입력 안하고 다음 클릭 시 필수항목으로 작성해야함 로직 만들어야함  -->
		<input type="text" name="id" style="margin : 20px; padding: 10px; width: 400px; height: 15px;" value="아이디 "><br>
		<input type="text" name="tel" style="margin : 20px; padding: 10px; width: 400px; height: 15px;" value="전화번호 "><br>
		<input type="text" name="question" style="margin : 20px; padding: 10px; width: 400px; height: 15px;" value="좋아하는 색은?"><br>
		<input type="text" name="answer" style="margin : 20px; padding: 10px; width: 400px; height: 15px;" placeholder="질문에 대한 답을 입력하세요"><br>
		<input type="text" name="pwd" style="margin : 20px; padding: 10px; width: 400px; height: 15px;" placeholder="새로운 비밀번호를 입력하세요"><br>
		<input type="text" name="pwdcheck" style="margin : 20px; padding: 10px; width: 400px; height: 15px;" placeholder="비밀번호 확인"><br>
		<label id = "check">확인란</label><br>
		<!-- 경로 설정해주기  로직 만들어야함 -->
		<button onclick="location=''" style=" width: 430px; margin 20px; padding: 10px; background-color: black; color: white; text-align: center;">수정</button><br>
		<div style="margin: 20px;">
			<span><a href="loginPage" style="color: black;">로그인</a></span><font color="gray">으로돌아가기</font>			
		</div>
	</div>
</form>
</body>
</html>																																																																																																																																																																																																																																																																																													