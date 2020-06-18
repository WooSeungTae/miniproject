<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<style>
		/* 페이지 설정 */
		.detail_div{
			width:70%;
			float:left;
		}
		.wrap{
			margin-left: 15%;
			margin-right: 10%;
			margin-top: 160px;
		}
		.pwd_gap{
			margin-bottom: -10px;
		}
		.pwd_modify_font{
			font-size: 11px;
			font-weight:bold;
		    color: #5D5D5D;
		}
		.pwd_modify_input{
			width: 400px;
			height: 35px;
			margin-top:10px;
			text-indent:10px;
			border: 1px solid #e8ebed;
			background-color: #eeeeee;
			border-radius: 2px;
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
			border-radius: 2px;
			color: #606060;
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
		.member_delete_font{
			font-size: 13px;
			font-weight: bold;
		}
		
		/*주소검색 css*/
	#checkOutButton {
  background-color: #e9e9e9; /* Green */
  border: none;
  color: black;
  padding: 8px 10px;
  text-align: center;
  text-decoration: none;
  font-size: 16px;
  font-weight : 300;
  border-radius: 8px;
  box-shadow: 5px, 5px,5px,0px;
}
	</style>
<meta charset="UTF-8">
<title>개인정보수정 - 나이키</title>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
/*주소검색*/
function addrsearch(){
   new daum.Postcode({
       oncomplete: function(data) {
    	   document.getElementById("address").value=data.jibunAddress;
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
<c:import url="/header"/>
<section>
	<div class="wrap">
		<c:import url="/aside"/>
			<div class="detail_div">
				<h2>회원정보 수정</h2>	
					<form action="memberinfoModify" method="post">
				<!-- 아이디, 이름 -->		
						<div class="pwd_gap">
							<label class="pwd_modify_font">아이디</label><br>
							<input class="pwd_modify_input" type="text" id="id" name="id" readonly="readonly" value="${dto.id }"><br><br>
						</div>
						<div class="pwd_gap">
							<label class="pwd_modify_font">이름</label><br>
							<input class="pwd_modify_input" type="text" id="name" name="name" readonly="readonly" value="${dto.name }"><br><br>
						</div>
				<!-- 수정할 부분 -->
						<div class="pwd_gap">					
							<label class="pwd_modify_font">주소</label><br>
								<input class="pwd_modify_new" type="text" placeholder="주소검색" style="width: 310px;"> <span id="checkOutButton" onclick='addrsearch()'>주소검색</span><br>
								<input class="pwd_modify_new" type="text" id="address" name="address" value="${dto.address }"><br><br>
						</div>
						<div class="pwd_gap">
							<label class="pwd_modify_font">휴대폰</label><br>
							<input class="pwd_modify_new" type="text" id="tel" name="tel" value="${dto.tel }"><br><br>
						</div>
				<!-- 체크박스 -->
						<div style="margin-top: 10px;">
							<span class="input-checkbox">
								<input type="checkbox" id="receiveEmail" name="receiveEmail" checked="checked">
								<span class="member_delete_font">이메일을 통한 상품 및 이벤트 정보 수신에 동의합니다.(선택)</span>
							</span>
						</div>
						<div style="margin-top: 10px; margin-bottom: 10px;">
							<span class="input-checkbox">
								<input type="checkbox" id="receiveEmail" name="receiveEmail" checked="checked">
								<span class="member_delete_font">휴대폰을 통한 상품 및 할인쿠폰 등의 정보 수신에 동의합니다.(선택)</span>
							</span>
						</div><br>
							<button type="submit" class="pwd_modify_button">수정하기</button>
					</form>
				</div>
			</div>
</section>
	<div style="float: left; width:100%;">
		<c:import url="/footer"/>
	</div>
</body>
</html>