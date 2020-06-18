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
	padding: 10px;
	margin: 10px;
	}
	
/*==============================*/	
/*상품 내용*/
.qnaproduct tr td{
	padding: 10px;
	margin: 10px;
	font-weight: bolder;
	
}

/*상단 이미지*/	
#quickImgQ{
	width: 250px;
	vertical-align: top;
	position: relative;
	top:0px;
}
/*Q&A크기*/
.bodyQ{
	width: 65%;
	margin: auto;
	margin-top: 220px;
}
/*input 창*/
.bordertableqa input{height: 15px; width: 330px; margin: 10px; padding: 10px;}
/*textarea 창*/
.qnatxtcss{
	resize: none;
	width: 98%;
	height: auto;
	padding: 10px;
	margin: 10px;
	border: none;
}

/*버튼*/
#viewbutton{
  background-color: #e9e9e9; /* Green */
  border: none;
  color: black;
  padding: 8px 24px;
  text-align: center;
  text-decoration: none;
  font-size: 16px;
  font-weight : 900;
  border-radius: 8px;
 
}
	/*비로그인 회원 등록 버튼 없음*/
	.submitrelpy{
	background-color: #e9e9e9; 
	color: black; 
	font-size:20px;
	font-weight: bold;
	text-align: center; 
	padding: 15px;
	width: 98%;
	height: 35px;
	vertical-align: middle;

	}
	/*선택박스 css*/
	.selectcss{
	width: 25%; /* 원하는 너비설정 */
    font-family: inherit;  /* 폰트 상속 */
    background: no-repeat 95% 50%; /* 네이티브 화살표를 커스텀 화살표로 대체 */
    border: 1px solid #999;
    border-radius: 0px; /* iOS 둥근모서리 제거 */
    -webkit-appearance: none; /* 네이티브 외형 감추기 */
    -moz-appearance: none;
    appearance: none;
	padding: 10px;
	margin: 10px;


	}


</style>

<script type="text/javascript" src="js/jquery-3.4.1.min.js"></script>
<script type="text/javascript" src="js/jquery-1.11.3.min.js"></script>
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
	
	function idcheck(){
		var sessionId = '${sessionScope.id}';
		var writeId = '${qnaview.id}';
		var check = document.getElementById("readonlycheck");
		console.log(sessionId==writeId);
		if(!sessionId)$('#readonlycheck').prop('readOnly',true); //설정
		if(sessionId!=writeId){
			$('#readonlycheck').prop('readOnly',true); //설정
		}else{
			$('#readonlycheck').prop('readOnly',false); //해제 
		}
		
	}	
	
	/*textarea 내용물 높이 맞추기*/
	function resize(obj) {
	  obj.style.height = "1px";
	  obj.style.height = (12+obj.scrollHeight)+"px";
	}
</script>


</head>
<body onload='list()'>

<c:import url="/header"></c:import>
<div class = "bodyQ">
	<form action="">
	<h1 align="center" style="margin-top: 20px;">Q & A</h1><br>
	<!-- 상품 내용 -->
	<div>
	<table class='qnaproduct'>
	<tr><td rowspan="5"><img id="quickImgQ" src="/nike/${quickProduct.image1 }"
			onerror="this.onerror=null; chageSrc(this)"
			onclick="location.href='/nike/productdetail?code=${quickProduct.code }'"></td><td>상품명</td>
	<td>
	<a style="text-decoration: none;"
	href="/nike/productdetail?code=CD4373-001"> : ${quickProduct.codename } </a><br></td></tr>
	<tr><td>상품코드</td><td> : ${quickProduct.code }</td></tr>
	<input type="hidden" name = "code" value='${quickProduct.code }'>
	<input type="hidden" name = "codename" value='${quickProduct.codename }'>
	<tr><td>상품컬러</td><td> : ${quickProduct.codecolor }</td></tr>
	<tr><td>금액</td><td> : <script type="text/javascript">
										var price = ${quickProduct.price };
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
		<select class='selectcss' name="titlelist" style="width: 15%; min-width: 50px;">
			<option value ="상품문의">상품문의</option>
			<option value ="배송문의">배송문의</option>
			<option value ="입금확인문의">입금확인문의</option>
			<option value ="기타문의">기타문의</option>	
		</select>
		<input id="readonlycheck" type="text" name="title" style="width: 97%; min-width: 500px;" >
		</td>
	</tr>
	<tr>
		<th>작성자</th>
		<td><input type="text" readOnly name="name" style="width: 97%;" value="${sessionScope.name }" >
		<input type="hidden"  name="id" style="width: 97%;" value="${sessionScope.id }">
		<input type="hidden"  name="writer" style="width: 97%;" value="${sessionScope.name }">
		</td>
			</tr>
	<tr><th>내용</th><td>
	<textarea class='qnatxtcss' id="readonlycheck" name = "content" style="width: 97%;" rows="10" cols="" onkeydown="resize(this)" onkeyup="resize(this)" >${qnaview. content}</textarea>
	</td>
	</tr>
	</table>
	</div><br>
	<c:if test="${sessionScope.id!=null}"><div align="right"><input id='viewbutton' type="submit" value ="등록하기" formaction="/nike/qaregister"> <input id='viewbutton' type="button" value ="목록으로" onclick="window.history.back()"></div></c:if>
	<c:if test="${sessionScope.id==null}"><div class='submitrelpy'>로그인 한 사용자만 Q & A 등록이 가능합니다.</div></c:if>
	</form><br><br>

</div>
</body>
</html>