	<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">

/*주문내역 사진*/
#quickImg{
	width: 180px;
	vertical-align: top;
	position: relative;
	top:0px;
}
/*주문내역 스타일*/
.rightSide td {
	
	position: relative;
	text-align: left;
	margin-left: 50px;
	font-size: 15px;
}

.rightSide{
	float: right; 
	width: 450px; 
	height: 800px; 
	margin-top: -30px;
	border-width : medium;
	border-color: #F5F5F5;
}

/*주문상세내역 공간*/
.priceCheck div{
	padding-top: 10px;
	
}

/*input 스타일*/
.addr input[type=text] {
	margin-bottom: 20px;
	padding: 10px;
	width: 350px;
	height: 13px;
	font-size: 15px;	
	font-weight: 800;
	color: black;
}
/*배송입력란*/
.addr{
	
}

/*배송선택 스타일*/
.orderMemo {
    width: 250px; /* 원하는 너비설정 */
    padding: .55em .4em; /* 여백으로 높이 설정 */
    font-family: inherit;  /* 폰트 상속 */
    border: 1px solid #999;
    border-radius: 1px; /* iOS 둥근모서리 제거 */
    -moz-appearance: none;
    appearance: none;
    margin-bottom: 5px;
	font-weight: bold;
	font-size: 15px;
}
/*배송메모 직접 입력란*/
#orderMemo{
	width: 780px;
	height: 15px;
}
/*배송방식 선택*/
.dlM p{
	font-size: 13px;
}

/*결제 구매 버튼*/
.buy{
	background-color: black; 
	color: white; 
	font-size:20px;
	font-weight: bold;
	text-align: center; 
	padding: 15px;

}

</style>

<script>

	/*은행 선택*/
	function changeBank(bankName){
		if(bankName=="농협"){
			document.getElementById("bankNum").innerHTML="예금주 : (주)나이키<br>계좌번호 : 8795-5114-7814";
		}
		if(bankName=="우리은행"){
			document.getElementById("bankNum").innerHTML="예금주 : (주)나이키<br>계좌번호 : 1002-7815-789515";
		}
		if(bankName=="기업은행"){
			document.getElementById("bankNum").innerHTML="예금주 : (주)나이키<br>계좌번호 : 010-4567-8879";
		}
			
	}
	
	/*배송배시지 선택*/
	function changOrderMemo(memo){
		var select = document.getElementById("memoDiv");
		if(memo=="직접 입력"){
			select.style.visibility='visible';
			document.getElementById("orderMemo").value="";
		}else{
			select.style.visibility='hidden';
		}
		
		if(memo=="배송시 연락 부탁드립니다."){
			document.getElementById("orderMemo").value="배송시 연락 부탁드립니다.";
		}
		if(memo=="빠른배송 부탁드립니다."){
			document.getElementById("orderMemo").value="빠른배송 부탁드립니다.";
		}
		if(memo=="배송메모 없음"){
			document.getElementById("orderMemo").value="별도의 요청 없음.";
		}
	}
	
	/*배송비 선택*/
	function changeDely(dely){
		var price = ${quickProduct.price };
		var no = 0;
		var yes=5000;
		var total=0;
		if(dely=="normal"){
			document.getElementById("dely").innerHTML=no+" 원";
			total=price*${count};
			document.getElementById("totalMoney").innerHTML=total.toLocaleString()+" 원";
			document.getElementById("buy").innerHTML=total.toLocaleString()+" 원 결제";
		}
		if(dely=="fast"){
			document.getElementById("dely").innerHTML=yes.toLocaleString()+" 원";
			total=(price*${count})+yes;
			document.getElementById("totalMoney").innerHTML=total.toLocaleString()+" 원";
			document.getElementById("buy").innerHTML=total.toLocaleString()+" 원 결제";
		}
	}
</script>


