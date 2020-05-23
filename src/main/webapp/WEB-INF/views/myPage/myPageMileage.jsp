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
			height:20px; width:70%; background-color: #F5F5F5; padding: 25px 20px; border:1px solid #dedfda;
		}
		.mile{
			float:left; font-size:15px; margin-left: 10px;
		}
		.reserveMile{
			float:right; font-size:15px; margin-right:20px;
		}
	</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<header>
		<c:import url="/header">
		</c:import>
	</header>
	<section class="wrapper">
		<aside>
			<c:import url="/aside">
			</c:import>
		</aside>
		<div style="width: 75%; margin: auto; padding-top: 80px; float:right;">	
			<h2>MiLE 현황</h2>
			<div class="milecontent">
				<span class="mile">현재 보유 MiLE</span> 
				<span class="reserveMile"><label class="milelabel"></label>MiLE</span>
			</div>	
		</div>
	</section>
	<footer>
		<c:import url="/footer">
		</c:import>
	</footer>
</body>
</html>