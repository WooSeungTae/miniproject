<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>나이키. Just Do It. Nike.com</title>
<style>
	
	/* footer 첫째 칸 */
	#btn1{ display: inline-block; }
	#btn1 ul{}
	#btn1 ul li{
	list-style: none;
	padding-bottom: 8px;
	}
	
	/* footer 둘째 칸 */
	.info1{
	color: #808080; 
	font-size: 9px;
	height: 25px; 
	margin-top: 15px;
	} 
	
	/* footer 셋째 칸 */
	.info2{
	color: #808080; 
	font-size: 11px;
	text-align:left;
	margin:auto;
	display: inline-block;
	} 
	
	/* 전체 a태그 기본 설정 */
	.all a{
	text-decoration:none; 
	color:#808080; 
	font-size:12px;
	}
	.all a:hover{color:white;}
	
	/* 기본 설정 */
	.all{
		background-color: black; 
		height: 520px;
		position:static; 
		margin-top: 120px;
	}
	.footer_border{
		border-bottom: solid 0.5px #808080;
	}
	html,body {
		margin: 0;
		padding: 0;
	}

</style>
</head>
<body>
<c:set var="size" value="${id}"/>
	<footer style="width:100%; margin: 0;">
	<div class="all">
		<div align="center" class="footer_border">
			<div id="btn1">
			<c:choose>
				<c:when test = '${empty id}'>
				<div style="float: left; margin-right: 100px;">
					<ul>
						<li><a href="#" style="color: white; font-size: 13px;">매장안내</a></li>
						<li><a href="/nike/loginPage" style="color: white; font-size: 13px;">로그인</a></li>
						<li><a href="/nike/memberJoin" style="color: white; font-size: 13px;">회원가입</a></li>
					</ul>
				</div>
				</c:when>
				<c:otherwise>
				<div style="float: left; margin-right: 100px;">
					<ul>
						<li><a href="#" style="color: white; font-size: 13px;">매장안내</a></li>
						<li><a href="/nike/logout" style="color: white; font-size: 13px;">로그아웃</a></li>
					</ul>
				</div>
				</c:otherwise>
			</c:choose>
				<div style="float: left; margin-right: 100px;">
					<ul>
						<li style="color: white; font-size: 13px;">고객센터</li>
						<li><a href="#">080-123-1004</a></li>
						<li><a href="#">주문/결제</a></li>
						<li><a href="#">배송</a></li>
						<li><a href="/nike/orders">주문배송조회</a></li>
						<li><a href="#">멤버쉽 혜택/서비스</a></li>
						<li><a href="#">공지사항</a></li>
						<li><a href="#">1:1 채팅 문의</a></li>
						<li><a href="#">1:1 이메일문의</a></li>
						<li><a href="#">이용약관</a></li>
						<li><a href="#">개인정보처리방침</a></li>
					</ul>
				</div>
				<div style="float: left; margin-right: 100px;">
					<ul>
						<li style="color: white; font-size: 13px;">ABOUT NIKE</li>
						<li><a href="#">나이키에 대하여</a></li>
					</ul>
				</div>
				<div style="float: left;">
					<ul>
						<li style="color: white; font-size: 13px;">SOCIAL</li>
						<li></li>
					</ul>
				</div>
			</div>
		</div>
		<div class="info1" class="footer_border">
			<span style="float: left; margin-left: 15px;">© 2020 Nike, Inc. All Rights Reserved</span>
			<span style="float: right; margin-right: 15px; font-size: 8px;"><a href="#">이용약관</a>&nbsp;&nbsp;&nbsp;<a href="#">개인정보처리방침</a></span><br>
		</div>
		<div align="center">
			<div class="info2"><br>
				<span style="float:left; margin-right: 20px;">
					(유)나이키코리아 대표 HONG GIL DONG | 서울 종로구 돈화문로 26 단성사빌딩<br>
					통신판매업신고번호 2020-서울종로-01216 | 등록번호 220-88-01216 <a href="#" style="color:white; font-size: 11px;">사업자정보확인</a><br>
					개인정보보호책임자 ANDY HOUGHTON | 정보보호최고책임자 이희준 | 고객센터 전화문의 <a href="#" style="color:white; font-size: 11px;">080-123-1004</a><br>
					FAX 02-1216-1004 | E-mail service@nike.co.kr | 호스팅서비스사업자 브리즈
				</span>
				<span style="float:right;">
					안전거래를 위해 현금 등으로 결제 시 저희 쇼핑몰에서 가입한<br>
					KG 이니시스의 구매안전 서비스(채무지급보증)를 이용하실 수 있습니다.<br><br>
					온라인디지털콘텐츠사업발전법에 의한 <a href="#" style="color:white; font-size: 11px;">콘텐츠보호안내 자세히보기</a>
				</span>
			</div>
		</div>
	</div>
	</footer>
</body>
</html>