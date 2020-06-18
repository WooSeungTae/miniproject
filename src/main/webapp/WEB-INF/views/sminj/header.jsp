<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>나이키. Just Do It. Nike.com</title>
  <script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
  <script>
   $(function(){
      $(document).mouseup(function(e) {
         if ($(e.target).parents('.rightTop_login_menu').length == 0) {
            $('.rightTop_login_menu li').removeClass('expand');
            $('.rightTop_login_menu ul').hide();
         }
      });
      $(".rightTop_login_menu>li:has(ul)>a").each( function() {
         $(this).html( $(this).html() );
      });
      $(".rightTop_login_menu ul li:has(ul)")
         .find("a:first")
         .append("<p style='float:right;margin:-3px'>&#9656;</p>");

      $(".rightTop_login_menu li>a").click(function(){
         var li = $(this).parent();
         var ul = li.parent()
         ul.find('li').removeClass('expand');
         ul.find('ul').not(li.find('ul')).hide();
         li.children('ul').toggle();
         if( li.children('ul').is(':visible') || li.has('ul')) {
            li.addClass('expand');
         }
      });
   });
   
   $(function(){
      $(document).mouseup(function(e) {
         if ($(e.target).parents('.rightTop_admin_menu').length == 0) {
            $('.rightTop_admin_menu li').removeClass('expand');
            $('.rightTop_admin_menu ul').hide();
         }
      });
      $(".rightTop_admin_menu>li:has(ul)>a").each( function() {
         $(this).html( $(this).html() );
      });
      $(".rightTop_admin_menu ul li:has(ul)")
         .find("a:first")
         .append("<p style='float:left;margin:-3px'>&#9656;</p>");

      $(".rightTop_admin_menu li>a").click(function(){
         var li = $(this).parent();
         var ul = li.parent()
         ul.find('li').removeClass('expand');
         ul.find('ul').not(li.find('ul')).hide();
         li.children('ul').toggle();
         if( li.children('ul').is(':visible') || li.has('ul')) {
            li.addClass('expand');
         }
      });
   });
   
   function goSearch(){
   var searchCodeName = document.getElementById('searchProduct').value;
   location.href="/nike/searchCheck?codename="+searchCodeName;
   }
   
 </script>
<style type="text/css">
/* ----------------------------------------- FirstRow ----------------------------------------- */
   /* 왼쪽상단 태그 */
   .left_top{}
   .left_top_div{ width:450px; height: 39px; margin-top: -16px; margin-bottom: -8px; margin-left: -47px; }
   .left_top ul{ width:450px; height: 39px; list-style: none; display: block;}
   .left_top li{ height: 39px; margin-left: -5px; display: inline-block; border-right: 1px solid #e5e5e5;}
   .left_top img{ height: 38px;}
   
   /* [비로그인상태] 오른쪽상단 태그 */
    .rightTop_logout{ 
	 color:#808080; 
	 font-size:12px; 
	 float:right; 
	 width:250px; 
	 height:25px; 
	 margin-top: -24px; 
	 margin-bottom:-10px; 
	}
    .rightTop_logout a{text-decoration:none; color:#808080; }
    .rightTop_logout ul{ height: 25px; line-height: 25px;}
    .rightTop_logout li{ list-style: none; display: inline-block;}
    .rightTop_logout img{vertical-align: middle; margin-top: -3px;}
    
   /* [로그인상태] 오른쪽상단 태그 */
    .rightTop_login {
      width: 350px;
      height:25px;
      float: right;
      margin-top: -42px;
      margin-right: -80px;
   	}
	.rightTop_login img{ vertical-align: middle; }
	.rightTop_login_menu {  }
	.rightTop_login_menu ul {
	  background-color:white;
	  border: solid 0.5px #e8ebed;
 	  display: none;
	  position: absolute;
	  line-height: 25px;
	  width: 100px;
	  height: 140px;
	  margin-left: -18px;
	  margin-top: 4px;
	 }
	 .rightTop_login_menu li {
	  list-style:none;
	  position: relative;
	  display: inline-block;
	  line-height: 25px;
	  font-size: 12px;
	  color:#808080;
	  height:25px;
	 }
	 .rightTop_login_menu a {
	  color: black;
	  display: block;
	  text-decoration: none;
	  color:#808080;
	  margin-right: 15px;
	 }
	 .rightTop_login_menu li:hover a:hover{ color: black; }

   /* [로그인상태-관리자모드] 오른쪽상단 태그 */
    .rightTop_admin {
      width: 200px;
      height:25px;
      float: right;
      margin-top: -42px;
      margin-right: -50px;
   	}
	.rightTop_admin img{ vertical-align: middle; }
	.rightTop_admin_menu {  }
	.rightTop_admin_menu ul {
	  background-color:white;
	  border: solid 0.5px #e8ebed;
 	  display: none;
	  position: absolute;
	  line-height: 25px;
	  width: 110px;
	  height: 220px;
	  margin-left: -18px;
	  margin-top: 4px;
	 }
	 .rightTop_admin_menu li {
	  list-style:none;
	  position: relative;
	  display: inline-block;
	  line-height: 25px;
	  font-size: 12px;
	  color:#808080;
	  height:25px;
	 }
	 .rightTop_admin_menu a {
	  color: black;
	  display: block;
	  text-decoration: none;
	  color:#808080;
	  margin-right: 15px;
	 }
	 .rightTop_admin_menu li:hover a:hover{ color: black; }
/* ----------------------------------------- FirstRow ----------------------------------------- */
   
/* ----------------------------------------- nav ----------------------------------------- */
    #header_nav{
    padding-top: 25px; 
    padding-bottom: 8px;
    }
    #header_nav_div{
    text-align: center; 
    padding-top: 12px;
    }
    .navMenu_span{
    display: inline-block;
    }
   	.nav_menu{ height: 40px; width:350px; margin-top: -18px;}
	.nav_menu ul{ width:350px; }
	.nav_menu li{ list-style: none; display: inline-block; margin-right: 40px; }
   	.nav_menu a{ text-decoration: none; color: black; font-weight: bold; font-size: 18px; }

   	/* 나이키 로코 링크 */
	.swoosh_input{ height:40px; width:75px;}
	.swoosh_span{ float:left; height: 35px; margin-top: -5px; margin-left: 20px; }
	
	/* 검색창 */
	.search_input{ border: 1px solid #e8ebed; height: 40px; width: 220px; 
	               margin-top: -22px; text-indent:46px; font-size:14px;
	               background-image: url('/nike/image/search.png'); 
	               background-repeat: no-repeat; 
	               background-position: 15px center; }
   	.search_span{ float:right; width:220px; margin-right:40px; }
