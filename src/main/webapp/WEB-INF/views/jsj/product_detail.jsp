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
		.content-area{
			height:80%;
		}
		
		.content-area > contents{
			height:100%;
			overflow:0 auto;
		}
		.contents.margin-small{
			margin-top:30px;
			height:75%;
		}
		
		.pt_product-detail{
			max-width:1440px;
			margin:68px auto 0 auto;
		}
		
		.img-detail_product_n{
			width:60%;
			display:inline-block;
			padding:0 30px;
			text-align:center;
			float:left;a
			height:70%;
			margin-left:20px;
		}
		
		
	
		.img-detail-list{
			display:inline-block;
			width:97%;
			height:370px;
			overflow:0 hidden;
		}
		
		.image-list{
			display:inline;
			width:350px;
			height:350px;
			overflow:0 hidden;
			margin-bottom:10px;
		
		}
		.prd-gutter{
			background:#f5f5f5;
			width:350px;
			margin:5px;
			height:350px;
			overflow:0 hidden;
			margin-bottom:10px;
		}
		
		.info-wrap_product_n{
			float:right;
			width:40%;
			padding:0 54px 0 10px;
			color:#606060;
			box-sizing:border-box;
			text-align:left;
			height:1200px;
			border:1px solid #000;
			
			
		}
			
		.info-wrap_product_n .price-wrap{
			display:inline-block;
			font-size:16px;
			letter-spacing:0.1px;
			color:#00000;
		
		}
		
		.product-option-container{
			float:left;
			width:100%;
			height:90%;
		}
		
		.quantity{
			margin-bottom:10px;
		}
		
		.order-wrap{
			margin-bottom:10px;
		}
		
		.product-image{
			width:100%;
			height:100%;
			margin:0 hidden;
			overflow:0 hidden;
		}
		
		.price-wrap{
			width:90%;
		}
		
		.tit{
			display:block;
			margin-top:10px;
			font-size:25px;
			
		}
		.similar-item{
			display:inline-block;
		}
		
		.similar-items{
			height:80px;
		}
		
		.tit2{
			font-size:13x;
		}
	</style>
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
		<section class="content-area">
			<section>
				<article class="content-area contents">
						<div class="img-detail_product_n">
							<ul id="product-gallery" class="img-detail-list">
								<li class="image-list" style="float:left;">
									<div class="prd-gutter">
										<img id = "${pdto.image1 }" class="product-image" src="${pdto.image1 }" alt="등록된 사진이 없습니다." onerror="this.onerror=null; chageSrc(this)">
									</div>
								</li>
								<li class="image-list" style="float:right;">
									<div class="prd-gutter">
										<img id = "${pdto.image2 }" class="product-image" src="${pdto.image2 }"  alt="등록된 사진이 없습니다." onerror="this.onerror=null; chageSrc(this)">
									</div>
								</li>
							</ul>
							<ul id="product-gallery" class="img-detail-list">
								<li class="image-list" style="float:left;">
									<div class="prd-gutter">
										<img id = "${pdto.image3 }" class="product-image" src="${pdto.image3 }" alt="등록된 사진이 없습니다." onerror="this.onerror=null; chageSrc(this)">
									</div>
								</li>
								<li class="image-list" style="float:right;">
									<div class="prd-gutter">
										<img id = "${pdto.image4 }" class="product-image" src="${pdto.image4 }"  alt="등록된 사진이 없습니다." onerror="this.onerror=null; chageSrc(this)">
									</div>
								</li>
							</ul>
							<ul id="product-gallery" class="img-detail-list">
								<li class="image-list" style="float:left;">
									<div class="prd-gutter">
										<img id = "${pdto.image5 }" class="product-image" src="${pdto.image5 }" alt="등록된 사진이 없습니다." onerror="this.onerror=null; chageSrc(this)">
									</div>
								</li>
								<li class="image-list" style="float:right;">
									<div class="prd-gutter">
										<img id = "${pdto.image6 }" class="product-image" src="${pdto.image6 }"  alt="등록된 사진이 없습니다." onerror="this.onerror=null; chageSrc(this)">
									</div>
								</li>
							</ul>
						</div>
						<div class="info-wrap_product_n">
							<div class="product-option-container">
								<div class="uk-hidden-small uk-position-relative">
									<div class="price-wrap uk-width-1-1 uk-margin-small-bottom">
										<div class="uk-float-left" style="float:left;">
											<div class="product-subtitle">
												<span class="text-color-secondary">${pdto.category }</span>
											</div>
										</div>
										<div class="uk-float-right" style="float:right;">
											<span class="price"><strong data-price="129000">${pdto.price }원</strong></span>
										</div>
									</div>
									<h1 class="title-wrap">
										<span class="tit">${pdto.codename }</span>
									</h1>
								</div>
								<div class="pinfo-item-box">
									<form method="POST" action="#">
										<div class="option-wrap">
											<div class="size-grid-type padding radius">
												<a class="btn-option"><strong class="tit2">사이즈 선택</strong></a>
												<div class="product-option_radio square">
													<c:forEach var="i" begin="220" end="330" step="10">
														<div class="opt-list">
															<span class="input-radio">
																<label class="sd-out">${i }</label>
																<input type="radio" name="SIZE" value="${i }">
															</span>
														</div>
													</c:forEach>
												</div>
											</div>
											<div class="quantity" data-component-quantity="{maxQuantity:10, msg:개까지 구매가능 합니다., quantityStateMst:상품의 수량이 없습니다.}">
												<h2><span>수량</span><span class="msg"></span></h2><hr>
												<span class="btn-qy">
													<input name="quantity" class="label" type="text" value="1">
													<button class="btn minus"><i class="icon-plus"></i></button>
												</span>
											</div>
										</div>
										<div class="btn-group-box line type2">
											<div class="status-wrap btn-wrap radius" data-add-item>
												<div class="order-wrap">
													<input type="submit" value="바로구매">&nbsp;&nbsp;														
													<button class="wish-btn line btn-link sky-blue noraml btn-wishlist radius">장바구니</button>
												</div>
											</div>
										</div>
									</form>
									<div class="discription-wrap uk-accordian" data-uk-accordian="{collapse:true}">
										<div class="pop-detail-content">
											<div class="description conTab" id="pdp-description-summary" data-info-height="{outerHeight:456, infoType:product-detail}"></div>
												<div class="description-preview">
													<p><b>${pdto.contents }</b></p>
												</div>
												<div> 
													<span class="style-color">현재 컬러 : ${pdto.color }<br></span>
													<span class="style-code">스타일 : ${pdto.code }<br></span>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
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