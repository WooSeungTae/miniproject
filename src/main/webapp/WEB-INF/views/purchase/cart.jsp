<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<style>
		.wrapper{
			font-family:"Noto Sans KR", "Malgun Gothic", "MalgunGothic", Dotum, Helvetica, Arial, sans-seif;
		}
		.content-area{
			display:block;
		}
		.pt_cart{
			max-width:1440px; margin:0 auto;
		}
		.contents{
			margin-top:40px;
		}
		.cart-title{
			padding:0; margin:0 0 15px 0; text-align:center; font-size:28px; line-height:24px;
			font-weight:bold; letter-spacing:-0.2px; color:#111111;
		}
		.mc-cart-num{
			width:100%; text-align:center; margin:0; font-size:16px; color:#666;
		}
		.item-container{
			display:table; width:100%; max-width:1440px; min-height:320px; margin:30px auto 0;
			box-sizing:border-box;
		}
		.item-list-wrap{
			margin:0; float:left; display:inline-block; width:55%; box-sizing:border-box;
		}
		.mypage-cart{
			margin:0; padding:0; border:0; vertical-align:baseline;
		}
		a{
			font-weight:normal;
		}
		.btn-cart-delete-All{
			color:#111; cursor:pointer;
		}
		.product-opt_cart{
			position:relatvie; width:100%; border-top:1px solid #dedfda;
			padding:20px 30px 20px 0; box-sizing:border-box;
		}
		.item-detail{
			display:table; width:100%; min-height:110px;
		}
		.item-info{
			width:68%; display:inline-block;
		}
		.img-wrap{
			position:absolute; overflow:hidden; display:inline-block; width:100px; background-color:#f6f5f6;
		}
		img{
			display:inline-blick;
			max-width:100%;
		}
		.info-wrap{
			display:inline-block; box-sizing:border-box; padding-left:158px; line-height:18px; vertical-align:top;		
		}
		.tit{
			display:block; margin-bottom:12px; font-size:14px; font-weight:bold; color:#000000;
		}
		.style-code{
			font-size:14px;
		}
		.current-option-wrap{
			margin:0; padding:0; border:0; vertical-align:baseline;
		}
		.opt{
			display:inline; font-size:14px; color:#606060; line-height:1.7;
		}
		.opt-quantity{
			font-size:14px; color:#606060; line-height:1.7;
		}
		.option-wrap{
			width:12%; padding-left:10px; vertical-align:top; display:inline-block;
		}
		.optchange{
			display:inline; font-size:14px; color:#6c6c6c; text-decoration:underline; border-radius:0;
		}
		.total-price{
			padding-top:3px; vertical-align:top; text-align:center; display:inline-block;
		}
		.total-price2{
			margin-top:20px; padding:0; border:none; display:table; width:100%;
		}
		.retail-price{
			color:#fa5400; font-weight:normal; font-size:15px; margin-left:40px;
		}
		.delete-btn{
			display:inline-block; margin-left:20px; padding-top:5px;
		}
		.btn-delete{
			color:#ddd; border:0; padding:0; margin:0;
			background-color:#fff; cursor:pointer;
		}
		.icon-delete_bold{
			font-size:16px; font-weight:bold; color:#000;
		}
		.product-checkout{
			margin:0; width:30%; max-width:none; vertical-align:top; display:inline-block;
			float:right; border-top:1px solid #d1d1d1; box-sizing:border-box; color:#111111;
		}
		.product-checkout_in-box{
			border:1px solid #e5e5e5; margin-bottom:20px;
		}
		.info-price{
			margin:0; padding:0; border:0; vertical-align:baseline;
		}
		.item-price{
			margin-top:0;
		}
		.label{
			font-size:14px; display:table-cell; color:#000; font-weight:500; letter-spacing:-1px;
		}
		.price{
			display:table-cell; text-align:right;
		}
		.delivery-price{
			width:100%; display:table; margin-top:20px;
		}
		.price-sale{
			color:#fa5400; display:table-cell; text-align:right;
		}
		.price-sale-total{
			color:#fa5400; display:table-cell; text-align:right;
		}
		.btn-link{
			margin-top:15px; background-color:#fb5302; font-size:14x; font-weight:bold; color:#fff;
		}
	</style>
	<script type="text/javascript" src="js/jquery-3.4.1.min.js"></script>
	<script type="text/javascript">
		function alldelete(){
			alert("장바구니에 담긴 상품이 모두 삭제됩니다!")
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
			<section class="pt_cart">
				<article class="contents">
					<h2 class="cart-title">장바구니</h2>
					<div class="mc-cart-num">
						<span>${cartcount}개 상품</span>
					</div>
					<div class="item-container">
						<div class="item-list-wrap" id="cart">
							<div class="mypage-cart" id="current-item-wrap">
								<a class="btn-cart-delete-All" href="cartAlldelete" onclick="alldelete()">전체삭제</a>
							</div>
							<div class="product-opt_cart">
								<div class="item-detail">
									<div class="item-info">
										<span class="img-wrap">
											<img src="" alt="나이키 데이브레이크-타입">
										</span>
										<div class="info-wrap">
											<div class="tit">나이키 데이브레이크-타입</div>
											<div class="style-code">스타일 : CJ1156-001</div>
											<div class="current-option-wrap">
												<span class="opt">사이즈 : 250</span>
											</div>
											<span class="opt-quantity">수량 : 1</span>
										</div>
									</div>
									<div class="option-wrap">
										<div>
											<button class="optchange">옵션 변경</button>
										</div>
									</div>
									<div class="total-price">
										<strong class="retail-price">109,000원</strong>
									</div>
									<div class="delete-btn">
										<a class="btn-delete" href="#"><i class="icon-delete_bold">X</i></a>
									</div>
								</div>
							</div>
							<div class="product-opt_cart">
								<div class="item-detail">
									<div class="item-info">
										<span class="img-wrap">
											<img src="" alt="나이키 데이브레이크-타입">
										</span>
										<div class="info-wrap">
											<div class="tit">나이키 데이브레이크-타입</div>
											<div class="style-code">스타일 : CJ1156-001</div>
											<div class="current-option-wrap">
												<span class="opt">사이즈 : 250</span>
											</div>
											<span class="opt-quantity">수량 : 1</span>
										</div>
									</div>
									<div class="option-wrap">
										<div>
											<button class="optchange">옵션 변경</button>
										</div>
									</div>
									<div class="total-price">
										<strong class="retail-price">109,000원</strong>
									</div>
									<div class="delete-btn">
										<a class="btn-delete" href="#" onclick="itemdelete()"><i class="icon-delete_bold">X</i></a>
									</div>
								</div>
							</div>
						</div>
						<div class="product-checkout">
							<strong class="tit">주문예정금액</strong>
							<div class="product-checkout_in-box">
								<div class="info-price">
									<span class="item-price">
										<span class="label">상품 금액</span>
										<span class="price"><strong>268,000원</strong></span>
									</span>
									<span class="delivery-price">
										<span class="label">예상 배송비</span>
										<span class="price"><strong>0원</strong></span> 
									</span>
									<span class="item-price">
										<span class="label">상품 할인 금액</span>
										<span class="price-sale"><strong>0원</strong></span> 
									</span>
									<span class="item-price">
										<span class="label">주문 할인 금액</span>
										<span class="price-sale"><strong>0원</strong></span> 
									</span>
								</div>
								<div class="total-price2">
									<span class="label">총 결제 예정 금액</span>
									<span class="price-sale-total"><strong>268,000원</strong></span>
								</div>
								<input class="btn-link" type="button" value="주문하기">
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