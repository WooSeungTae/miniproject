<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
	/*회원 목록 테이블에 나타난 회원정보 테이블모양*/
	.membertable {
		width : 100%;
		border-top : 1px solid #d2d2d2;
		border-collapse: collapse;
	}
	.membertable th,td{
		border-bottom : 1px solid #d2d2d2;
		padding: 10px;
	}
	/*회원 목록 테이블 맨윗부분 적용 부분*/
	.tablehead { color: white; background:#c8c8c8; font-family: monospace; 
				font-size: 20px;}
	/*회원 목록 테이블 정보 부분*/
	.tablemain { font-family: monospace; font-size: 20px;}
	/*맨 위에 있는 제목*/
	.maintitle {font-family: monospace; font-size: 30px; font-weight: bold; }
	/*안에 있는 제목*/
	.subtitle {font-size: 20px; margin: 20px; }
	/*body전체 부분(배경)*/
	.bodyback {padding: 20px;}
	/*안에 있는 div부분*/
	.bodyinside {background: white; padding: 10px; margin-top:20px; 
				height: 50%; border: 2px solid #d2d2d2;}
	/*페이징 옵션*/
	.pagingoption{float: right;margin: 10px;}
	.pagingoption select{
		width: 150px;
		height: 30px;
		border: 3px;
		border-radius: 4px;
		background-color: #c8c8c8;
		color: white;
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
<script>
	function selChange() {
		var sel = document.getElementById('cntPerPage').value;
		location.href="inventory?nowPage=${paging.nowPage}&cntPerPage="+sel;
	}
	function chageSrc(obj) {
		var imgId = obj.id;
		var imgName = obj.src;
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
<c:set var="date" value="${viewAll.orderDate}"/>
<%@include file="product_header.jsp" %>
<div class="bodyback">
<p class="maintitle">상품 관리</p>
<div class="bodyinside">
<form action="productserch">
<label>검색할 상품명</label>
<input type="text" name="codename"> <input type="submit" value="검색">
</form>
</div>
<div class="bodyinside">
<div class="subtitle"><a>상품 목록</a></div>
<div id="outter">
	 <table class="membertable" >
		<tr class="tablehead">
		<th>등록 날짜</th><th>상품 대표사진</th><th>상품 코드</th>
		<th>상품 이름</th><th>상품 색</th><th>상품 종류</th>
		<th>상품 가격</th><th>상품 내용</th><th>성별</th>
		<th>수정</th><th>삭제</th></tr>
		<c:choose>
			<c:when test="${not empty date}">
				<tr align="center"><td>${viewAll.joindate}</td><td><img src="${viewAll.image1}" id="${viewAll.code }"onerror="this.onerror=null; chageSrc(this)"></td><td>${viewAll.code}</td>
				<td>${viewAll.codename}</td><td>${viewAll.codecolor}</td><td>${viewAll.category}</td>
				<td>${viewAll.price}</td><td>${viewAll.contents}</td><td>${viewAll.gender}</td>
				<td><a href="productUpdate?code=${viewAll.code}"><input type="button" value="수정"></a></td>
				<td><a href="productDelete?code=${viewAll.code}"><input type="button" value="삭제"></a></td></tr>
			</c:when>
			<c:otherwise>
				<tr align="center"><th colspan="11">등록된 정보가 없습니다</th></tr>
			</c:otherwise>
		</c:choose>
	</table>
</div>
</div>
</div>
</body>
</html>