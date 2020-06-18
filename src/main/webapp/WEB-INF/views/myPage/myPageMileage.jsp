<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
	<style>
		.wrapper{
			font-family:"Noto Sans KR", "Malgun Gothic", "MalgunGothic" "Dotum", Helvetica, Arial, sans-serif;
			color:#111;
			height:550px;
			margin-top:150px;
		}
		.milecontent{
			border-radius:2px; height:20px; width:70%; background-color: #F5F5F5; padding: 25px 20px; border:1px solid #dedfda;
		}
		.mile{
			float:left; font-size:15px; margin-left: 10px;
		}
		.reserveMile{
			float:right; font-size:15px; margin-right:20px;
		}
		.order_hr {
		border: solid 0.5px #e8ebed;
	}
		.order_text {
			font-size: 11.5px;
			font-weight: bold;
			margin-bottom: 15px;
		}
		.order_a {
		text-decoration:none; 
		color:black;
		}
		.order_img{
			width: 150px;
			height: 135px;
		}
	
		td, th{
			font-size: 11px;
		}
		td{
			padding: 15px 0;
		    text-align: center;
		    vertical-align: middle;
		    word-wrap: break-word;
		    border-top: 1px solid #e8e8e8;
		}
		th{
			padding: 10px 0;
		    font-weight: normal;
		    vertical-align: middle;
		}
		.orderDate a{
			color:#2E2E2E;
		}
		.delivery{
			color:#b22222;
		}
		.orderSize{
			color:#848484;
			margin-top: 5px;
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
				<span class="reserveMile"><label class="milelabel">${mile }</label>MiLE</span>
			</div>	

		<div style="margin-top:100px;">
		<table style="border: solid 0.5px #e8ebed; width: 70%;">
			<!-- 테이블 th(제목) 고정 부분 -->
				<thead>
					<tr class="order_th">
						<th>날짜</th>
						<th>내용</th>
						<th>적립금</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${milelist }" var="mile">
					<tr>
						<td class="orderDate">
							<fmt:formatDate value="${mile.savedate }" pattern="yyyy.MM.dd"/>
						</td>
						<td class="count">${mile.savereason }</td>
						<td>
							<p class="delivery">${mile.savemileage}</p>
						</td>
					</tr>
					</c:forEach>
				</tbody>
			</table>
			</div>
		</div>
	</section>
	<footer>
		<c:import url="/footer">
		</c:import>
	</footer>
</body>
</html>