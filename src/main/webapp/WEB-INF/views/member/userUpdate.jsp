<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디/비밀번호 찾기</title>
<style type="text/css">
.wrapper {
	max-width: 100%;
	height: 100%;
	padding: 10px;
	text-align: center;
}

.text {
	margin: auto;
	padding: 10px 10px 10px 0px;
	width: 400px;
	height: 15px;
	text-align: left;
}
</style>
<script type="text/javascript">
	function checkAnswer() {
		var answer = document.getElementById("answer").value;
		if(answer!='${searchId.getAnswer()}'){
			document.getElementById("answer").value="";
			document.getElementById("answer").focus();
			alert('입력하신 질문의 결과값이 다릅니다.')
		}
	}

	function checkPwd(){
		var checkPwd= document.getElementById("pwd").value;
		var checkPwdcheck= document.getElementById("pwdcheck").value;
		if(checkPwd!=checkPwdcheck){
			document.getElementById("pwdcheck").value="";
			document.getElementById("pwdcheck").focus();
			document.getElementById("check").innerHTML = '불일치';

		}
	}
	function submitOk(){
		if(document.getElementById("answer").value==""){
			alert('질문에 대한 답을 입력하여 주세요')
		}
		else if(document.getElementById("pwd").value==""){
			alert('새로운 비밀번호를 입력하여 주세요')
		}else if(document.getElementById("pwdcheck").value==""){
			alert('비밀번호 확인하여주세요')
		}else{
			fo.submit();
		}
		
	}
	
</script>
</head>
<body>
	<c:import url="/header"></c:import>
	<form id="fo" action="userUpdate" method="post">
		<c:if test="${searchId.getId()==null }">
			<script>
			alert('해당하는 정보가 없습니다.');
			location.href="userReset";
		</script>
		</c:if>
		<header style="margin: 10px; padding: 10px; text-align: center;">
			<h2>아이디 찾기 . 비밀번호 재설정</h2>
		</header>
		<div class="wrapper">
			<!-- 아무것도 입력 안하고 다음 클릭 시 필수항목으로 작성해야함 로직 만들어야함  -->
			<div class="text"><b>아이디<b></div>
			<input type="text" name="id"
				style="margin-bottom: 20px; padding: 10px; width: 400px; height: 15px;"
				value="${searchId.getId() } "><br>
			<div class="text"><b>전화번호<b></div>
			<input type="text" name="tel"
				style="margin-bottom: 20px; padding: 10px; width: 400px; height: 15px;"
				value="${searchId.getTel() }"><br>
			<div class="text"><b>질문<b></div>
			<input type="text" name="question"
				style="margin-bottom: 20px; padding: 10px; width: 400px; height: 15px;"
				value="${searchId.getQuestion()}"><br>
			<div class="text"><b>답변<b></div>
			<input type="text" id="answer" name="answer"
				style="margin-bottom: 20px; padding: 10px; width: 400px; height: 15px;"
				placeholder="질문에 대한 답을 입력하세요" onchange="checkAnswer()"><br>
			<div class="text"><b>새로운 비밀번호<b></div>
			<input type="text" id="pwd" name="pwd"
				style="margin-bottom: 20px; padding: 10px; width: 400px; height: 15px;"
				placeholder="새로운 비밀번호를 입력하세요"><br>
			<div class="text"><b>비밀번호 확인<b></div>
			<input type="text" id="pwdcheck" name="pwdcheck"
				style="margin-bottom: 20px; padding: 10px; width: 400px; height: 15px;"
				placeholder="비밀번호 확인" onchange="checkPwd()"><br> <label
				id="check"></label><br>
			<!-- 경로 설정해주기  로직 만들어야함 -->
			<button type="button" onclick="submitOk()"
				style="width: 430px; margin 20px; padding: 10px; background-color: black; color: white; text-align: center;">수정</button>
			<br>
			<div style="margin: 20px;">
				<span><a href="loginPage" style="color: black;">로그인</a></span><font
					color="gray">으로돌아가기</font>
			</div>
		</div>
	</form>
	<c:import url="/footer"></c:import>
</body>
</html>
