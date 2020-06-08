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
		location.href="customer_care?nowPage=${paging.nowPage}&cntPerPage="+sel;
	}
</script>
<meta charset="UTF-8">
<title>고객관리</title>
</head>
<body>
<c:set var="size" value="${viewAll.size()}"/>
<%@include file="product_header.jsp" %>
<div class="bodyback">
<p class="maintitle">고객관리</p>
<div class="bodyinside">
<form action="memberserch">
<label>검색할 아이디</label>
<input type="text" name="id"> <input type="submit" value="검색">
</form>
</div>
<div class="bodyinside">
<div class="subtitle"><a>회원 목록</a></div>
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
<!-- 참고 홈페이지 https://ecsupport.cafe24.com/article/%EC%87%BC%ED%95%91%EB%AA%B0-%EC%A3%BC%EC%9A%94-%EA%B8%B0%EB%8A%A5/12/2026/?page= -->
	 <table class="membertable" >
		<tr class="tablehead"><th>아이디</th><th>이름</th><th>주소</th><th>성별</th><th>생년월일</th><th>전화번호</th><th>삭제</th></tr>
		<c:choose>
			<c:when test="${size ne 0}">
				<c:forEach items="${viewAll }" var="dto">
				<tr align="center"><td>${dto.id}</td><td>${dto.name}</td><td>${dto.address}</td>
				<td>${dto.gender}</td><td>${dto.birth}</td><td>${dto.tel}</td>
				<td><a href="memberdelete?id=${dto.id}"><input type="button" value="삭제"></a></td></tr>
				</c:forEach>
			</c:when>
			<c:otherwise>
				<tr align="center"><th colspan="14">등록된 정보가 없습니다</th></tr>
			</c:otherwise>
		</c:choose>
	</table>
	<div class="pagingdiv">
	<div class="paging">		
		<c:if test="${paging.startPage != 1 }">
			<a href="customer_care?nowPage=${paging.startPage - 1 }&cntPerPage=${paging.cntPerPage}">이전</a>
		</c:if>
		<c:forEach begin="${paging.startPage }" end="${paging.endPage }" var="p">
			<c:choose>
				<c:when test="${p == paging.nowPage }">
					<a class="active">${p }</a>
				</c:when>
				<c:when test="${p != paging.nowPage }">
					<a href="customer_care?nowPage=${p }&cntPerPage=${paging.cntPerPage}">${p }</a>
				</c:when>
			</c:choose>
		</c:forEach>
		<c:if test="${paging.endPage != paging.lastPage}">
			<a href="customer_care?nowPage=${paging.endPage+1 }&cntPerPage=${paging.cntPerPage}">다음</a>
		</c:if>
	</div>
	</div>
</div>
</div>
</div>
</body>
</html>