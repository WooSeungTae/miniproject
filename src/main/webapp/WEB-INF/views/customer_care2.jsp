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
	/*회원 목록 테이블 맨윗부분 적용 부분*/
	.tablehead { color: white; background:#c8c8c8; font-family: monospace; 
				font-size: 20px;}
	/*회원 목록 테이블 정보 부분*/
	.tablemain { font-family: monospace; font-size: 20px;}
	/*맨 위에 있는 제목*/
	.maintitle {font-family: monospace; font-size: 30px; font-weight: bold;}
	/*안에 있는 제목*/
	.subtitle {font-size: 20px; margin: 20px; }
	/*body전체 부분(배경)*/
	.bodyback {padding: 20px;}
	/*안에 있는 div부분*/
	.bodyinside {background: white; padding: 10px; margin-top:20px; 
				height: 50%; border: 2px solid #d2d2d2;}
</style>
<meta charset="UTF-8">
<title>고객관리</title>
</head>
<body>
<c:set var="userid" value="${memberlist.id}"/>
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
<!-- 참고 홈페이지 https://ecsupport.cafe24.com/article/%EC%87%BC%ED%95%91%EB%AA%B0-%EC%A3%BC%EC%9A%94-%EA%B8%B0%EB%8A%A5/12/2026/?page= -->
<table class="membertable" >
	<tr class="tablehead"><th>아이디</th><th>이름</th><th>주소</th><th>성별</th><th>생년월일</th><th>전화번호</th><th>삭제</th></tr>
	<c:choose>
		<c:when test="${not empty userid}">
			<tr align="center"><td>${memberlist.id}</td><td>${memberlist.name}</td><td>${memberlist.address}</td>
				<td>${memberlist.gender}</td><td>${memberlist.birth}</td><td>${memberlist.tel}</td>
				<td><a href="memberdelete?id=${memberlist.id}"><input type="button" value="삭제"></a></td>
			</tr>
		</c:when>
		<c:otherwise>
			<tr align="center"><td colspan="7">등록된 정보가 없습니다</td></tr>
		</c:otherwise>
	</c:choose>
</table>
</div>
</div>
</body>
</html>