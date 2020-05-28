<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<style>
.wrapper {
	font-family: "Noto Sans KR", "Malgun Gothic", "MalgunGothic", Dotum,
		Helevtica, Arial, sans-serif;
	color: #111;
}

.section-header {
	display: table;
	width: 100%;
	justify-content: space-between;
	padding: 40px 48px 30px 48px;
}

.section-header .section-title {
	display: table-cell;
	width: 70%;
}

.section-broadcomb {
	line-height: 28px;
}

.section-title-sub {
	paddig-top: 12px;
	font-size: 12px;
	line-height: 16px;
}

.section-control {
	vertical-align: bottom;
	font-size: 15px;
	text-align: right;
	font-weight: 500;
	float: right;
	margin-right: 13%;
}

.contents {
	overflow: hidden;
}

.contents-side {
	display: inline-block;
	transition: left 0.3s;
	height: 400px;
	width: 13%;
	margin-right: 5px;
	float: left;
}

.section-filter {
	margin-top: 0;
	margin-right: 0;
	padding-left: 48px;
	padding-right: 48px;
	float: left;
}

.contents-body {
	display: inline-block;
	float: right;
	min-height: 3876px;
	max-width: 80%;
	width: 85%;
	align: center;
}

.ncss-container {
	padding-left: 0;
	padding-right: 0;
}

.item-list-wrap {
	clear: none;
	margin-left: -8px;
	margin-right: -8px;
}

.ncss-col {
	vertical-align: top;
	display: inline-block;
	width: 447px;
	height: 600px;
	margin-right: 20px;
}

.a-product {
	margin-bottom: 10%;
	width: 431px;
	display: inline-block;
	max-width: 100%;
	height: 90%;
}

.a-product-image {
	display: inline-block;
	height: 420px;
	width: 420px;
	background-color: #f5f5f5;
	vertical-align: middle;
}

.a-product-info {
	text-align: left;
	vertical-align: middle;
}

.product-display {
	display: flex;
	justify-content: space-between;
	word-break: keep-all;
	line-height: 1.6em;
	letter-spacing: -0.5px;
}

.product-info {
	width: 66.6%;
}

.product-display-name {
	line-height: 1.4em;
}

.item-title {
	display: block;
	white-space: pre-wrap;
	word-break: break-all;
}

#item-color-opt {
	padding-top: 3px;
}

.text-color-secondary {
	color: #8d8d8d;
}

.product-price {
	padding-right: 10px;
}

.product-display-price {
	white-space: nowrap;
}

.noneProduct {
	color: black;
	text-align: left;
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
	<c:import url="/header"></c:import>
	<header> </header>
	<section class="wrapper">
		<section class="content-area">
			<div class="section-header">
				<div class="section-title">
					<div class="section-broadcomb" style="display: block">
						<a href="/nike/main"><h1>나이키</h1></a>
					</div>

					<div class="section-title-sub">
						<br>
					</div>
				</div>
			</div>
			<div
				style="display: block; width: 100%; height: 50px; overflow: hidden;">
				<div class="section-control">
					<button class="filter">FILTER</button>
					<a><span class="currentOpt">신상품순</span></a>
				</div>
			</div>
			<article class="contents">
				<form method="get">
					<div class="contents-side">
						<section class="section-filter">
							<div class="category-filter-box">
								<div class="f-category">
									<ul id="category-filter-list">
										<li class="f-item" id="two-depth-shoes"
											style="padding-left: 14px;"><a href="/nike/Men">Men</a></li>
										<li class="f-item" id="two-depth-shoes"
											style="padding-left: 14px;"><a
											href="/nike/Men/categoly?categoly=run">러닝</a></li>
										<li class="f-item" id="two-depth-shoes"
											style="padding-left: 14px;"><a
											href="/nike/Men/categoly?categoly=basket">농구</a></li>
										<li class="f-item" id="two-depth-shoes"
											style="padding-left: 14px;"><a
											href="/nike/Men/categoly?categoly=soccer">축구</a></li>
									</ul>
								</div>
							</div>
							<hr>
							<div class="category-filter-box">
								<div class="f-category">
									<ul id="category-filter-list">
										<li class="f-item" id="two-depth-shoes"
											style="padding-left: 14px;"><a href="/nike/Men">Women
										</a></li>
										<li class="f-item" id="two-depth-shoes"
											style="padding-left: 14px;"><a
											href="/nike/Men/categoly?categoly=run">러닝</a></li>
										<li class="f-item" id="two-depth-shoes"
											style="padding-left: 14px;"><a
											href="/nike/Men/categoly?categoly=basket">농구</a></li>
										<li class="f-item" id="two-depth-shoes"
											style="padding-left: 14px;"><a
											href="/nike/Men/categoly?categoly=soccer">축구</a></li>
									</ul>
								</div>
							</div>
							<hr>
							<div class="category-filter-box">
								<div class="f-category">
									<ul id="category-filter-list">
										<li class="f-item" id="two-depth-shoes"
											style="padding-left: 14px;"><a href="/nike/Men">Kids</a></li>
										<li class="f-item" id="two-depth-shoes"
											style="padding-left: 14px;"><a
											href="/nike/Men/categoly?categoly=run">러닝</a></li>
										<li class="f-item" id="two-depth-shoes"
											style="padding-left: 14px;"><a
											href="/nike/Men/categoly?categoly=basket">농구</a></li>
										<li class="f-item" id="two-depth-shoes"
											style="padding-left: 14px;"><a
											href="/nike/Men/categoly?categoly=soccer">축구</a></li>
									</ul>
								</div>
							</div>
							<hr>
						</section>
					</div>
				</form>

				<div class="contents-body" style="min-height: 937px">
					<c:choose>
						<c:when test="${searchCode.size()!=0}">
							<div class="ncss-container">
								<div class="item-list-wrap">
									<c:forEach var="search" items="${searchCode }">
										<div class="ncss-col">
											<div class="a-product">
												<div class="a-product-image">
													<a href="${search.code}">
														<div class="a-product-image-wrapper">
															<div class="a-image">
																<img id="${search.code }"
																	style="width: 420px; margin: auto;"
																	src="/nike/${search.image1 }"
																	onerror="this.onerror=null; chageSrc(this)">
															</div>
														</div>
													</a>
												</div>
												<div class="a-product-info">
													<div class="product-display">
														<div class="product-info">
															<p class="product-display-name">
																<span class="item-title">${search.codename }</span>
															</p>
															<div class="product-subtitle">
																<span>${search.gender } <c:choose>
																		<c:when test="${search.category=='run' }">런닝</c:when>
																		<c:when test="${search.category=='soccer' }">축구</c:when>
																		<c:when test="${search.category=='basket' }">농구</c:when>
																	</c:choose> 신발
																</span>
															</div>
															<div id="item-color-opt" class="product-colorways-number">
																<span class="text-color-secondary">1 컬러</span>
															</div>
														</div>
														<div class="product-price">
															<p class="product-display-price">${search.price }</p>
														</div>
													</div>
												</div>
											</div>
										</div>
									</c:forEach>
								</div>
							</div>
						</c:when>
						<c:otherwise>
							<div class="noneProduct">
					        	<hr align="left" style="color:gray;  width: 85%;border: 5; ">
								<br>
								<h2>검색하신 물품은 존재하지 않습니다.</h2>
								<br>
								<hr align="left" style="color:gray; width: 85%; border: 5; ">
							</div>
						</c:otherwise>
					</c:choose>
				</div>
			</article>
		</section>
	</section>
	<footer> </footer>
</body>
</html>