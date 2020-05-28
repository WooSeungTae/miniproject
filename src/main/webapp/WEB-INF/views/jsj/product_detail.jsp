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
		.contents{
			box-sizing:border-box;
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
			padding:0 54px;
			text-align:center;
			float:left;
			height:70%;
			margin-left:-200px;
		}
		
		
	
		.img-detail-list{
			display:inline-block;
			width:90%;
			height:230px;
			height:370px;
		}
		
		.image-list{
			display:inline;
			width:350px;
			height:350px;
			overflow:0 auto;
			margin-bottom:10px;
		
		}
		.prd-gutter{
			background:#f5f5f5;
			width:350px;
			margin:5px;
			height:350px;
			margin-bottom:10px;
		}
		
		.info-wrap_product_n{
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
			float:right;
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
					<article class="contents margin-small pt_product-detail">
						<div class="img-detail_product_n">
								<ul id="product-gallery" class="img-detail-list">
									<li class="image-list" style="float:left;">
										<div class="prd-gutter">
											<img class="product-image" src="image/${image1 }" alt="사진없음">
										</div>
									</li>
									<li class="image-list" style="float:right;">
										<div class="prd-gutter">
											<img class="product-image" src="image/${image2 }"  alt="사진없음">
										</div>
									</li>
								</ul>
								<ul class="img-detail-list">
									<li class="image-list" style="float:left;">
										<div class="prd-gutter">
											<img class="product-image" src="image/${image3 }"  alt="사진없음">
										</div>
									</li>
									<li class="image-list" style="float:right;">
										<div class="prd-gutter">
											<img class="product-image" src="/image/${image4 }"  alt="사진없음">
										</div>
									</li>
								</ul>
								<ul class="img-detail-list">
									<li class="image-list" style="float:left;">
										<div class="prd-gutter">
											<img class="product-image" src="image/${image5 }"  alt="사진없음">
										</div>
									</li>
									<li class="image-list" style="float:right;">
										<div class="prd-gutter">
											<img class="product-image" src="image/${image6 }"  alt="사진없음">
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
											<span class="text-color-secondary">${category }</span>
										</div>
									</div>
									<div class="uk-float-right" style="float:right;">
										<span class="price">
											<strong data-price="129000">${price }원</strong>
										</span>
									</div>
								</div>
								<h1 class="title-wrap">
									<span class="tit" data-name="나이키 프리 런 5.0 2020">${codename }</span>
								</h1>
							</div>
							<div class="similar-items">
								<ul id="" class="similar-item">
									<c:forEach items="" var="">
										<li>
											<a href="#">
												<div>
													<img></img>
												</div>		
											</a>
										</li>
									</c:forEach>
								</ul>
							</div>
							<div class="pinfo-item-box">
								<form method="POST" action="#">
									<div class="option-wrap">
										<div class="size-grid-type padding radius">
											<a class="btn-option">
												<strong class="tit2">사이즈 선택</strong>
											</a>
											<c:forEach var="i" begin="220" end="330" step="10">
												<div class="product-option_radio square">
													<div class="opt-list">
														<span class="input-radio">
															<label class="sd-out">${i }</label>
															<input type="radio" name="SIZE" value="${i }">
														</span>
													</div>
												</div>
											</c:forEach>
											<div class="quantity" data-component-quantity="{maxQuantity:10, msg:개까지 구매가능 합니다., quantityStateMst:상품의 수량이 없습니다.}">
												<h2>
													<span>수량</span>
													<span class="msg"></span>
												</h2>
												<hr>
												<span class="btn-qy">
													<input name="quantity" class="label" type="text" value="1">
													<button class="btn minus">
														<i class="icon-plus"></i>
													</button>
												</span>
											</div>
										</div>
										<div class="btn-group-box line type2">
											<div>
												<div class="status-wrap btn-wrap radius" data-add-item>
													<div class="order-wrap">
														<input type="submit" value="바로구매">
														&nbsp;&nbsp;														
														<button class="wish-btn line btn-link sky-blue noraml btn-wishlist radius">
															장바구니
														</button>
													</div>
												</div>
												<div class="discription-wrap uk-accordian" data-uk-accordian="{collapse:true}">
													<div class="pop-detail-content">
														<div class="description conTab" id="pdp-description-summary" data-info-height="{outerHeight:456, infoType:product-detail}"></div>
														<div class="description-preview">
															<p>
																<b>${contents }</b>
															</p>
															<br>
														</div> 
														<span class="style-color">현재 컬러 : 써밋 화이트/레이저 오렌지/블랙<br></span>
														<span class="style-code" data-model="CV9305-100">스타일 : CV9305-100<br></span>
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
													<div data-wrapper="true" class="accordion-wrapper" aria-expanded="false" style="height:0px; overflow:hidden;">
														<div class="pop-detail-content uk-accordian-content">
															<div class="detail-review" id="detail-review">
																<div data-module-review="">
																	<div class="uk-grid detail-review-summary">
																		<div class="uk-width-large-1-3 summary-sect">
																			<div class="star-total-info">
																				<p class="star-average">
																					<span class="like">
																						<i class="icon-star5 per" style="width:85.0%">☆☆☆☆☆</i>
																						<i class="icon-star5 star-default-bg"></i>
																					</span>
																					<span class="total-star-point">4.2점</span>
																				</p>
																				<a href="#" class="review-write-btn" data-successmsg="완료되었습니다." data-click-area="pdp" data-click-name="review_write a review" data-productid="10000030545">리뷰 작성하기</a>
																			</div>
																		</div>
																	</div>
																	<div class="detail-reviewlist-summary">
																		<div class="n-review-read">
																			<ul id="review-summary">
																				<li data-reviewid="10981785">
																					<div class="uk-grid">
																						<div class="read-list uk-width-arge-2-3">
																							<p class="read-subject">프리런 5.0굿</p>
																							<p class="user-info">
																								<span class="review-filter star like" data-productid="1000030545">
																									<i class="brz-icon-star_small star-5 per" style="width:60.0%">★★★★☆</i>
																									<i class="brn-icon-star_small"></i>
																								</span>
																							</p>
																							<div class="user-name">
																								<span>황*식 - </span>
																							</div>
																							<span class="write-date" date="2020-05-08 23:41:41.0">2020.05.08</span>
																							<p></p>
																							<p class="read-comment shorten-txt">배송도 빠른편이고 좋아요</p>
																							<p class="review-img-info">
																								<span class="append-img">
																									<a href="#"><img src=""></a>
																								</span>
																								<span class="append-img">
																									<a href="#"><img src=""></a>
																								</span> 
																								<span class="append-img">
																									<a href="#"><img src=""></a>
																								</span>
																							</p>
																							<div class="review-help"></div>
																							
																						</div>
																						<div class="uk-width-large-1-3 pc-only opt-value-w">
																							<div class="opt-value-wrap">
																								<div class="opt-value-list">
																									<div class="opt-value-list">
																										<span class="opt-value-title">편안함</span>
																									</div>
																									<div class="opt-value-box">
																										<div class="opt-value-gage">
																											<span class="opt-value-dot per active" style="left:100%"></span>
																											<span class="opt-value-dot"></span>
																										</div>
																										<div class="opt-value-txtbox">
																											<span class="opt-value-txt left">편하지 않은</span>
																											<span class="opt-value-txt right">편안한</span>
																										</div>
																									</div>
																								</div>
																							</div>
																						<div class="opt-value-list">
																							<div class="opt-value-list">
																								<span class="opt-value-title">사이즈</span>
																								<div class="opt-value-box">
																									<div class="opt-value-gage">
																										<span class="opt-value-dot per active" style="left:60%"></span>
																										<span class="opt-value-dot"></span>	
																									</div>
																									<div class="opt-value-txtbox">
																										<span class="opt-value-txt left">작은</span>
																										<span class="opt-value-txt right">큰</span>
																									</div>
																								</div>
																							</div>
																						</div>
																						<div class="opt-value-list">
																							<div class="opt-value-list">
																								<span class="opt-value-title">내구성</span>
																								<div class="opt-value-box">
																									<div class="opt-value-gage">
																										<span class="opt-value-dot per active" style="left:55%"></span>
																										<span class="opt-value-dot"></span>
																									</div>
																									<div class="opt-value-txtbox">
																										<span class="opt-value-text left">내구성이 없는</span>
																										<span class="opt-value-text right">내구성이 있는</span>
																									</div>
																								</div>
																							</div>
																						</div>
																						<div class="opt-value-list">
																							<div class="opt-value-list">
																								<span class="opt-value-title">폭</span>
																								<div class="opt-value-box">
																									<div class="opt-value-gage">
																										<span class="opt-value-dot per active" style="left:40%"></span>
																										<span class="opt-value-dot"></span>
																									</div>
																									<div class="opt-value-txtbox">
																										<span class="opt-value-txt left">좁은</span>
																										<span class="opt-value-txt right">넓은</span>
																									</div>
																								</div>
																							</div>
																						</div>
																					</div>
																				</div>
																			</li>
																			<li data-reviewid="10976851">
																				<div class="uk-grid">
																					<div class="read-list uk-width-large-2-3">
																						<p class="read-subject">런닝화 가볍고 편해서 좋네요~</p>
																						<p class="user-info">
																							<span class="review-filter star like" data-productid="1000003045">
																								<i class="brz-icon-star_small star-5 per" style="width:80.0%"></i>
																								<i class="brz-icon-star_small"></i>
																							</span>
																						</p>
																						<div class="user-name">
																							<span>조*형 - </span>
																						</div>
																						<span class="write-date" date="2020-05-06 12:06:25.0">2020.05.06</span>
																						<p></p>
																						<p class="read-comment shorten-txt">
																							신발 예뻐요~ 봄여름 신기에 딱 좋네요. 발볼이 좀 넓은 편이라 반 사이즈 크게 신으니 좀 압박감있는 정도에요. 불편한 정도는 아니구요. 널널하게 신으실 분들은 한사이즈 크게 신으셔야 할것 같네요"
																						</p>
																						<p class="review-img-info"></p>
																						<div class="review-help"></div>
																					</div>
																					<div class="uk-width-large-1-3 pc-only opt-value-w">
																						<div class="opt-value-wrap">
																							<div class="opt-value-list">
																								<span class="opt-value-title">편안함</span>
																							<div class="opt-value-box">
																								<div class="opt-value-gage">
																									<span class="opt-value-dot per active" style="left:100%"></span>
																									<span class="opt-value-dot"></span>
																								</div>
																							<div class="opt-value-txtbox">
																								<span class="opt-value-txt left">편하지 않은</span>
																								<span class="opt-value-txt right">편안한</span>
																							</div>
																						</div>
																					</div>
																				</div>
																				<div class="opt-value-list">
																					<div class="opt-value-list">
																						<span class="opt-value-title">사이즈</span>
																						<div class="opt-value-box">
																							<div class="opt-value-gage">
																								<span class="opt-value-dot per active" style="left:50%"></span>
																								<span class="opt-value-dot"></span>
																							</div>
																							<div class="opt-value-txtbox">
																								<span class="opt-value-txt left">작은</span>
																								<span class="opt-value-txt right">큰</span>
																							</div>
																						</div>
																					</div>
																				</div>																						
																				<div class="opt-value-list">
																					<div class="opt-value-list">
																						<span class="opt-value-title">내구성</span>
																						<div class="opt-value-box">
																							<div class="opt-value-gage">
																								<span class="opt-value-dot per active" style="left:75%"></span>
																								<span class="opt-value-dot"></span>
																								
																							</div>
																							<div class="opt-value-txtbox">
																								<span class="opt-value-txt left">내구성이 없는</span>
																								<span class="opt-value-txt right">내구성이 있는</span>
																							</div>
																						</div>
																					</div>
																				</div>
																				<div class="opt-value-list">
																					<div class="opt-value-list">
																						<span class="opt-value-title">폭</span>
																						<div class="opt-value-box">
																							<div class="opt-value-gage">
																								<span class="opt-value-dot per active" style="left:25%"></span>
																								<span class="opt-value-dot"></span>
																							</div>
																							<div class="opt-value-txtbox">
																								<span class="opt-value-txt left">좁은</span>
																								<span class="opt-value-txt right">넓은</span>
																							</div>
																						</div>
																					</div>
																				</div>	
																			</div>
																		</div>
																	</li>
																</ul>
															</div>
															<a href="#" class="btn-more-review uk-margin-top" data-click-area="pdp" data-click-name="review_see more review" data-prductid="10000030545">더 많은 리뷰 보기</a>
														</div>
													</div>
												</div>
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
												<a href="#" target="_blank">자세히 보기</a>
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
												<a href="#" class="sky-blue btn-more-pop">자세히 보기</a>
												<h3 class="detail-content-title">AS 안내</h3>
												<ul class="detail-content-list">
													<li>
														나이키닷컴에서 구매하신 제품에 대해 A/S 접수를 원하실 경우에는
														<a href="#">1:1 이메일 문의</a>와 나이키닷컴 고객센터(TEL : 080-022-0182)를 이용해주세요.
													</li>
												</ul>
												<a href="#" class="sky-blue btn-more-pop" data-click-area="pdp" data-click-name="read more A/S policy">자세히 보기</a>
												<h3 class="detail-content-title">미성년자 권리보호 안내</h3>
												<ul class="detail-content-list">
													<li>
														미성년 고객께서 상품을 주문(계약) 하시는 경우, 법정대리인(부모님 등)의 동의가 없으면 미성년자 본인 또는 법정대리인(부모님 등)이 그 주문(계약)을 취소하실 수 있습니다.
													</li>
												</ul>
											</div>
										</div>
									</div>
								</form>
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