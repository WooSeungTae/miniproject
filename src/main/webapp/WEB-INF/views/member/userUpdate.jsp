<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디/비밀번호 찾기</title>
<style type="text/css">

/* 배경 뿌옇게 하기 */
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
/* <!-- 회원 정보 입력 틀(전체) 흰색배경 --> */
.userUpdateTable{
	position: relative;
	z-index: 100;
	background-color: white;
	width: 445px;
	height : 750px;
	margin: 30px auto;
	opacity: 1;
	
}
/* 회원 수정 칸 */
.userUpdate {
	width: 450px;
	margin: auto;
	height: 100%;
	padding: 10px;
	font-size: 18px;
	font-weight: 800;
}
/* 해더 제목 */
.userUpdateHeader {
	margin: 10px;
	padding: 10px;
	text-align: center;
}

/* 수정 클릭 버튼*/
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
/*수정 클릭버튼 hover*/
.userUpdate button:hover {
	background-color: #333333;
	color: white;
	font-weight: 700;
	box-shadow: 5px 5px 5px 0px #000000;
}
/* 회원 내용 입력란 input text*/
.userUpdate input[type=text] {
	margin-bottom: 20px;
	padding: 10px;
	width: 400px;
	height: 15px;
	font-size: 15px;	
	font-weight: 800;
	color: black;
}
/* 바꿀수 없는 회원정보 내역*/
.userUpdate input#select[type=text] {
	margin-bottom: 20px;
	padding: 10px;
	width: 400px;
	height: 15px;
	font-size: 15px;
	font-weight: 800;
	color: white;
	background-color: #D5D5D5;
}
</style>
<script type="text/javascript">
<!-- 질문 입력 확인  -->
	function checkAnswer() {
		var answer = document.getElementById("answer").value;
		if (answer != '${searchId.getAnswer()}') {
			alert(answer+ '값은 입력하신 질문의 답변과 다릅니다.')
			document.getElementById("answer").value = "";
			document.getElementById("answer").focus();
		}
	}
<!-- 비밀번호 수정 확인 란 불일치 - 일치 -->
	function checkPwd() {
		var checkPwd = document.getElementById("pwd").value;
		var checkPwdcheck = document.getElementById("pwdcheck").value;
		if (checkPwd != checkPwdcheck) {
			document.getElementById("pwdcheck").value = "";
			document.getElementById("pwdcheck").focus();
			document.getElementById("check").innerHTML = '불일치';

		}else{
			document.getElementById("check").innerHTML = '확인!!';
		}
	}
	
	<!-- 수정시 빈칸확인  -->
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
	<!-- 뒤에 배경 (회색 공간) -->
	<div class="userUpdateBack"></div>
	<c:import url="/header"></c:import>
	<!-- 회원 정보 입력 틀(전체) 흰색배경 -->
	
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
		
		<!--  회원 수정 칸 -->
		<div class="userUpdate">
			
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
		
			<button type="button" onclick="submitOk()">수정</button><br>
			
			<!--  아래 로그인으로 돌아가기 공간 -->
			<div style="margin: 20px; position: relative; line-height: inherit; text-align: right;">
				<a href="loginPage" style="color: black; font-size: 18px;  vertical-align: inherit; "  >로그인 </a><font
					color="gray"  >으로돌아가기</font>
			</div>
		</div>
		</form>
		</section>
	<c:import url="/footer"></c:import>
</body>
</html>
