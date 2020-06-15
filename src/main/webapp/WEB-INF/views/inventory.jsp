<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
	img{
		width:320px;
		height:230px;
	}
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
	.bodyinside select{width:100px; height:25px;}
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
	
	table button { width: 50px; height: 30px;}
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
	  function delete_btn(id) {
		  
			var con = confirm("정말 삭제하시겠습니까?");
			
			if(con){
				location.href="productDelete?code="+id
			}
		}
	
	
</script>
<meta charset="UTF-8">
<title>상품 관리</title>
</head>
<body>
<c:set var="size" value="${searchCode.size()}"/>
<%@include file="product_header.jsp" %>
<div class="bodyback">
<p class="maintitle">상품 관리</p>
<div class="bodyinside">
<form action="productserch">
		<select name="search_key">
			<option value="category" selected="selected">상품 종류</option>
			<option value="gender">성별</option>
			<option value="code">상품 코드</option>
			<option value="codename">상품 이름</option>
			<option value="codecolor">상품 색상</option>
		</select>
		<input type="text" name="search" > <input type="submit" value="검색">
</form>
</div>
<div class="bodyinside">
<div class="subtitle"><a>상품 목록</a></div>
<div id="outter">
	<div class="pagingoption">
		<select id="cntPerPage" name="sel" onchange="selChange()">
			<option value="5"
				<c:if test="${paging.cntPerPage == 5}">selected</c:if>>5줄 보기</option>
			<option value="10"
				<c:if test="${paging.cntPerPage == 10}">selected</c:if>>10줄 보기</option>
			<option value="15"
				<c:if test="${paging.cntPerPage == 15}">selected</c:if>>15줄 보기</option>
			<option value="20"
				<c:if test="${paging.cntPerPage == 20}">selected</c:if>>20줄 보기</option>
		</select>
	</div> <!-- 옵션선택 끝 -->
	 <table class="membertable" >
		<tr class="tablehead">
		<th>등록 날짜</th><th>상품 대표사진</th><th>상품 코드</th>
		<th>상품 이름</th><th>상품 색</th><th>상품 종류</th>
		<th>상품 가격</th><th>성별</th>
		<th>수정</th><th>삭제</th></tr>
		<c:choose>
			<c:when test="${size ne 0}">
				<c:forEach items="${searchCode }" var="dto">
				<tr align="center"><td>${dto.joindate}</td><td><img src="${dto.image1}" id="${dto.code }"onerror="this.onerror=null; chageSrc(this)"></td><td>${dto.code}</td>
				<td>${dto.codename}</td><td>${dto.codecolor}</td><td>${dto.category}</td>
				<td>${dto.price}</td><td>${dto.gender}</td>
				<td><button onclick="location.href='productview?code=${dto.code}'">수정</button></td>
				<td><button id="${dto.code}" onclick="delete_btn(this.id)">삭제</button></td></tr>
				</c:forEach>
			</c:when>
			<c:otherwise>
				<tr align="center"><th colspan="11">등록된 정보가 없습니다</th></tr>
			</c:otherwise>
		</c:choose>
	</table>
	<div class="pagingdiv">
	<div class="paging">		
		<c:if test="${paging.startPage != 1 }">
			<a href="inventory?nowPage=${paging.startPage - 1 }&cntPerPage=${paging.cntPerPage}">이전</a>
		</c:if>
		<c:forEach begin="${paging.startPage }" end="${paging.endPage }" var="p">
			<c:choose>
				<c:when test="${p == paging.nowPage }">
					<a class="active">${p }</a>
				</c:when>
				<c:when test="${p != paging.nowPage }">
					<a href="inventory?nowPage=${p }&cntPerPage=${paging.cntPerPage}">${p }</a>
				</c:when>
			</c:choose>
		</c:forEach>
		<c:if test="${paging.endPage != paging.lastPage}">
			<a href="inventory?nowPage=${paging.endPage+1 }&cntPerPage=${paging.cntPerPage}">다음</a>
		</c:if>
	</div>
	</div>
</div>
</div>
</div>
</body>
</html>