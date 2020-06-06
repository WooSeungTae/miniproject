<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>나이키</title>
  <script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
  <script> 
	$(function(){ 
		$("#alert-ok").hide(); 
		$("#alert-no").hide(); 
		$("input").keyup(function(){ 
			var newPwd=$("#newPwd").val(); 
			var newPwdChk=$("#newPwdChk").val(); 
			if(newPwd != "" || newPwdChk != ""){ 
				if(newPwd == newPwdChk){ 
					$("#alert-ok").show(); 
					$("#alert-no").hide(); 
					$("#submit").removeAttr("disabled"); 
				}else{ 
					$("#alert-ok").hide(); 
					$("#alert-no").show(); 
					$("#submit").attr("disabled", "disabled"); 
				} 
			} 
		}); 
	}); 
</script>
<style>
	.pwd_modify_input{
	width: 400px;
	height: 35px;
	margin-top:10px;
	text-indent:10px;
	border: 1px solid #e8ebed;
	background-color: #eeeeee;
	border-radius: 1.5px;
	color: #a5a5ac;
	}
	.pwd_modify_new{
	width: 400px;
	height: 35px;
	margin-top:10px;
	font-size:13px;
	font-weight:bold;
	text-indent:10px;
	border: 1px solid #e8ebed;
	border-radius: 1.5px;
	}
	.pwd_modify_button{
	background-color: black;
	border-color: black;
	color: white;
	font-size: 16px;
	width: 400px;
	height: 45px;
	border-radius: 1.5px;
	}
	.pwd_modify_font{
	font-size: 11px;
	font-weight:bold;
    color: #5D5D5D;
	}
	::placeholder {
	color: #A6A6A6;
	}
	.pwd_spanNo{
	font-size: 11px;
	font-weight:bold;
    color: #FF4848;
    margin-top: 8px;
	}
	.pwd_spanOk{
	font-size: 11px;
	font-weight:bold;
    color: #5D5D5D;
    margin-top: 8px;
	}
	.pwd_gap{
	margin-bottom: -10px;
	}
</style>
</head>
<body>
<header><c:import url="/header"></c:import></header>
<div style="width: 70%; margin: auto; padding-top: 80px; padding-bottom: 150px;">
	<c:import url="/aside"></c:import>
		<h2>비밀번호 변경</h2>
		<form action="/nike/pwdSuccess">
			<div class="pwd_gap">
				<label class="pwd_modify_font">기존 비밀번호</label><br>
				<input type="text" id="pwd" name="pwd" value="${pwd }" 
					   readonly="readonly" class="pwd_modify_input"><br><br>
			</div>
			<div class="pwd_gap" data-component-textfield>
				<label class="pwd_modify_font">새 비밀번호</label><br>
			 	<input type="password" name="newPwd" placeholder="새 비밀번호 입력" 
				class="pwd_modify_new" required /><br><br>
			</div>
			<div class="pwd_gap" data-component-textfield>
				<label class="pwd_modify_font">새 비밀번호 확인</label><br>
				<input type="password" name="newPwdChk" placeholder="새 비밀번호 확인" 
				class="pwd_modify_new" required /><br>
				<div class="pwd_spanOk" id="alert-ok">비밀번호가 일치합니다.</div>
		 		<div class="pwd_spanNo" id="alert-no">입력값이 일치하지 않습니다.</div>
			</div><br><br>
			<input type="submit" value="변경하기" class="pwd_modify_button">
		</form>
</div>
<footer><c:import url="/footer"></c:import></footer>
</body>
</html>