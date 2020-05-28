<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>나이키. Just Do It. Nike.com</title>
<style type="text/css">
	/* 기본 설정 */
	.header_hr{
	border:solid 0.5px #e8ebed;
	}
	
	/* [비로그인상태] 회원가입,로그인,고객센터 */
	#top{
	text-decoration:none; 
	color:#808080; 
	}
	.div1{
	border-color:#808080; 
	font-size:12px; 
	height:22px; 
	margin-right:20px; 
	margin-top: 11px;
	}
	
	/* [로그인상태] 이름 부분 div */
	.user_name{
	text-align:right; 
	float: left; 
	width:92%; 
	height: 38px;
	margin-top:-19px; 
	}
	
	/* [로그인상태] 고객센터, 장바구니 div */
	.header_div{
	text-align:left; 
	float: left; 
	width:8%;
	}
	
	/* 큰 ul */
	.menu2{
	float:right; 
	position: relative; 
	z-index: 2;
	}
	
	/* 메뉴바 */
	.user_img{
	margin-right: -17px; 
	margin-bottom: -9px; 
	margin-left: 30px;
	}
	.menu {
	list-style: none;
	line-height: 250%;
	}
	.menu ul{
	color:black;
	font-size: 12px;
	border:solid 0.5px #e8ebed;
	background-color:white;
	width: 20px;
	height: 110px;
	padding-right: 100px;
	padding-top: 20px;
	}
	.menu li{
	list-style: none;
	font-size: 12px;
	width: 100px;
	height: 30px;
	margin-left: -20px;
	margin-top: -2px;
	}
	.menu a{
	cursor:pointer;
	text-decoration: none;
	color:black;
	font-size: 12px;
	margin-left: 20px;
	}
    .menu .hide{
    display:none;
    }

	/* 장바구니 */
	.basket_input{
	float:right; 
	margin-right:20px; 
	margin-top: -6px;
	}
	
	/* nav */
	.div2{
	height: 40px; 
	margin-top: 25px;
	}

	/* 나이키 로코 링크 */
	.swoosh_input{
	height:35px; 
	width:75px;
	}
	.swoosh_span{
	float:left; 
	height: 35px; 
	margin-top: -5px; 
	margin-left: 20px; 
	}

	/* nav의 a태그 설정 */
	.nav_a{
	text-decoration:none; 
	color:black; 
	font-weight: bold; 
	font-size: 18px;
	}

	/* 검색창 */
	.search_input{
	border: 1px solid #e8ebed; 
	height: 40px; 
	width: 220px; 
	margin-top: -22px; 
	text-indent:50px; 
	font-size:14px;
	background-image: url('image/search.png'); 
	background-repeat: no-repeat; 
	background-position: 15px center;
	}
	.search_span{
	float:right; 
	width:220px; 
	margin-right:20px; 
	}
	
</style>

  <script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
   <script>
   $(document).ready(function(){
       $(".menu>a").click(function(){
           $(this).next("ul").toggleClass("hide");
       });
   });
   
   
   function goSearch(){
	   
	var searchp = document.getElementById('searchProduct').value;

	location.href="searchCheck?codename="+searchp;
   
   }
   </script>
   

   
</head>
<body>

<header>
	<hr class="header_hr">
	<c:if test = '${id != null }'>
		<div class="div1" align="right">
			<span>
				<div class="user_name">
					<ul class="menu2">
						<li class="menu">
							<img src="image/user.png" class="user_img"/><a>이름이</a>
							<ul class="hide">
								<li><a href="myPage">마이페이지</a></li>
								<li><a href="account">회원정보관리</a></li>
								<li><a href="main">로그아웃</a></li>
							</ul>
						</li>
					</ul>
				</div>
			</span><div class="header_div">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#" id="top">고객센터</a><span class="basket_input"><a href="cart"><input type="image" src="image/basket.png" style="margin-right: 10px;"></a></span></div>
		</div>
	</c:if>
	<c:if test = '${id == null }'>
		<div class="div1" align="right">
			<a href="memberJoin" id="top">회원가입</a>/<a href="loginPage" id="top">로그인</a>&nbsp;&nbsp;&nbsp;<a href="#" id="top">고객센터</a>&nbsp;&nbsp;&nbsp;<span class="basket_input"><a href="cart"><input type="image" src="image/basket.png"></a></span>
		</div>
	</c:if>
	<hr class="header_hr">	
</header>
<nav>
	<div class="div2" align="center">
		<span class="swoosh_span"><input type="image" class="swoosh_input" src="image/nike.jpg" onclick="location.href='main'"></span>
		<a href="Men" class="nav_a">MEN</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#" class="nav_a">WOMEN</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#" class="nav_a">KIDS</a>
		<span class="search_span"><input id="searchProduct" onkeypress="if( event.keyCode==13 ){goSearch()}" type="search" class="search_input" placeholder="검색" ></span>
	</div>
	<hr class="header_hr">
</nav>

</body>
</html>