/* ----------------------------------------- nav ----------------------------------------- */
   
	/* 기본 설정 */
	#headerAll_css{ 
	border-bottom: solid 0.5px #e8ebed; 
	position: fixed;
	background-color: white;
	top: 0;
	width: 100%;
	height: 125px;
	}
	#header_firstRow{
	width: 100%; 
	height: 39px; 
	border-bottom: solid 0.5px #e8ebed;
	}
	#header_secondRow{
	margin-top: -7px;
	}
   
</style>
</head>
<body>
	<header id="headerAll_css">
		<div id="header_firstRow">
			<span>
				<div class="left_top_div">
					 <ul class="left_top">
					 	<li><a href="#"><img src="/nike/image/nike_text.png"></a></li>
					 	<li><a href="#"><img src="/nike/image/Join_Us.png"></a></li>
					 	<li><a href="#"><img src="/nike/image/Jordan.png"></a></li>
					 	<li><a href="#"><img src="/nike/image/converse.png"></a></li>
					 </ul>
				</div>
			</span>
			<c:choose>
				<c:when test = '${empty id}'>
					<span>
						<div style="float: right;">
							<ul class="rightTop_logout">
								<li style="margin-right: 15px;"><span><a href="/nike/memberJoin">회원가입</a> / <a href="loginPage">로그인</a></span></li>
								<li style="margin-right: 15px;"><a href="#">고객센터</a></li>
								<li><a href="/nike/cart"><img src="/nike/image/basket.png"></a></li>
							</ul>
						</div>
					</span>
				</c:when>
				<c:when test = "${name eq '관리자'}">
					<span>
						<div class="rightTop_admin">
							<ul class="rightTop_admin_menu">
								<li><a><img src="/nike/image/user.png"/> ${name }</a>
									<ul>
										<li style="padding-top: 18px; margin-left: -10px;"><a href="/nike/inventory" style="color:black;">상품관리</a></li>
										<li style="padding-top: 6px; margin-left: -10px;"><a href="/nike/customer_care" style="color:black;">고객관리</a></li>
										<li style="padding-top: 6px; margin-left: -10px;"><a style="color:black;">게시판관리</a>
											<ul>
												<li><a href="">Review</a></li>
												<li><a href="">Q & A</a></li>
											</ul>
										</li>
										<li style="padding-top: 6px; margin-left: -10px;"><a href="/nike/order_care" style="color:black;">주문관리</a></li>
										<li style="padding-top: 6px; margin-left: -10px;"><a href="/nike/product_management" style="color:black;">상품등록</a></li>
										<li style="padding-top: 6px; margin-left: -10px;"><a href="/nike/logout" style="color:black;">로그아웃</a></li>
									</ul>
								</li>
							</ul>
						</div>
					</span>
				</c:when>
				<c:when test = '${id ne admin }'>
					<span>
						<div class="rightTop_login">
							<ul class="rightTop_login_menu">
								<li><a><img src="/nike/image/user.png"/>${name }</a>
									<ul>
										<li style="padding-top: 18px; margin-left: -10px;"><a href="/nike/myPage" style="color:black;">마이페이지</a></li>
										<li style="padding-top: 6px; margin-left: -10px;"><a href="/nike/account" style="color:black;">회원정보관리</a></li>
										<li style="padding-top: 6px; margin-left: -10px;"><a href="/nike/logout" style="color:black;">로그아웃</a></li>
									</ul>
								</li>
								<li><a href="#">고객센터</a></li>
								<li><a href="/nike/cart"><img src="/nike/image/basket.png"></a></li>
							</ul>
						</div>
					</span>
				</c:when>
			</c:choose>	
		</div>
		<div id="header_secondRow">
			<nav id="header_nav">
				<div id="header_nav_div">
					<span class="swoosh_span">
						<input type="image" class="swoosh_input" src="/nike/image/NikeSwoosh.png" 
							   onclick="location.href='/nike/main'">
					</span>
					<span class="navMenu_span">
						<ul class="nav_menu">
							<li><a href="/nike/Men">MEN</a></li>
							<li><a href="/nike/Women">WOMEN</a></li>
							<li><a href="/nike/Kids">KIDS</a></li>
						</ul>
					</span>
					<span class="search_span">
						<input id="searchProduct" onkeypress="if( event.keyCode==13 ){goSearch()}" 
							   type="search" class="search_input" placeholder="검색">
					</span>
				</div>
			</nav>
		</div>
	</header>	
</body>
</html>