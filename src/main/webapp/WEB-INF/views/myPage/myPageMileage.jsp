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
		/*페이지 div부분*/
		.pagingdiv{text-align: center; margin: 10px;}
		.paging{display: inline-block;}
		.paging a{
			color: black;
			float: left;
			padding: 8px 16px;
			text-decoration: none;
			transition: background-color .3s;
		}
		.paging a.active{
		background-color: black;
		color: white;
		}
		.paging a:hover:not(.active) {background-color: #ddd;}
	</style>
<meta charset="UTF-8">
<title>나이키</title>
</head>
<body>
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

		<div style="margin-top:100px;">
		<table style="border: solid 0.5px #e8ebed; width: 100%;">
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
			<div class="pagingdiv">
			<div class="paging">		
				<c:if test="${paging.startPage != 1 }">
					<a href="mileage?nowPage=${paging.startPage - 1 }&cntPerPage=${paging.cntPerPage}">이전</a>
				</c:if>
				<c:forEach begin="${paging.startPage }" end="${paging.endPage }" var="p">
					<c:choose>
						<c:when test="${p == paging.nowPage }">
							<a class="active">${p }</a>
						</c:when>
						<c:when test="${p != paging.nowPage }">
							<a href="mileage?nowPage=${p }&cntPerPage=${paging.cntPerPage}">${p }</a>
						</c:when>
					</c:choose>
				</c:forEach>
				<c:if test="${paging.endPage != paging.lastPage}">
					<a href="mileage?nowPage=${paging.endPage+1 }&cntPerPage=${paging.cntPerPage}">다음</a>
				</c:if>
			</div>
			</div>
			</div>
		</div>
	</section>
	<div style="margin-top: 240px;">
	<c:import url="/footer"/>
	</div>
</body>
</html>