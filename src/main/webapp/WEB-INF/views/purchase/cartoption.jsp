<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<style>
		.button5 {
	 		background-color: white;
	  		color: black;
	  		padding: 16px 32px;
	  		text-align: center;
	  		text-decoration: none;
	  		display: inline-block;
	  		font-size: 16px;
	  		margin: 4px 2px;
	  		transition-duration: 0.4s;
	  		cursor: pointer;
	  		border: 2px solid #555555;
		}
	
		.button6{
	  		background-color: #555555;
	  		color: white;
	  		padding: 16px 32px;
	  		text-align: center;
	  		text-decoration: none;
	  		display: inline-block;
	  		font-size: 16px;
	  		margin: 4px 2px;
	  		transition-duration: 0.4s;
	  		cursor: pointer;
	  		border: 2px solid #555555;
		}
		
		.shoppingcart{
			background-color:#000;
			color:#fff;
			border:1px solid #000;
			width:350px;
			height:45px;
			border-radius:30px;
			margin-bottom:10px;
		}
	</style>
		<script type="text/javascript">
	
	   		function clickminus(){
	   			var count = document.getElementById("count")
	   			if(count.value<=0){
	   				alert('수량은 1개 이상부터 구입할 수 있습니다.')
	   			}else{
	   				count.value--;
	   			}
	   		}
	   		
	   		function clickplus(){
	   			var count = document.getElementById("count")
	   			if(count.value>=3){
	   				alert('수량은 3개 이상 구입할 수 없습니다.')
	   			}else{
	   				count.value++;
	   			}
	   		}
	   		</script>
	   		
	   		<script type="text/javascript">
		   		function sizebuttonclick(clicked_id){
		   			var radio = clicked_id*10;
		   			document.getElementById("230").className = "button5";
		   			document.getElementById("240").className = "button5";
		   			document.getElementById("250").className = "button5";
		   			document.getElementById("260").className = "button5";
		   			document.getElementById("270").className = "button5";
		   			document.getElementById("280").className = "button5";
		   			document.getElementById("290").className = "button5";
		   			document.getElementById("300").className = "button5";
		   			document.getElementById("310").className = "button5";
		   			document.getElementById("320").className = "button5";
		   			document.getElementById("330").className = "button5";
		   			if(document.getElementById(clicked_id).className == "button5"){
		   				document.getElementById(clicked_id).className = "button6";
		   				document.getElementById(radio).checked = true;
		   			}else if(document.getElementById(clicked_id).className == "button6"){
		   				document.getElementById(clicked_id).className = "button5";
		   			}
		   		
		   		}
		   		
		   		window.onload = function(){
		   			document.getElementById('gocart').onclick = function(){
		   				document.getElementById('cartoptionchange').submit();
		   				self.close();
		   			}
		   		}
	   		
	</script>
</head>
<body>
	<div align="center">
		<h2>장바구니 옵션 변경</h2>
		<form action="cartoptionchange" method="get" id="cartoptionchange">
			<div class="option-wrap">
				<div class="size-grid-type padding radius">
				<input type="hidden" name="code" value="${code }">
					<strong class="tit">사이즈 선택</strong>
					<div style="margin-bottom:10px;"></div>
					<div class="product-option_radio square">
						<div class="opt-list">
							<c:forEach var="ordersize" begin="230" end="330" step="10">
								<input type="button" class="button5" name="ordersize" value="${ordersize}" id="${ordersize}" onclick="sizebuttonclick(this.id)">
								<input type="radio" id="${ordersize*10 }" name="ordersize" value="${ordersize }" hidden="" >
								<c:if test="${ordersize%260 eq 0 || ordersize%300 eq 0}">
									<br>
								</c:if>
							</c:forEach>
						</div>
					</div>
				</div>
				<div class="stocked-wrap line" id="set-restock-alarm" style="display:block">
					<div class="quantity" style="margin-bottom:15px;">
						<h4 class="tit"><span>수량</span></h4>
						<span class="btn-qy">
							<input id="count" name="count" class="label" type="text" value="1">
							<button type="button" class="btn-minus" style="width:20px; border:1px solid #EAEAEA; background-color:#EAEAEA; font-size:15px;" onclick="clickminus()">-</button>
							<button type="button" class="btn-plus" style="width:20px; border:1px solid #EAEAEA; background-color:#EAEAEA; font-size:15px;" onclick="clickplus()">+</button>
						</span>
					</div>
				</div>
				<div>
					<input type="button" class="shoppingcart" value="장바구니로 이동" id="gocart">
				</div>
			</div>
		</form>
	</div>
</body>
</html>