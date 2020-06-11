<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<style>
		.wrapper{
			font-family:"Noto Sans KR", "Malgun Gothic", "MalgunGothic", Dotum, Helvetica, Arial, sans-serif;
			color:#111;
			padding-top:108px;
			min-height:100%;
			height:1800px;
		}
		
		.contents-area{
			height:80%;
		}
		.contents{
			box-sizing:border-box;
			height:100%;
			overflow:0 auto;
		}
		
		.contents.margin-small{
			margin-top:30px;
			height:70%;
		}
		
		.pt_product-detail{
			max-width:1440px;
			margin:68px auto 0 auto;
		}
		
		.img-detail_product_n{
			width:55%;
			display:inline-block;
			padding:0 30px;
			text-align:center;
			float:left;
			height:70%;
			margin-left:20px;
		}
		
		
	
		.img-detail-list{
			display:inline-block;
			width:95%;
			height:420px;
			overflow:0 hidden;
		}
		
		.image-list{
			display:inline;
			width:400px;
			height:400px;
			overflow:0 hidden;
			margin-bottom:10px;
		
		}
		.prd-gutter{
			background:#f5f5f5;
			width:400px;
			margin:5px;
			height:400px;
			overflow:0 hidden;
			margin-bottom:10px;
		}
		
		.product-image{
			width:100%;
			height:100%;
			margin:0 hidden;
			overflow:0 hidden;
		}
		
		.info-wrap_product_n{
			position:relative;
			float:right;
			width:40%;
			padding:0 54px 0 10px;
			color:#606060;
			box-sizing:border-box;
			text-align:left;
			
		}
	
	
		
		.info-wrap_product_n .price-wrap{
			display:inline-block;
			font-size:16px;
			letter-spacing:0.1px;
			color:#00000;
		
		}
		
		.product-option-container{
			position:relative;
			float:left;
	
		}
		
		.quantity{
			margin-bottom:10px;
		}
		
		.order-wrap{
			margin-bottom:10px;
		}
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
		
		.directorder{
			background-color:#000;
			color:white;
			width:350px;
			height:45px;
			border:0px;
			border-radius:30px;
			margin-bottom:10px;
		}
		
		.shoppingcart{
			background-color:#fff;
			color:#000;
			border:1px solid #000;
			width:350px;
			height:45px;
			border-radius:30px;
			margin-bottom:10px;
		}
	</style>
	<script type="text/javascript" src="js/jquery-3.4.1.min.js"></script>
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
	
	</script>
	<script type="text/javascript">
	
   		function chageSrc(obj){
  			var imgId = obj.id;
  			var imgName =obj.src;
   			imgName = imgName.toLowerCase();
   			var firstName = imgName.substring(0, imgName.indexOf('.') + 1);
   			var lastName = imgName.substring(imgName.indexOf('.') + 1);
   			lastName = lastName.toUpperCase();
   			var changeName = firstName + lastName;
   			document.getElementById(imgId).src = changeName;
   		}
   		
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
		function buttoncheck(){
			console.log("aaaaaaaaaaaaaaaaaaaaaaaaaaa");
			if(!document.fo.ordersize.value){
				alert("사이즈를 선택해주세요!!!");
				return false;
			}
			
		}
	</script>
	<script type="text/javascript">
		window.onload = function(){
			var noadd = document.getElementById("noadd")
			console.log(noadd);
			if(noadd.value==-1){
				alert("장바구니에 이미 동일한 아이템이 있습니다!");
			}
		}
	</script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<header>
		<c:import url="../sminj/header.jsp">
		</c:import>
	</header>
	<section class="wrapper">
		<section class="content-area" style="height:80%;">
			<section>
				<article>
					<article class="contents-area contents">				
						<input type="hidden" name="add" id="noadd" value="${noadd}">
						<div class="img-detail_product_n">
								<ul id="product-gallery" class="img-detail-list">
									<li class="image-list" style="float:left;">
										<div class="prd-gutter">
											<img id ="${pdto.image1 }" class="product-image" src="${pdto.image1 }" alt="등록된 사진이 없습니다." onerror="this.onerror=null; chageSrc(this)">
										</div>
									</li>
									<li class="image-list" style="float:right; margin-right:100px;">
										<div class="prd-gutter">
											<img id ="${pdto.image2 }" class="product-image" src="${pdto.image2 }" alt="등록된 사진이 없습니다." onerror="this.onerror=null; chageSrc(this)">										
										</div>
									</li>
								</ul>
								<ul class="img-detail-list">
									<li class="image-list" style="float:left;">
										<div class="prd-gutter">
											<img id ="${pdto.image3 }" class="product-image" src="${pdto.image3 }" alt="등록된 사진이 없습니다." onerror="this.onerror=null; chageSrc(this)">
										</div>
									</li>
									<li class="image-list" style="float:right; margin-right:100px;">
										<div class="prd-gutter">
											<img id ="${pdto.image4 }" class="product-image" src="${pdto.image4 }" alt="등록된 사진이 없습니다." onerror="this.onerror=null; chageSrc(this)">
										</div>
									</li>
								</ul>
								<ul class="img-detail-list">
									<li class="image-list" style="float:left;">
										<div class="prd-gutter">
											<img id ="${pdto.image5 }" class="product-image" src="${pdto.image5 }" alt="등록된 사진이 없습니다." onerror="this.onerror=null; chageSrc(this)">
										</div>
									</li>
									<li class="image-list" style="float:right; margin-right:100px;">
										<div class="prd-gutter">
											<img id ="${pdto.image6 }" class="product-image" src="${pdto.image6 }" alt="등록된 사진이 없습니다." onerror="this.onerror=null; chageSrc(this)">
										</div>
									</li>
								</ul>
							</div>
						<div class="info-wrap_product_n">
						<div class="product-option-container">
							<div class="uk-hidden-small uk-position-relative">
								<div class="price-wrap">
									<div class="uk-float-left" style="display:inline-block; float:left;">
										<div class="product-subtitle">
											<span class="text-color-secondary" style="font-size:15px; color:#111;">
												<c:if test="${pdto.category=='run' }">런닝</c:if>
												<c:if test="${pdto.category=='soccer' }">축구</c:if>
												<c:if test="${pdto.category=='basket' }">농구</c:if>
											</span>
										</div>
									</div>
									<div class="uk-float-right" style="display:inline-block; margin-left:300px;">
										<span class="price">
											<strong>
												<script type="text/javascript">
													var price = ${pdto.price};
													document.write(price.toLocaleString()+' 원');
												</script>
											</strong>
										</span>
									</div>
								</div>
								<h1 class="title-wrap">
									<span class="tit" style="font-size:30px; color:#000;">${pdto.codename }</span>
								</h1>
							</div>
							<div class="pinfo-item-box">
								<form name="fo" method="GET" onsubmit="return buttoncheck()">
									<input type="hidden" name="code" value="${pdto.code }">
									<div class="option-wrap">
										<div class="size-grid-type padding radius">
											<strong class="tit">사이즈 선택</strong>
											<div class="product-option_radio square">
												<div class="opt-list">
													<!-- input type="hidden" id="ordersize" class="ordersize" name="ordersize"-->
													<c:choose>
														<c:when test="${pdto.gender!='키즈' }">
															<c:forEach var="ordersize" begin="230" end="330" step="10">
																<input type="button" class="button5" name="ordersize" value="${ordersize}" id="${ordersize}" onclick="sizebuttonclick(this.id)">
																<input type="radio" id="${ordersize*10 }" name="ordersize" value="${ordersize }" hidden="" >
																<c:if test="${ordersize%270 eq 0 || ordersize%320 eq 0}">
																<br>
																</c:if>
															</c:forEach>
														</c:when>
														<c:otherwise>
															<c:forEach var="ordersize" begin="80" end="160" step="10">
																<input type="button" class="button5" name="ordersize" value="${ordersize}" id="${ordersize}" onclick="sizebuttonclick(this.id)">
																<input type="radio" id="${ordersize*10 }" name="ordersize" value="${ordersize }" hidden="" >
																<c:if test="${ordersize%120 eq 0}">
																<br>
																</c:if>
															</c:forEach>
														</c:otherwise>
													</c:choose>
												</div>
											</div>
											</div>
											<div class="stocked-wrap line" id="set-restock-alarm" style="display:block">
											</div>
											<div class="quantity" style="margin-bottom:15px;">
												<h2 class="tit">
													<span>수량</span>
													<span class="msg"></span>
												</h2>
												<span class="btn-qy">
													<input id="count" name="count" class="label" type="text" value="1">
													<button type="button" class="btn-minus" style="width:20px; border:1px solid #EAEAEA; background-color:#EAEAEA; font-size:15px;" onclick="clickminus()">-</button>
													<button type="button" class="btn-plus" style="width:20px; border:1px solid #EAEAEA; background-color:#EAEAEA; font-size:15px;" onclick="clickplus()">+</button>
												</span>
											</div>
										</div>
										<div class="btn-group-box line type2">
											<div>
												<div class="status-wrap btn-wrap radius">
													<div class="order-wrap">
														<input class="directorder" type="submit" value="바로구매" formaction="checkoutQuick">
														<input type="submit" class="shoppingcart" value="장바구니" formaction="cartSave">
													</div>
												</div>
											</div>
										</div>
									</form>
												</div>
												<div class="store-reserve-wrap radius">
													<span class="ns-store icon"></span>
													<span class="btn-storereserve">배송보다 빠른, 매장픽업 서비스</span>
													<div class="store-reserve-info">
														<span>지금 주문하고, 매장에서 바로 픽업하세요.</span>
													</div>
												</div>
												<div class="discription-wrap uk-accordian" data-uk-accordian="{collapse:true}">
													<div class="pop-detail-content">
														<div class="description conTab" id="pdp-description-summary" data-info-height="{outerHeight:456, infoType:product-detail}"></div>
														<div class="description-preview">
															<p>
																<b>${pdto.contents }</b>
															</p>
															<br>
														</div> 
														<span class="style-color">현재 컬러 : ${pdto.codecolor }<br></span>
														<span class="style-code">스타일 : ${pdto.code }<br></span>
													</div>
													<h2 class="pop-detail-title uk-accordian-title uk-active" data-click-toggle-on="off" data-click-area="pdp" data-click-name="review_learn more">
														리뷰
														<span class="review-num">(4)</span>
														<div class="review-wrap">
															<span class="like" style="display:none">
																<i class="icon-star 5 per" style="width:85.0%">☆☆☆☆☆</i>
															</span>
														</div>
													</h2>
												</div>
											</div>
										<h2 class="pop-detail-title uk-accordian-title" data-click-toggle-on="off" data-click-area="pdp" data-click-name="delivery_learn_more">
											배송
											<span class="sub-title-wrap">일반배송 / 오늘도착</span>
										</h2>
										<div data-wrapper="true" class="accordian-wrapper" aria-expanded="true" style="height:auto">
											<div class="pop-detail-content uk-accordian-content uk-active">
												<h3 class="detail-content-title uk-margin-top-remove">일반배송 안내</h3>
												<ul class="detail-content-list">
													<li>배송지역 : 전국(일부 지역 제외)</li>
													<li>배송비 : 상품의 구매금액에 상관없이 모든 상품 무료배송</li>
													<li>배송기간 : 결제 후 3일 이내 (토요일, 공휴일 제외)</li>
												</ul>
												<h3 class="detail-content-title">
													오늘도착 안내
													<span class="flag-sameday">나이키멤버 전용</span>
												</h3>
												<ul class="detail-content-list">
													<li>서비스 가능 시간 : 00시부터 13시까지 결제하시면 주문 당일 도착합니다.</li>
													<li>
														서비스 가능 제품 : 상품 상세 페이지의 <i class="icon-somday"></i>&nbsp;
														<span class="flag-someday">오늘도착</span>
														아이콘이 표기되는 제품
													</li>
													<li>
														서비스 이용 방법 : 결제화면 배송선택 옵션을 통해 "오늘도착" 배송을 이용하실 수 있습니다.
													</li>
													<li>
														오늘도착 가능 지역 : 제품 수령지가, 서울특별시 전에 혹은 경기도 성남시 분당구에 한함
													</li>
													<li>
														배송 가능 지역 : 서울．분당 지역에 한해 배송됩니다.
													</li>
													<li>
														서비스 비용 : 5,000원
													</li>
													<li>
														주문 가능 수량 : 1회 주문 시, 최대 상품 2개
													</li>													
												</ul>
											</div>
										</div>
										<h2 class="pop-detail-title uk-accordian-title uk-active" data-click-toggle-on="off" data-click-area="pdp" data-click-name="return_learn more">
											반품/AS
											<span class="sub-title-wrap">온라인 접수 / 매장 접수</span>
										</h2>
										<div data-wrapper="true" class="accordian-wrapper" aria-expended="true" style="height:auto";>
											<div class="pop-detail-content uk-accordian-content uk-active">
												<h3 class="detail-content-title uk-margin-top-remove">무료반품서비스</h3>
												<ul class="detail-content-list">
													<li>상품의 구매금액에 상관없이 무료반품서비스를 제공하고 있습니다.</li>
												</ul>
												<h3 class="detail-content-title">매장 반품 접수</h3>
												<ul>
													<li>
														나이키 닷컴에서 구매하신 제품은 가까운 나이키 매장에서 반품 접수가 가능합니다. (일부 매장 제외)
													</li>
													<li>
														대표 매장 : 강남점, 명동점, 타임스퀘어점, 코엑스점, 롯데월드 타워점
													</li>
													<li>
														반품점수 가능
														<a class="btn-more-pop" href="#">전체 ASSIST SERVICE 매장 확인하기</a>
													</li>
												</ul>
												<h3 class="detail-content-title">반품 안내</h3>
												<ul class="detail-content-list">
													<li>
														반품접수는 상품 수령 후 7일 이내에 상품 미훼손 및 미사용한 경우에만 해당됩니다.
													</li>
													<li>
														색상/사이즈 불만족, 고객 변심 반품의 경우, 오늘도착 서비스 (배송)비용에 대한 배송비는 환불되지 않음을 유의해 주시기 바랍니다.
													</li>
												</ul>
												<h3 class="detail-content-title">AS 안내</h3>
												<ul class="detail-content-list">
													<li>
														나이키닷컴에서 구매하신 제품에 대해 A/S 접수를 원하실 경우에는
														1:1 이메일 문의와 나이키닷컴 고객센터(TEL : 080-022-0182)를 이용해주세요.
													</li>
												</ul>
												<h3 class="detail-content-title">미성년자 권리보호 안내</h3>
												<ul class="detail-content-list">
													<li>
														미성년 고객께서 상품을 주문(계약) 하시는 경우, 법정대리인(부모님 등)의 동의가 없으면 미성년자 본인 또는 법정대리인(부모님 등)이 그 주문(계약)을 취소하실 수 있습니다.
													</li>
												</ul>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</article>
				</article>
			</section>
		</section>
	</section>
	<footer>
		<c:import url="../sminj/footer.jsp">
		</c:import>
	</footer>
</body>
</html>