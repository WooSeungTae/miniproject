<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<style type="text/css">
	.wrapper{min-height: 100%; max-width: 100%; margin: 20px; text-align: center; }
	.section{display: block;}
	.contentBox{box-sizing: content-box; padding: 10px;}
	input{height: 20px; margin: 10px; padding: 10px;}
	.button_01{margin-bottom: 10px !important; box-sizing: border-box;}
	button{color:white; background-color: black; width: 270px; height: 40px; padding: }
	td{max-width: 100px;} 
</style>
</head>
<body>
<header>

</header>
	<form action="" method="post">
		<section class="wrapper">
			<h3>회원가입</h3>
			<span><hr style="width:150px; display:inline-block;"></span>
			<span> OR </span>
			<span><hr style="width:150px; display:inline-block;"></span><br><br>
			<input type="text" name="id" placeholder="아이디를 입력해 주세요." size="40"><br>
			<input type="password" name="pwd" placeholder="패스워드를 입력해 주세요." size="40"><br>
			<input type="password" name="pwdChk" placeholder="패스워드를  다시 입력해 주세요." size="40"><br>
			<input type="text" name="name" placeholder="이름을  입력해 주세요." size="40"><br>
			<input type="text" name="phonenumber" placeholder="휴대폰 번호 '-'표 없이  입력해 주세요." size="40"><br>
			<input type="text" name="id" placeholder="생년월일 예)2020.01.01" size="40"><br>
			<input type="radio" class="button_01" name="gender" value="man">남성 
			<input type="radio" class="button_01" name="gender" value="woman">여성 <br>
			<div>
				<font size="2" style="padding: 0 270px 0 0;"><b>이용약관</b></font><br>
				<textarea rows="7" cols="52" style="font-size: 12px;" >나이키 이용약관 (추후 업뎃)
				</textarea>	<br>
			</div>
			<input type="checkbox" name="agree" value="agree">[필수] 약관에 동의 합니다.
			<div>			
				<table style=" text-align: center; margin:auto; font-size:10; width: 330px; font-size: 11px;" border="1">
					<tr><td>일시</td><td>수집항목</td><td>수집목적</td><th>보유기간</th></tr>
					<tr><td>가입시</td><td>아이디,이메일,비밀번호,이름,휴대폰 번호,성별,생년월일</td><td>회원식별 및 연락</td><th>회원탈퇴시까지</th></tr>
					<tr><td>최초 구매시</td><td>성별,생년월일,휴대폰 번호,DI</td><td>본인확인</td><th>회원탈퇴시까지</th></tr>
					<tr><td>상품 주문시</td><td>수령인 정보(이름, 연락처, 주소),결제수단 정보</td><td>상품 주문 및 배송 등 구매계약의 이행</td><th>전자상거래법 등 관련 법령에 따른 보관기관</th></tr>
				</table>
			</div>
			<div>
				<input type="checkbox" name="chkprivacy" value="agreeprivacy">[필수] 개인정보 수집.이용동의  
			</div>
			<div>
				<font size="1" >
					※ 약관 및 개인정보 처리방침은 홈페이지 하단에 전문이 게재되어 있습니다.<br>
					※ 이용약관 및 개인정보 수집.이용 내용에 대해 동의 거부가 가능하며,<br>
					이 경우 회원가입 및 관련 서비스는 이용이 불가합니다.
				</font>
			</div>
			<div>
				<input type="checkbox" name="chksns" value="agreeSns">(선택) 쇼핑정보 SMS수신 동의  
			</div>
	
			<div>
				<input type="checkbox" name="chkEmail" value="agreeeEmail">(선택) 쇼핑정보 E-mail 수신 동의  
			</div>		
			<div>
				<font size="1">※ 선택 항목으로 동의하지 않아도 불이익을 받지 않습니다.</font>
			</div><br>	
			<div>
				<font>만 14세  미만은 회원가입 및 서비스 이용이 불가합니다.</font>
			</div><br>
			<div style="margin: 10px; ">
				<button type="submit" style="width: 200px;">회원가입하기 (만14세 이상)</button>
				<button type="button" onclick="location='loginPage'" style="width: 200px;">취소</button>
			</div>
		</section>
	</form>
</body>
</html>