<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">

/*q&a 테이블 */
.bordertableqa {
	margin: auto;
	width: 80%;
	min-width: 800px;
	border-top: 1px solid #ddd;
	border-collapse: collapse;
}

.bordertableqa tr {
	border-bottom: 1px solid #ddd;
	height: 20px;
}
#quickImgQ{
	width: 180px;
	vertical-align: top;
	position: relative;
	top:0px;
}
.bodyQ{
	width: 65%;
	margin: auto;
	margin-top: 220px;
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

<c:import url="/header"></c:import>
<div class = "bodyQ">
	<form action="">
	<h1 align="center" style="margin-top: 20px;">Q & A</h1><br>
	<!-- 상품 내용 -->
	<div>
	<table>
	<tr><td rowspan="5"><img id="quickImgQ" src="/nike/image/pd1-1.png"
			onerror="this.onerror=null; chageSrc(this)"
			onclick="location.href='/nike/productdetail?code=CD4373-001'"></td><td>상품명</td>
	<td>
	<a style="text-decoration: none;"
	href="/nike/productdetail?code=CD4373-001"> : 나이키 리액트 비전 Men </a><br>
	<input type="hidden" name= "codename" value="나이키 리액트 비전 Men"></td></tr>
	<tr><td>상품코드</td><td> : CD4373-001<input type="hidden" name= "code" value="CD4373-001"></td></tr>
	<tr><td>상품컬러</td><td> : 라이트 크림/토탈 오렌지/테라 블러쉬</td></tr>
	<tr><td></td><td></td></tr>
	<tr><td>금액</td><td> : <script type="text/javascript">
										var price = 178000;
										document.write(price.toLocaleString()+' 원');
									</script></td></tr>
	</table>
	</div>
	<br>
	<div style="position: relative;">
	<table class = "bordertableqa" style="margin: auto; width: 100%;">
	<tr>
		<th>제목</th>
		<td style="vertical-align: middle;">
		<select name="titlelist" style="width: 15%; min-width: 50px;">
			<option value ="상품문의">상품문의</option>
			<option value ="배송문의">배송문의</option>
			<option value ="입금확인문의">입금확인문의</option>
			<option value ="기타문의">기타문의</option>	
		</select>
		<input type="text" name="title" style="width: 80%; min-width: 500px;">
		</td>
	</tr>
	<tr>
		<th>작성자</th>
		<td><input type="text" name="name" style="width: 99%;" value="">
		<input type="hidden" name="id" style="width: 99%;" value="${sessionScope.id }">
		</td>
			</tr>
	<tr><th>내용</th><td><textarea name = "content" style="width: 99%;" rows="25" cols=""></textarea></td></tr>
	</table>
	</div>
	<div align="right"><input type="submit" value ="등록" formaction="/nike/qaregister"> <input type="button" value ="목록으로" onclick="location.href='window.history.back()'"> 
	</form>
	</div>
</body>
</html>