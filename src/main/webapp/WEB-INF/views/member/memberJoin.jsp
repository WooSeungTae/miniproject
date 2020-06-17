<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<style type="text/css">
	.wrapper{min-height: 100%; max-width: 100%; margin: 20px; text-align: center; margin-top: 150px; }
	.section{display: block;}
	.contentBox{box-sizing: content-box; padding: 10px;}
	input{height: 20px; margin: 10px; padding: 7px;}
	.button_01{margin-bottom: 10px !important; box-sizing: border-box;}
	button{color:white; background-color: black; width: 270px; height: 40px; padding: 10px;}
	td{max-width: 100px;} 
/*주소검색 css*/
	#checkOutButton {
  background-color: #e9e9e9; /* Green */
  border: none;
  color: black;
  padding: 8px 10px;
  text-align: center;
  text-decoration: none;
  font-size: 16px;
  font-weight : 900;
  border-radius: 8px;
  box-shadow: 5px, 5px,5px,0px;
}
</style>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script type="text/javascript">
	//필수 정보 입력되었는지  확인하는 함수 
	function checkValue() {
		if(!document.memberInfo.id.value){
			alert("아이디를 입력하세요.");	//memberinfo table에서 id칼럼이 primary key라서 창이 안뜸 해결방법 찾아야함
			document.memberInfo.id.focus();
			return false;
		} else if(!document.memberInfo.pwd.value){
			alert("비밀번호를 입력하세요.")
			document.memberInfo.pwd.focus();
			return false;
		} else if(document.memberInfo.chkpwd.value != document.memberInfo.pwd.value){
			alert("입력한 비밀번호와 다릅니다. 다시 입력해 주세요.")
			document.memberInfo.chkpwd.value="";
			document.memberInfo.chkpwd.focus();
			return false;
		} else if(!document.memberInfo.name.value){
			alert("이름을 입력하세요.")
			document.memberInfo.name.focus();
			return false;
		} else if(!document.memberInfo.address.value){
			alert("주소를 입력하세요.")
			document.memberInfo.address.focus();
			return false;
		} else if(!document.memberInfo.tel.value){
			alert("휴대폰 번호를 입력하세요.")
			document.memberInfo.tel.focus();
			return false;
		} else if(!document.memberInfo.birth.value){
			alert("생년월일을  입력하세요.")
			document.memberInfo.birth.focus();
			return false;
		} else if(!document.memberInfo.question.value){
			alert("질문을 선택해 주세요.")
			document.memberInfo.question.focus();
			return false;
		} else if(!document.memberInfo.answer.value){
			alert("질문의 답변을 입력해 주세요.")
			document.memberInfo.answer.focus();
			return false;
		} else if(!document.memberInfo.gender.value){
			alert("성별을  체크하세요.")
			document.memberInfo.gender.focus();
			return false;
		} else if(!document.memberInfo.agree.checked){
			alert("이용약관에 동의해 주세요.")
			document.memberInfo.agree.focus();
			return false;
		} else if(!document.memberInfo.chkPrivacy.checked){
			alert("개인정보 수집 및 이용에 동의해 주세요.")
			document.memberInfo.chkPrivacy.focus();
			return false;
		}
		alert("회원가입을 축하드립니다.");
	}
	
	/*주소검색*/
	function addrsearch(){
	   new daum.Postcode({
	       oncomplete: function(data) {
	    	   document.getElementById("addr").value=data.jibunAddress;
	    	   console.log(data.jibunAddress);
	    /*
               alert(data.userSelectedType) // (J : 지번 , R : 도로명)
               alert(data.jibunAddress)     // (지번 풀주소 반환)
              alert(data.sido);            // 시반환(서울특별시)
              alert(data.sigungu);         // 구반환(은평구) 
              alert(data.bname);           // 동반환(갈현동)
              alert(data.postcode);        // 우편번호 반환(6자리)
              alert(data.zonecode);        // 우편번호 반환(5자리)
              */
	       },
	       //shorthand : false 
	   }).open();
	}
