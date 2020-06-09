<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
#quickImgQ{
	width: 180px;
	vertical-align: top;
	position: relative;
	top:0px;
}
.bodyQ{
	width: 80%;
	margin: auto;
}

</style>


<script type="text/javascript">
	function chageSrc(obj) {
		var imgId = obj.id;
		var imgName = obj.src;
		imgName = imgName.toLowerCase();
		var firstName = imgName.substring(0, imgName.indexOf('.') + 1);
		var lastName = imgName.substring(imgName.indexOf('.') + 1);
		lastName = lastName.toUpperCase();
		var changeName = firstName + lastName;
		document.getElementById(imgId).src = changeName;
		console.log(changeName);
	}
	
</script>


</head>
<body>
<div class = "bodyQ">

	<h1 align="center" style="margin-top: 30px;">Q & A</h1>
	<!-- 상품 내용 -->
	<div >
		<div style="float: left; padding-right: 20px;">
			<img id="quickImgQ" src="/nike/"
				onerror="this.onerror=null; chageSrc(this)"
				onclick="location.href='/nike/productdetail?code='">
		</div>
		<table>
			<tr>
				<td><a style="text-decoration: none;"
					href="/nike/productdetail?code="></a></td>
			</tr>
			<tr>
				<td></td>
			</tr>
			<tr>
				<td>상품명 :</td>
			</tr>
			<tr>
				<td style="color: red"><b><script type="text/javascript">
										var price = 
										document.write(price.toLocaleString()+' 원');
									</script></b></td>
			</tr>
		</table>
		<hr>

	</div>
	
	<table border="1">
	<tr>
		<td>제목</td>
		<td>
		</td>
	</tr>
	<tr>
		<td>작성자</td>
		<td><input type="text" name="name"></td>
	</tr>
	<tr>
	<td colspan="2">내용</td>
	</tr>
	<tr>
	<td colspan="2"></td>
	</tr>
	</table>
	<button>답글</button>

</div>
</body>
</html>