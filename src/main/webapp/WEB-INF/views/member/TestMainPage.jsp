<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function loginPopup() {
		var url = "loginPage";
		var name = "popup test";
		var option = "width = 500, height = 500, left = 200, location = no";
		window.open(url, name, option);
	}
</script>
</head>
<body>테스트 메인 페이지 <br>
	<a href="javascript:loginPopup()">로그인
</body>
</html>