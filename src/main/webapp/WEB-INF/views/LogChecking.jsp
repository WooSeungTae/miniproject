<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<c:if test="${sessionScope.id==null}">
	<script>
		alert("로그인 하여 주시기 바랍니다.");
		location.href="/nike/loginPage";
	</script>
</c:if>

</body>
</html>