</script>
</head>
<body>
<c:import url="/header"></c:import>
	<form action="saveUserInfo" name="memberInfo" onsubmit="return checkValue()"> 
		<section class="wrapper">
			<h3>회원가입</h3>
			<!-- 카카오 계정 , 페이스북 계정으로 로그인 하기 API 추가 해야함 -->
			<span><hr style="width:180px; display:inline-block;"></span>
			<span> OR </span>
			<span><hr style="width:180px; display:inline-block;"></span><br><br>
			<input type="text" name="id" placeholder="사용하실 ID를 입력해주세요.(수신 가능 E-mail)" size="50"><br>
			<input type="password" name="pwd" placeholder="영문+숫자+특수문자 8~16자리(특수문자 괄호()는 사용불가)" size="50"><br>
			<input type="password" name="chkpwd" placeholder="패스워드를 다시 입력해 주세요." size="50"><br>
			<input type="text" name="name" placeholder="이름을  입력해 주세요." size="50"><br>
			<input type="text" name="address" placeholder="주소검색" size="38"> <span id="checkOutButton" onclick='addrsearch()'>주소검색</span><br>
			<input type="text" id="addr" name="address" placeholder="나머지주소입력" size="50"><br>
			<input type="text" name="tel" placeholder="휴대폰 번호 '-'표 없이  입력해 주세요." size="50"><br>
			<input type="text" name="birth" placeholder="생년월일 예)2020.01.01" size="50"><br>
			<select name="question" style="width: 380px; height: 38px;">
				<option selected="selected" value="">질문을 선택하세요.</option>
				<option value="당신의 보물 제1호는?">당신의 보물 제1호는?</option>
				<option value="당신의 첫사랑의 이름은?">당신의 첫사랑의 이름은?</option>
				<option value="좋아하는 색상은?">좋아하는 색상은?</option>
				<option value="존경하는 위인은?">존경하는 위인은?</option>
				<option value="당신의 통장 비밀번호는?">당신의 통장 비밀번호는?</option>
			</select><br>
			<input type="text" name="answer" placeholder="선택하신 질문의 답변을 입력해 주세요." size="50"><br>
			<input type="radio" class="button_01" name="gender" value="남자" >남성	<!-- 버튼 이미지 변경 및 박스 만들어줘야함 -->
			<input type="radio" class="button_01" name="gender" value="여자">여성 <br>
			<div>
				<font size="2" style="padding: 0 270px 0 0;"><b>이용약관</b></font><br>
				<textarea rows="10" cols="62" style="font-size: 12px;" >나이키 이용약관 (추후 업뎃)
				</textarea>	<br>
			</div>
			<input type="checkbox" name="agree" value="agree">[필수] 약관에 동의 합니다.<br>
			<div>			
				<table style=" text-align: center; margin:auto; font-size:10; width: 330px; font-size: 11px;" border="1">
					<tr><td>일시</td><td>수집항목</td><td>수집목적</td><th>보유기간</th></tr>
					<tr><td>가입시</td><td>아이디,이메일,비밀번호,이름,휴대폰 번호,성별,생년월일</td><td>회원식별 및 연락</td><th>회원탈퇴시까지</th></tr>
					<tr><td>최초 구매시</td><td>성별,생년월일,휴대폰 번호,DI</td><td>본인확인</td><th>회원탈퇴시까지</th></tr>
					<tr><td>상품 주문시</td><td>수령인 정보(이름, 연락처, 주소),결제수단 정보</td><td>상품 주문 및 배송 등 구매계약의 이행</td><th>전자상거래법 등 관련 법령에 따른 보관기관</th></tr>
				</table>
			</div>
			<div>
				<input type="checkbox" name="chkPrivacy" value="privacy">[필수] 개인정보 수집.이용동의  
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
				<input type="submit" value="회원가입하기 (만14세 이상)" style=" padding:10px; width: 370px; height:50px; background-color: black; color: white;"><br>
			</div>
		</section>
	</form>
	<c:import url="/footer"></c:import>
</body>
</html>