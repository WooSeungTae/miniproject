<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body style="width: 73%; margin: auto; padding-top: 80px;">
<div class="" style="text-align: center;"><h2>장바구니</h2></div>
<div class="" style="text-align: center;">n개 상품</div>
<div>
<!-- 우측 주문금액 내역  -->
<aside class="" style="float: right; width: 300px; height:800px; margin-top: -30px; ">
<section style="padding: 20px;">
<div style="background-color:#F5F5F5; margin-top: -10px; "><h3>주문내역</h3>
</div>
<div>
 <hr>
 구매내용 사진, 수량, 금액 공간
 <hr>
</div>
<div>
 <div style="float: left; text-align: left;" > 상품금액 </div>
 <div style="text-align: right;"> 원</div>
</div>
<div>
 <div style="float: left; text-align: left;" > 배송비 </div>
 <div style="text-align: right;"> 원</div>
</div>
<div>
 <div style="float: left; text-align: left;" > 상품 할인 금액 </div>
 <div style="text-align: right;"> 원</div>
</div>
<div>
 <div style="float: left; text-align: left;" > 주문 할인 금액 </div>
 <div style="text-align: right;"> 원</div>
</div>
<div>
 <div style="float: left; text-align: left;" ><b> 총 결제 예정 금액 </b></div>
 <div style="text-align: right;"> 원</div><br>
 ㆍ장기간 장바구니에 보관하신 상품은 시간이 지남에 따라 가격과 혜택이 변동 될 수 있으며, 최대 30일동안 보관됩니다.
</div>
</section>
</aside>
<div>
<!-- 왼쪽 정보 입력 공간 -->
<hr>
<div><h3>주문고객</h3></div>
<hr>
<div><h3>배송지 정보</h3></div>
<section style="display: flex; flex-direction: column ; padding-top: 10px;">
	<!--  받으시는분 연락처 공간 -->
	<div>
		<div style="float: left; width: 50%;">
		받으시는분<br>
		<input type="text" placeholder="이름">
		</div>
		<div style="float: left; width: 50%;">
		연락처<br>
		<input type="text" placeholder="-없이 입력">
		</div>
	</div>
	<!-- 배송주소-->
	<div>
		배송주소<br>
		<div style="float: left; width: 80%;">
		<input type="text" placeholder="예)문래동 강서타워, 선유로82">
		</div>
		<div style="float: left; width: 20%;">검색</div>
		<div><input type="text" placeholder="나머지 주소 입력"></div>
	</div>
	<select name = "배송시 문의사항">
		<option value="">배송시 연락 부탁드립니다.</option>
		<option value="">빠른배송 부탁드립니다.</option>
		<option value="">직접 입력</option>
	</select>
	<input type="text" placeholder="배송메모를 직접 입력하여 주십시오."><br>
	※ 배송 수령 시간은 임의로 지정하실 수 없습니다.<br>
	※ 배송 메세지에 특수문자 "\ 사용이 불가합니다.<br><br>
	<hr style="width: 100%;">
	<div>
	<h3>배송방식 선택</h3><br>
	<input type="radio" name="delivery">일반배송 : 배송비 무료<br>
	<p> ㆍ 배송지역 : 전국(일부 도서산간 지역 제외)<br>
	ㆍ 배송기간 : 결제 후 3일 이내(토, 공휴일 제외)<br><br><br>
	<input type="radio" name="delivery">오늘도착 : 서비스 비용 5,000원 [나이키멤버 전용]<br>
	<p> ㆍ 배송지역 : 서울ㆍ분당<br>
	ㆍ 이용시간 : 13시까지 결제 시, 당일 도착(공휴일 제외)<br>
	ㆍ 구매수량 : 1회 주문시, 최대 수량 2개<br>
	ㆍ 도착시간 : 저녁 6시 ~ 밤 10시 사이에  도착 예정, 배송업체 상황에 따라 조금 지연될 수 있습니다.<br>
	    오늘 밤에 받으실 배송지 주소를 한번더 확인해 주세요.	
	</div><br>
	<hr style="width: 100%;">
	<!--  혜택 할인 -->
	<div><h3>혜택/할인사용</h3>
	<h4>사용 가능한 프로모 코드를 확인하시고 아래 프로모코드 란에 입력하여 사용하세요.</h4>
		<div style="float: left; width: 30%;">프로모코드</div>
		<div style="float: left; width: 60%;"><input type="text" placeholder="프로모 코드 입력" ></div>
		<div style="float: left; width: 10%; text-align: center;">적용</div>
	</div><br><br>
	<!--  결제 클릭 -->
	<div style="background-color: black; color: white; text-align: center;"><b> 원</b></div><br>
	<a href="cart">장바구니로 이동</a><br>

</section>
</div>
</div>
</body>
</html>