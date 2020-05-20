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
	<header style="margin: 10px; padding: 10px; text-align: center;" >
		<h2>아이디 찾기 . 비밀번호 재설정</h2>
		<font color="gray">카카오 로그인을 연동하시면<br>아이디, 비밀번호를 찾을 필요 없이</font><br>나이키 닷컴을 이용 하실 수 있습니다.<br>
	</header>
	<div class="wrapper">
		<!--api만들어야함  -->
		<div style="height: 40px; text-align: center;">카카오계정 로그인 (API추후업뎃)</div>
		<div style="height: 40px">
			 <font color="gray">계정에 연결된 이메일이나 전화번호를 입력하시면<br>아이디 조회와 비밀번호를 재설정 하실 수 있습니다.</font>
		</div><br>
		<!-- 아무것도 입력 안하고 다음 클릭 시 필수항목으로 작성해야함 로직 만들어야함  -->
		<input type="text" name="emailAndTel" style="margin : 20px; padding: 10px; width: 400px; height: 15px;" placeholder="이메일 또는 전화번호를 입력해 주세요.">
		<!-- 경로 설정해주기  로직 만들어야함 -->
		<button onclick="location=''" style=" width: 430px; margin 20px; padding: 10px; background-color: black; color: white; text-align: center;">다음</button><br>
		<div style="margin: 20px;">
			<span><a href="loginPage" style="color: black;">로그인</a></span><font color="gray">으로돌아가기</font>			
		</div>
	</div>
</body>
</html>																																																																																																																																																																																																																																																																																													