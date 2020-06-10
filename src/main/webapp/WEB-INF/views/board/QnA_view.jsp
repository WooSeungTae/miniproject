<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">

/*view 전체 바디 설정*/
.bodyQ{
	width: 80%;
	margin: auto;
}
/*Q & A  and review 테이블 설정*/
.qaview tr{
	text-align: left;
	vertical-align: middle;
	padding-top: 30px;
	padding-bottom: 30px;

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
	<!-- 상품 내용 -->
	<div >
		<div>
		<table  class="qaview" style="margin-top: 20px; ">
			<tr>
				<td><a style="text-decoration: none;"
					href="/nike/productdetail?code=${param.code}">상품명 : ${param.codename } </a></td>
			</tr>
			<tr>
				<td>상품 코드 : ${param.code }
			</tr>			
			<tr>
				<td style="color: red"><b><script type="text/javascript">
										var price =${param.price}
										document.write(price.toLocaleString()+' 원');
									</script></b></td>
			</tr>
		</table>
		</div>
		<hr color="#ddd" >

	</div>
	
	<table  class="qaview" style="width: 100%; margin: auto;">
	<tr>
	<td colspan="2">${param.content }</td>
	</tr>
	<tr>
	<td colspan="2"><hr color="#ddd" ></td>
	</tr>
	<tr>
	<td></td><td align="right"><button>답글</button><button>수정</button></td>
	</tr>
	</table>

</div>
</body>
</html>