</head>
<body >
	<c:import url="/header"></c:import>
	<div style="width: 70%; margin: auto; padding-top: 80px;">
		<div class="" style="text-align: center;">
			<h1>주문결제</h1>
		</div>
	<form action="productBuy" method="get">
		<div class="" style="text-align: center;"><h3>${quickProduct.codename }</h3></div>
		<div class="" style="text-align: center;"><h3>${count } 개 </h3></div>
		<div>
			<!-- 우측 주문금액 내역  -->
			<aside class="rightSide" >
				<section style="padding: 20px;">
					<div style="background-color: #F5F5F5;">
						<h3>주문내역</h3>
					</div>
				<aside style="border: 1; border-color: #F5F5F5; padding: 10px; ">
						<div>
						<div style="float: left; padding-right: 20px;">
						<img id ="quickImg"src="/nike/${quickProduct.image1 }" onclick="location.href='/nike/productdetail?code=${quickProduct.code }'">
						</div>
							<table>
								<tr>
									<td><a style="text-decoration: none;" href="/nike/productdetail?code=${quickProduct.code }">${quickProduct.codename }</a></td>
								</tr>
								<tr>
									<td></td>
								</tr>
								<tr>
									<td>스타일 : ${quickProduct.code } </td>
								</tr>
								<tr>
									<td>사이즈 : ${ordersize }</td>
								</tr>
								<tr>
									<td>수량 : ${count }개</td>
								</tr>
								<tr>
									<td></td>
								</tr>
								<tr>
									<td style="color: red"><b><script type="text/javascript">
										var price = ${quickProduct.price }*${count};
										document.write(price.toLocaleString()+' 원');
									</script></b></td>
								</tr>
							</table>
							<hr>

						</div>
					<div class="priceCheck">
						<div>
						<div style="float: left; text-align: left;">상품금액</div>
						<div style="text-align: right;"><script type="text/javascript">
										var price = ${quickProduct.price };
										document.write(price.toLocaleString()+' 원');
									</script></div>
					</div>
					<div>
						<div style="float: left; text-align: left;">배송비</div>
						<div id = "dely" style="text-align: right;">0 원</div>
					</div>
					<div>
						<div style="float: left; text-align: left;">상품 할인 금액</div>
						<div style="text-align: right;">0 원</div>
					</div>
					<div>
						<div style="float: left; text-align: left;">주문 할인 금액</div>
						<div style="text-align: right;">0 원</div>
					</div>
					<div>
						<div style="float: left; text-align: left;">
							<b> 총 결제 예정 금액 </b>
						</div>
						<b><div id="totalMoney"style="text-align: right;">
										<script type="text/javascript">
										var price = ${quickProduct.price }*${count};
										document.write(price.toLocaleString()+' 원');
									</script></div></b>
									</div>
						<br><h5> ㆍ장기간 장바구니에 보관하신 상품은 시간이 지남에 따라 가격과 혜택이 변동 될 수 있으며, 최대
						30일동안 보관됩니다.</h5>
					</div>
					</aside>
				</section>
			</aside>
			<div>
				<!-- 왼쪽 정보 입력 공간 -->
				<section class="addr"
					style="display: flex; flex-direction: column; padding-top: 10px;">
				<div>

					<h3>주문고객</h3>
					<h5>고객명 : ${searchId.name}</h5>
					<h5 id="telH">전화번호 : <script>
					var num =  "${searchId.tel}";
					num = num.replace(/(\d{3})(\d{4})(\d{4})/, '$1-$2-$3');
					document.write(num);
					</script>
					</h5>
					<h5>고객ID : ${searchId.id}</h5>					
				<hr>
				</div>
				<div>
					<h3>배송지 정보</h3>
				</div>
					<!--  받으시는분 연락처 공간 -->
					<div >
						<div style="float: left; width: 50%;">
							받으시는분<br> <input type="text" value="${searchId.name}" placeholder="이름">
						</div>
						<div style="float: left; width: 50%;">
							연락처<br> <input type="text"  value="${searchId.tel}" placeholder="-없이 입력">
						</div>
					</div>
					<!-- 배송주소-->
					<div>
						배송주소<br>
						<div style="float: left; width: 80%;">
							<input type="text" placeholder="예)문래동 강서타워, 선유로82">
						</div>
						<div style="float: left; width: 20%;">검색</div>
						<div>
							<input style="width: 780px;" type="text" value="${searchId.address}" placeholder="나머지 주소 입력">
						</div>
					</div>
					<select class ="orderMemo" id = "orderMemo1" onchange="changOrderMemo(this.value)">
						<option value="배송메모 없음">배송메모를 선택해주세요</option>
						<option value="배송시 연락 부탁드립니다.">배송시 연락 부탁드립니다.</option>
						<option value="빠른배송 부탁드립니다.">빠른배송 부탁드립니다.</option>
						<option value="직접 입력">직접 입력</option>
					</select><div id="memoDiv" style="visibility: hidden;"><input type="text" id = "orderMemo" name = "orderMemo" placeholder="배송메모를 직접 입력하여 주십시오." ><br></div> 
					※ 배송 수령 시간은 임의로 지정하실 수 없습니다.<br> ※ 배송 메세지에 특수문자 "\ 사용이 불가합니다.<br>
					<br>
					<hr style="width: 100%;">
					<div class="dlM">
						<h3>배송방식 선택</h3>
						<br><h4> <input type="radio" name="delivery" value="normal" onclick="changeDely(this.value)" checked >일반배송 : 배송비
						무료<br></h4>
						<p>
							ㆍ 배송지역 : 전국(일부 도서산간 지역 제외)<br> ㆍ 배송기간 : 결제 후 3일 이내(토, 공휴일
							제외)<br>
							<br>
							<br><h4> <input type="radio" name="delivery" value="fast" onclick="changeDely(this.value)">오늘도착 : 서비스
							비용 5,000원 [나이키멤버 전용]<br></h4>
						<p>
							ㆍ 배송지역 : 서울ㆍ분당<br> ㆍ 이용시간 : 13시까지 결제 시, 당일 도착(공휴일 제외)<br>
							ㆍ 구매수량 : 1회 주문시, 최대 수량 2개<br> ㆍ 도착시간 : 저녁 6시 ~ 밤 10시 사이에 도착
							예정, 배송업체 상황에 따라 조금 지연될 수 있습니다.<br> 
							&nbsp;&nbsp;&nbsp; 오늘 밤에 받으실 배송지 주소를 한번더 확인해
							주세요.
					</div>
					<br>
					<hr style="width: 100%;">
					<!--  혜택 할인 -->
					<h3>마일리지 사용</h3>
					<div>
					<b>보유 마일리지 &nbsp;&nbsp;<input style="text-align: right;" type="text" value="${searchId.mile}"> 점</b><br>
					<b>사용 마일리지 &nbsp;&nbsp;<input style="text-align: right;" type="text" placeholder="사용할 마일리지를 적어주세요" onchange="changeDely(this.value)"> 점</b>
					</div>
					<hr style="width: 100%;">
					
					
					<!--  계좌선택 -->
					<div>
						
						<h3>입금자 성명</h3>				
						<input name = "name"type="text" placeholder="입금자 이름을 입력해주세요">
						<fieldset>
						<legend><h4>입금하실 은행을 선택하여 주세요.</h4></legend>
						<input type="radio" name = "bankName" value="농협" onclick="changeBank(this.value)"> 농협
						<input type="radio" name = "bankName" value="우리은행" onclick="changeBank(this.value)"> 우리은행
						<input type="radio" name = "bankName" value="기업은행" onclick="changeBank(this.value)"> 기업은행 <br>
						<br><b><div class="bankNum" id = "bankNum"></div></b>
						</fieldset>						 
					</div>
					<br>
					<br>
					<!--  결제 클릭 -->
					<div id="buy" class="buy">
						<script type="text/javascript">
										var price = ${quickProduct.price }*${count};
										document.write(price.toLocaleString()+' 원 결제');
									</script>
					</div>
					<br> <a href="cart">장바구니로 이동</a><br>

				</section>
			</div>
		</div>
		</form>
	</div>
	<c:import url="/footer"></c:import>
</body>
</html>