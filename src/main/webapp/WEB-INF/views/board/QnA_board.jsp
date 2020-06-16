<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
	.membertable a{
		text-decoration: none;
		color: black;
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
	.bodyback {margin-top:150px; padding: 20px;}
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
</style>
<script>
	function selChange() {
		var sel = document.getElementById('cntPerPage').value;
		location.href="QnA_board?nowPage=${paging.nowPage}&cntPerPage="+sel;
	}
</script>
<meta charset="UTF-8">
<title>Q & A</title>
</head>
<body>
<c:set var="size" value="${viewAll.size()}"/>
<c:import url="/header"></c:import>
<div class="bodyback">
<p align="center" class="maintitle">Q & A</p>
<div class="bodyinside">
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
	</div>
	 <table class="membertable" >
		<tr class="tablehead"><th>번호</th><th>상품 정보</th><th>카테고리</th><th style="width: 500px;">제목</th><th>작성자</th><th>작성일</th></tr>
		<c:choose>
			<c:when test="${size ne 0}">
				<c:forEach items="${viewAll }" var="dto">
				<tr align="center"><td>${dto.indexnum}</td><td><a href="productdetail?code=${dto.code}">${dto.code}<br>${dto.codename}</a></td><td>${dto.titlelist}</td>
				<td><a href="qnaview?code=${dto.code}&indexnum=${dto.indexnum}">${dto.title}</a></td><td>${dto.name }</td><td>${dto.writeDate}</td></tr>
				</c:forEach>
			</c:when>
			<c:otherwise>
				<tr align="center"><th colspan="6">등록된 정보가 없습니다</th></tr>
			</c:otherwise>
		</c:choose>
	</table>
	<div class="pagingdiv">
	<div class="paging">		
		<c:if test="${paging.startPage != 1 }">
			<a href="QnA_board?nowPage=${paging.startPage - 1 }&cntPerPage=${paging.cntPerPage}">이전</a>
		</c:if>
		<c:forEach begin="${paging.startPage }" end="${paging.endPage }" var="p">
			<c:choose>
				<c:when test="${p == paging.nowPage }">
					<a class="active">${p }</a>
				</c:when>
				<c:when test="${p != paging.nowPage }">
					<a href="QnA_board?nowPage=${p }&cntPerPage=${paging.cntPerPage}">${p }</a>
				</c:when>
			</c:choose>
		</c:forEach>
		<c:if test="${paging.endPage != paging.lastPage}">
			<a href="QnA_board?nowPage=${paging.endPage+1 }&cntPerPage=${paging.cntPerPage}">다음</a>
		</c:if>
	</div>
	</div>
	<div class="bodyinside">
		<form action="searchQnA">
		<select name="search_key">
			<option value="title" selected="selected">제목</option>
			<option value="name">이름</option>
			<option value="id">id</option>
			<option value="code">상품 번호</option>
			<option value="codename">상품 이름</option>
		</select>
		<input type="text" name="search"> <input type="submit" value="검색">
		</form>
	</div>
</div>
</div>
</div>
<c:import url="/footer"></c:import>
</body>
</html>