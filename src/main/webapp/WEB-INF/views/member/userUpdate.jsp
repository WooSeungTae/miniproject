<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디/비밀번호 찾기</title>
<style type="text/css">

.userUpdateBack {
position: absolute;
background-color : #BDBDBD;
width: 100%;
height : 1625px;
z-index:1;
top : 0;
left : 0;
opacity: 0.3;

}
.userUpdateTable{
	position: relative;
	z-index: 100;
	background-color: white;
	width: 445px;
	height : 750px;
	margin: 30px auto;
	opacity: 1;
	
}
.userUpdate {
	width: 450px;
	margin: auto;
	height: 100%;
	padding: 10px;
	font-size: 18px;
	font-weight: 800;
}

.userUpdateHeader {
	margin: 10px;
	padding: 10px;
	text-align: center;
}


.userUpdate button {
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

.userUpdate button:hover {
	background-color: #333333;
	color: white;
	font-weight: 700;
	box-shadow: 5px 5px 5px 0px #000000;
}

.userUpdate input[type=text] {
	margin-bottom: 20px;
	padding: 10px;
	width: 400px;
	height: 15px;
	font-size: 15px;	
	font-weight: 800;
	color: white;
}

.userUpdate input#select[type=text] {
	margin-bottom: 20px;
	padding: 10px;
	width: 400px;
	height: 15px;
	font-size: 15px;
	font-weight: 800;
	background-color: #D5D5D5;
}
</style>
<script type="text/javascript">
	function checkAnswer() {
		var answer = document.getElementById("answer").value;
		if (answer != '${searchId.getAnswer()}') {
			document.getElementById("answer").value = "";
			document.getElementById("answer").focus();
			alert('입력하신 질문의 결과값이 다릅니다.')
		}
	}

	function checkPwd() {
		var checkPwd = document.getElementById("pwd").value;
		var checkPwdcheck = document.getElementById("pwdcheck").value;
		if (checkPwd != checkPwdcheck) {
			document.getElementById("pwdcheck").value = "";
			document.getElementById("pwdcheck").focus();
			document.getElementById("check").innerHTML = '불일치';

		}
	}
	function submitOk() {
		if (document.getElementById("answer").value == "") {
			alert('질문에 대한 답을 입력하여 주세요')
		} else if (document.getElementById("pwd").value == "") {
			alert('새로운 비밀번호를 입력하여 주세요')
		} else if (document.getElementById("pwdcheck").value == "") {
			alert('비밀번호 확인하여주세요')
		} else {
			fo.submit();
		}

	}
</script>
</head>
<body>
	<div class="userUpdateBack"></div>
	<c:import url="/header"></c:import>
	<section class="userUpdateTable">
	<form id="fo" action="userUpdate" method="post">
		<c:if test="${searchId.getId()==null }">
			<script>
				alert('해당하는 정보가 없습니다.');
				location.href = "userReset";
			</script>
		</c:if>
		<header class="userUpdateHeader">
			<h2>아이디 찾기 ㆍ 비밀번호 재설정</h2>
		</header>
		<div class="userUpdate">
			<!-- 아무것도 입력 안하고 다음 클릭 시 필수항목으로 작성해야함 로직 만들어야함  -->
				아이디<br> 
			<input type="text" name="id" id="select"
				value="${searchId.getId() } " readonly><br> 
				전화번호<br>
			<input type="text" name="tel" id="select"
				value="${searchId.getTel() }" readonly><br> 
				질문<br>
			<input type="text" name="question" id="select"
				value="${searchId.getQuestion()}" readonly><br> 
				답변<br>
			<input type="text" id="answer" name="answer"
				placeholder="질문에 대한 답을 입력하세요" onchange="checkAnswer()"><br>

			새로운 비밀번호<br> <input type="text" id="pwd" name="pwd"
				placeholder="새로운 비밀번호를 입력하세요"><br> 비밀번호 확인<br> <input
				type="text" id="pwdcheck" name="pwdcheck" placeholder="비밀번호 확인"
				onchange="checkPwd()"><br> <label id="check"></label><br>
			<!-- 경로 설정해주기  로직 만들어야함 -->
			<button type="button" onclick="submitOk()">수정</button>
			<br>
			<div style="margin: 20px; position: relative; line-height: inherit; text-align: right;">
				<a href="loginPage" style="color: black; font-size: 18px;  vertical-align: inherit; "  >로그인 </a><font
					color="gray"  >으로돌아가기</font>
			</div>
		</div>
		</section>
	</form>
	<c:import url="/footer"></c:import>
</body>
</html>
