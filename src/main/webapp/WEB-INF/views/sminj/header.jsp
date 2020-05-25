<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>나이키. Just Do It. Nike.com</title>
<style type="text/css">
	
	/* 기본 설정 */
	hr{border:solid 0.5px #e8ebed;}
		
	/* 회원가입,로그인,고객센터,장바구니 */
	#top{text-decoration:none; color:#808080; }
	.div1{border-color:#808080; font-size:12px; height:22px; margin-right:20px; margin-top: 11px;}
	
	/* nav */
	.div2{height: 40px; margin-top: 25px;}
	/* nav의 a태그 설정 */
	a{text-decoration:none; color:black; font-weight: bold;}

	/* 검색창 */
	.input{border: 1px solid #e8ebed; height: 40px; width: 220px; margin-top: -22px; text-indent:30px;}

</style>
</head>
<body>
<header>
	<hr>
		<div class="div1" align="right">
			<a href="myPage">마이페이지</a>&nbsp;&nbsp;&nbsp;<a href="memberJoin" id="top">회원가입</a>/<a href="loginPage" id="top">로그인</a>&nbsp;&nbsp;&nbsp;<a href="#" id="top">고객센터</a>&nbsp;&nbsp;&nbsp;<a href="#" id="top">장바구니</a>
		</div>
	<hr>	
</header>
<nav>
	<div class="div2" align="center">
		<span style="float:left;"><input type="image" src="../../resources/images/swoosh.png"></span>
		<a href="#">MEN</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#">WOMEN</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#">KIDS</a>
		<span style="width:220px; float:right; margin-right:20px;"><input type="search" class="input" placeholder="검색"></span>
	</div>
	<hr>
</nav>

</body>
</html>