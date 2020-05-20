<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h3>상품 등록</h3><hr>
<form action="">
	<div>
		<label>상품 번호</label>
		<input type="text">
	</div>
	<div>
		<label>제목</label>
		<input type="text">
	</div>
	<div>
		<label>color</label>
		<select>
				<option>화이트</option>
				<option>블랙</option>
				<option>레드</option>
				<option>블루</option>
				<option>초록</option>
				<option>노랑</option>
				<option>보라</option>
				<option>주황</option>
		</select> 
	</div>
	<div>
		<label>수량</label>
		<input type="text">
	</div>
	<div>
		<label>분류</label>
		<select>
			<option>MAN</option>
			<option>WOMAN</option>
			<option>KIDS</option>
		</select>
		<select>
			<option>런닝화</option>
			<option>축구화</option>
			<option>농구화</option>
			<option>런닝화</option>
		</select>
	</div>
	<div>
		<label>성별</label>
		<input type="radio" name="gender">남자 
		<input type="radio" name="gender">여자
	</div>
	<div>
		<label>사이즈</label><br>
		<c:forEach var="i" begin="230" end="330" step="5">
			<input type="checkbox">${i}
		<c:if test="${i%25 eq 0}">
			<br>
		</c:if>
		</c:forEach>
	</div>
	<div>
		<label>이미지</label>
		<input type="file">
		<img alt="" src="">
	</div>	
	<div>
		<label>내용</label><br>
		<textarea rows="10" cols="50"></textarea>
	</div>
	<div><input type="submit" value="등록"></div>
</form>
</body>
</html>