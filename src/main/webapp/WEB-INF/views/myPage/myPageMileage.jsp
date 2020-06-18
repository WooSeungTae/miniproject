<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
	<style>
		.wrapper{
			font-family:"Noto Sans KR", "Malgun Gothic", "MalgunGothic" "Dotum", Helvetica, Arial, sans-serif;
			color:#111;
			height:550px;
		}
		.milecontent{
			border-radius:2px; 
			height:20px; 
			width:100%; 
			background-color: #F5F5F5; 
			padding: 25px 20px; 
			border:1px solid #dedfda;
		}
		.mile{
			float:left; 
			font-size:14px; 
			margin-left: 10px;
		}
		.reserveMile{
			float:right; 
			font-size:14px; 
			margin-right:20px;
		}
		.detail_div{
			width:70%;
			float:left;
		}
		.wrap{
			margin-left: 15%;
			margin-right: 10%;
			margin-top: 160px;
		}
		.milelabel{
			color:#fa5400;
    		font-size: 16px;
		}
	</style>
<meta charset="UTF-8">
<title>나이키</title>
</head>
<body>
<<<<<<< HEAD
	<c:import url="/header"/>
	<section class="wrapper">
		<div class="wrap">
		<c:import url="/aside"/>
			<div class="detail_div">
				<h2>MiLE 현황</h2>
				<div class="milecontent">
					<span class="mile">현재 보유 MiLE</span> 
					<span class="reserveMile"><label class="milelabel">${mile } </label>MiLE</span>
				</div>	
			</div>
=======
	<header>
		<c:import url="/header">
		</c:import>
	</header>
	<section class="wrapper" style="margin-top: 60px;">
		<aside>
			<c:import url="/aside">
			</c:import>
		</aside>
		<div style="width: 75%; margin: auto; padding-top: 80px; float:right;">	
			<h2>MiLE 현황</h2>
			<div class="milecontent">
				<span class="mile">현재 보유 MiLE</span> 
				<span class="reserveMile"><label class="milelabel">${mile }</label>MiLE</span>
			</div>	
>>>>>>> 21fad485ed6e1a763c3734e0bedf0115caec31fa
		</div>
	</section>
	<div style="margin-top: 240px;">
	<c:import url="/footer"/>
	</div>
</body>
</html>