	<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
/*현제 페이지 전체 hr*/
.chekcout hr{
	border:solid 0.5px #e8ebed;
}
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
.ordermemo {
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
#ordermemo{
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
	var price = ${totalmoney};
	var total=${totalmoney};
	var mile=0;
	var yes=5000;
	var checkDely=0;
	var checkRaddio=0;
	
	/*은행 선택*/
	function changeBank(bankname){
		if(bankname=="농협"){
			checkRaddio=1;
			document.getElementById("bankNum").innerHTML="예금주 : (주)나이키<br>계좌번호 : 8795-5114-7814";
			document.getElementById("totalprice").value=total;
		}
		if(bankname=="우리은행"){
			checkRaddio=1;
			document.getElementById("bankNum").innerHTML="예금주 : (주)나이키<br>계좌번호 : 1002-7815-789515";
			document.getElementById("totalprice").value=total;
		}
		if(bankname=="기업은행"){
			checkRaddio=1;
			document.getElementById("bankNum").innerHTML="예금주 : (주)나이키<br>계좌번호 : 010-4567-8879";
			document.getElementById("totalprice").value=total;
		}
			
	}
	
	/*배송배시지 선택*/
	function changordermemo(memo){
		var select = document.getElementById("memoDiv");
		if(memo=="직접 입력"){
			select.style.visibility='visible';
			document.getElementById("ordermemo").value="";
			document.getElementById("totalprice").value=total;
		}else{
			select.style.visibility='hidden';
		}
		
		if(memo=="배송시 연락 부탁드립니다."){
			document.getElementById("ordermemo").value="배송시연락부탁드립니다.";
			document.getElementById("totalprice").value=total;
		}
		if(memo=="빠른배송 부탁드립니다."){
			document.getElementById("ordermemo").value="빠른배송부탁드립니다.";
			document.getElementById("totalprice").value=total;
		}
		if(memo=="배송메모 없음"){
			document.getElementById("ordermemo").value="별도의요청없음.";
			document.getElementById("totalprice").value=total;
		}
	}
	
	/*배송비 선택*/
	function changeDely(dely){
		if(dely=="normal"){
			document.getElementById("dely").innerHTML="0 원";
			total=price-mile;
			checkDely=0;
			document.getElementById("totalMoney").innerHTML=total.toLocaleString()+" 원";
			document.getElementById("buy").innerHTML=total.toLocaleString()+" 원 결제";
			document.getElementById("totalprice").value=total;
		}
		if(dely=="fast"){
			document.getElementById("dely").innerHTML=yes.toLocaleString()+" 원";
			total=yes+price-mile;
			checkDely=1;
			document.getElementById("totalMoney").innerHTML=total.toLocaleString()+" 원";
			document.getElementById("buy").innerHTML=total.toLocaleString()+" 원 결제";
			document.getElementById("totalprice").value=total;
		}
	}

	function mileSet(){
		var s =parseInt('${searchId.mile}');
		var mile1 =  document.getElementById("mile").value;
		if("${sessionScope.id}"!=""){

		if(mile1>=s){
			mile1=s;
			mile=s;
			document.getElementById("mile").value=mile1;
			document.getElementById("mileMoney").innerHTML=mile.toLocaleString()+" 원";
			mile1 = 0;
		};
		if(checkDely==1){
			mile=mile1;
			total=yes+price-mile;
			document.getElementById("mileMoney").innerHTML=mile.toLocaleString()+" 원";
			document.getElementById("totalMoney").innerHTML=total.toLocaleString()+" 원";
			document.getElementById("buy").innerHTML=total.toLocaleString()+" 원 결제";
			document.getElementById("totalprice").value=total;
		}else{
			mile=mile1;
			total=price-mile;
			document.getElementById("mileMoney").innerHTML=mile.toLocaleString()+" 원";
			document.getElementById("totalMoney").innerHTML=total.toLocaleString()+" 원";
			document.getElementById("buy").innerHTML=total.toLocaleString()+" 원 결제";
			document.getElementById("totalprice").value=total;
		}
		
		}
			
	}

	/*빈칸 있을시 결제 불가*/
	function submitbuy(){
		if(document.getElementById("name").value==""){
			document.getElementById("name").focus();
			alert('이름을  입력하여 주세요.');
		}else if(document.getElementById("tel").value==""){
			document.getElementById("tel").focus();
			alert('전화번호를 선택 혹은 입력하여 주세요.');
		}else if(document.getElementById("addr").value==""){
			document.getElementById("addr").focus();
			alert('배송지를 입력하여 주세요.');
		}else if(document.getElementById("ordermemo").value==""){
			document.getElementById("ordermemo1").focus();
			alert('배송메모를 선택 혹은 입력하여 주세요.');
		}else if(document.getElementById("bankname").value==""){
			alert('입금자 성명을 입력하여 주세요');
			document.getElementById("bankname").focus();
		}else if(checkRaddio==0){
			alert('입금하실 은행은 선택하여 주세요');
		}else{
			fo.submit();			
		}
		
	}
	
	/*그림 불러오기 확장자 변환*/
	function chageSrc(obj) {
		var imgId = obj.id;
		var imgName = obj.src;
		imgName = imgName.toLowerCase();
		var firstName = imgName.substring(0, imgName.indexOf('.') + 1);
		var lastName = imgName.substring(imgName.indexOf('.') + 1);
		lastName = lastName.toUpperCase();
		var changeName = firstName + lastName;
		document.getElementById(imgId).src = changeName;
		console.log(changeName);
	}
</script>


</head>
<body >
	<c:import url="/header"></c:import>
	<div class="chekcout" style="width: 70%; margin: auto; padding-top: 80px;">
		<div class="" style="text-align: center;">
			<h1>주문결제</h1>
		</div>
	<form id ="fo" action="productBuy0" method="get">
		<div class="" style="text-align: center;"><h3>${cartlist.size() } 개 </h3></div>
		<div>
			<!-- 우측 주문금액 내역  -->
			<aside class="rightSide" >
				<section style="padding: 20px;">
					<div style="background-color: #F5F5F5; height: 45px;">
						<h3 style="padding: 10px; text-align: center;">주문내역</h3>
					</div>
				<aside style="border: 3px solid;  border-color: #F5F5F5; padding: 10px; ">
						<c:forEach var ="cartList" items="${cartlist }">
						<div>
						<div style="float: left; padding-right: 20px;">
						<img id ="quickImg" src="/nike/${cartList.image1 }" onerror="this.onerror=null; chageSrc(this)" onclick="location.href='/nike/productdetail?code=${cartList.code }'">
						</div>
							<table>
								<tr>
									<td><a style="text-decoration: none;" href="/nike/productdetail?code=${cartList.code }">${cartList.codename }</a></td>
								</tr>
								<tr>
									<td></td>
								</tr>
								<tr>
									<td>스타일 : ${cartList.code } </td>
								</tr>
								<tr>
									<td>사이즈 : ${cartList.ordersize }</td>
								</tr>
								<tr>
									<td>수량 : ${cartList.count }개</td>
								</tr>
								<tr>
									<td></td>
								</tr>
								<tr>
									<td style="color: red"><b><script type="text/javascript">
										var price = ${cartList.price }*${count};
										document.write(price.toLocaleString()+' 원');
									</script></b></td>
								</tr>
							</table>
							<hr>

						</div>
						</c:forEach>
					<div class="priceCheck">
						<div>
						<div style="float: left; text-align: left;">상품금액</div>
						<div style="text-align: right;"><script type="text/javascript">
										var price = ${totalmoney};
										document.write(price.toLocaleString()+' 원');
									</script></div>
					</div>
					<div>
						<div style="float: left; text-align: left;">배송비</div>
						<div id = "dely" style="text-align: right;">0 원</div>
					</div>
					<div>
						<div style="float: left; text-align: left;">상품 할인 금액</div>
						<div id="mileMoney" style="text-align: right;">0 원</div>
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
										var price = ${totalmoney};
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
				<c:choose>
					<c:when test="${sessionScope.id!=null}">
					<h5 >고객명 : ${searchId.name}</h5>
					<h5 id="telH" >전화번호 : <script>
					var num =  "${searchId.tel}";
					num = num.replace(/(\d{3})(\d{4})(\d{4})/, '$1-$2-$3');
					document.write(num);
					</script>
					</h5>
					<h5>고객ID : ${searchId.id}</h5>
					</c:when>
					<c:otherwise>
					
					<h5>비회원 고객님</h5>
					<h5>회원가입을 하시면 혜택이 많이 있습니다.</h5>
					</c:otherwise>					
				</c:choose>				
				<hr>
				</div>
				<div>
					<h3>배송지 정보</h3>
				</div>
					<!--  받으시는분 연락처 공간 -->
					<div class="delyinfo" >
						<div style="float: left; width: 50%;">
							받으시는분<br> <c:if test="${sessionScope.id!=null}"><input type="text" id = "name" name = "name" value="${searchId.name}" placeholder="이름"></c:if>
										<c:if test="${sessionScope.id==null}"><input type="text" id = "name"name = "name" value="" placeholder="이름을 입력하세요"></c:if>
						</div>
						<div style="float: left; width: 50%;">
							연락처<br> <c:if test="${sessionScope.id!=null}"><input type="text" id = "tel" name="tel" value="${searchId.tel}" placeholder="-없이 입력"></c:if>
									 <c:if test="${sessionScope.id==null}"><input type="text" id = "tel" name="tel" value="" placeholder="-없이 입력"></c:if>
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
							<c:if test="${sessionScope.id!=null}"><input style="width: 780px;" id = "addr" name="addr" type="text" value="${searchId.address}" placeholder="나머지 주소 입력"></c:if>
							<c:if test="${sessionScope.id==null}"><input style="width: 780px;" id = "addr" name="addr" type="text" value="" placeholder="나머지 주소 입력"></c:if>
						</div>
					</div>
					<select class ="ordermemo" id = "ordermemo1" onchange="changordermemo(this.value)">
						<option value="배송메모 없음" selected>배송메모를 선택해주세요</option>
						<option value="배송시 연락 부탁드립니다.">배송시 연락 부탁드립니다.</option>
						<option value="빠른배송 부탁드립니다.">빠른배송 부탁드립니다.</option>
						<option value="직접 입력">직접 입력</option>
					</select><div id="memoDiv" style="visibility: hidden;"><input type="text" id = "ordermemo" name = "ordermemo" placeholder="배송메모를 직접 입력하여 주십시오." ><br></div> 
					※ 배송 수령 시간은 임의로 지정하실 수 없습니다.<br> ※ 배송 메세지에 특수문자 "\ 사용이 불가합니다.<br>
					<br>
					<hr style="width: 100%;">
					<div class="dlM">
						<h3>배송방식 선택</h3>
						<br><h4> <input type="radio" name="ordertype" value="normal" onclick="changeDely(this.value)" checked >일반배송 : 배송비
						무료<br></h4>
						<p>
							ㆍ 배송지역 : 전국(일부 도서산간 지역 제외)<br> ㆍ 배송기간 : 결제 후 3일 이내(토, 공휴일
							제외)<br>
							<br>
							<br>
							<c:if test="${sessionScope.id!=null}">
							<h4><input type="radio" name="ordertype" value="fast" onclick="changeDely(this.value)">오늘도착 : 서비스
							비용 5,000원 [나이키멤버 전용]<br></h4>
						<p>
							ㆍ 배송지역 : 서울ㆍ분당<br> ㆍ 이용시간 : 13시까지 결제 시, 당일 도착(공휴일 제외)<br>
							ㆍ 구매수량 : 1회 주문시, 최대 수량 2개<br> ㆍ 도착시간 : 저녁 6시 ~ 밤 10시 사이에 도착
							예정, 배송업체 상황에 따라 조금 지연될 수 있습니다.<br> 
							&nbsp;&nbsp;&nbsp; 오늘 밤에 받으실 배송지 주소를 한번더 확인해
							주세요.
							</p></c:if>
							</div>
					<br>
					<hr style="width: 100%;">
					<!--  혜택 할인 -->
					<h3>마일리지 사용</h3>
					<div>
					<c:if test="${sessionScope.id!=null}"><b>보유 마일리지 &nbsp;&nbsp;<input style="text-align: right;" type="text" value="${searchId.mile}"> 점</b><br></c:if>
					<c:if test="${sessionScope.id==null}"><b>보유 마일리지 &nbsp;&nbsp;<input style="text-align: right;" type="text" value="회원전용"> 점</b><br></c:if>
					<c:if test="${sessionScope.id!=null}"><b>사용 마일리지 &nbsp;&nbsp;<input id="mile" name="mile" style="text-align: right;" type="text" placeholder="사용할 마일리지를 적어주세요" value="0"> 점 </b> <input type="button" value="적용" onclick="mileSet()"></c:if>
					</div>
					<hr style="width: 100%;">
					
					
					<!--  계좌선택 -->
					<div>
						
						<h3>입금자 성명</h3>				
						<input name = "bankname" id="bankname"type="text" placeholder="입금자 이름을 입력해주세요">
						<fieldset>
						<legend><h4>입금하실 은행을 선택하여 주세요.</h4></legend>
						<input type="radio" id="bank" name = "bank" value="농협" onclick="changeBank(this.value)"> 농협
						<input type="radio" id="bank"  name = "bank" value="우리은행" onclick="changeBank(this.value)"> 우리은행
						<input type="radio" id="bank"  name = "bank" value="기업은행" onclick="changeBank(this.value)"> 기업은행 <br>
						<br><b><div class="bankNum" id = "bankNum"></div></b>
						</fieldset>						 
					</div>
					<br>
					<br>
					<!--  결제 클릭 -->
					<div onclick='submitbuy()' id="buy" class="buy" >
						<script type="text/javascript">
										var price = ${totalmoney};
										document.write(price.toLocaleString()+' 원 결제');
									</script>
					</div>
					<br> <a href="cart">장바구니로 이동</a><br>

				</section>
			</div>
		</div>
		<!--  히든 내용 -->
		
		<c:choose>
			<c:when test="${sessionScope.id!=null }">		
		<input type="hidden" name = "id" value="${sessionScope.id }">
		</c:when>
		<c:otherwise>
			<input type="hidden" name = "id" value="비회원">
		</c:otherwise>
		</c:choose>
		<c:forEach var = "cartlist" items="${cartlist }">
		<input type="hidden" name = "totalprice" id="totalprice" value="">
		<input type="hidden" name = "code" value="${cartlist.code }">
		<input type="hidden" name = "codename" value="${cartlist.codename }">
		<input type="hidden" name = "count" value="${cartlist.count }">
		<input type="hidden" name = "ordersize" value="${cartlist.ordersize }">
		<input type="hidden" name = "price" value="${cartlist.price }">
		<input type="hidden" name = "image1" value="${cartlist.image1 }">
		</c:forEach>
		
		</form>
	</div>
	<c:import url="/footer"></c:import>
</body>
</html>