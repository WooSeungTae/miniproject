<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Aside</title>
<style>

	.aside_hr{
		border-bottom:solid 0.5px #e5e5e5; 
		width:230px;
	}
	
/* 쇼핑정보, 활동정보, 나의정보, 등 aside 미니타이틀 */
	.aside_title{ margin-left: -35px; font-weight: bold; }
	
/* aside 마이페이지 메뉴들 ul, li */	
	#aside_btn{ display: inline-block; }
	#aside_btn ul{}
	#aside_btn ul li{ list-style: none; padding-bottom: 8px; }
	.aside_a{
		text-decoration:none; 
		font-size: 13.5px; 
		font-weight: bold;
		color: #5D5D5D;
		margin-left: -35px;
	}
	
/* 로그인 사용자 이름 */
	.aside_img{
		vertical-align: middle; 
		width:30px;
		height:30px;
		margin-top: -4px;
	}
	.aside_name{
		font-size: 14px; 
		padding-top:16px; 
		padding-bottom:11px;
	}
	
</style>
</head>
<body>
	<!--  왼쪽 사이드바 부분 -->
	<aside style="float: left; margin-right: 30px;">
		<div class="aside_hr"><h1>MY PAGE</h1></div>
		<div class="aside_hr">
			<div class="aside_name">
				<span><img src="image/user_b.png" class="aside_img"></span>
				<span>${name }</span>
			</div>
		</div>
		<div id="aside_btn">
			<div class="aside_hr">
				<ul>
					<li class="aside_title">쇼핑정보</li>
					<li><a href="orderList" class="aside_a">주문 배송</a></li>
					<li><a href="myPage1" class="aside_a">최근 주문 내역</a></li>
				</ul>
			</div>
			<div class="aside_hr">
				<ul>
					<li class="aside_title">활동정보</li>
					<li><a href="mileage" class="aside_a">나의 MILE</a></li>
					<li><a href="reviewintro" class="aside_a">상품리뷰</a></li>
					<li><a href="mypageQnA" class="aside_a">나의 Q&A</a></li>
				</ul>
			</div>
			<div class="aside_hr">
				<ul>
					<li class="aside_title">나의정보</li>
					<c:choose>
					<c:when test = '${empty access_Token}'>
						<li><a href="account" class="aside_a">회원정보 관리</a></li>
						<li><a href="password" class="aside_a">비밀번호 변경</a></li>
					</c:when>
				</c:choose>
					<li><a href="withdrawal" class="aside_a">회원 탈퇴</a></li>
				</ul>
			</div>
			<div class="aside_hr">
				<ul>
					<li class="aside_title">나이키닷컴 고객센터</li>
					<li style="font-size:24px; font-weight: bold; margin-left: -35px; ">080-022-0182</li>
					<li style="font-size:13px; margin-left: -35px; ">월~일 : 오전 9시 ~ 오후 8시</li>
				</ul>
			</div>
		</div>
	</aside>
</body>
</html>