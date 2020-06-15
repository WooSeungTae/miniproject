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
		if(sessionId==writeId){
			$('#readonlycheck').attr('readonly', false); //해제 
		}else{
			$('#readonlycheck').attr('readonly', true); //설정
		}
		
	function ajax_qacomment(){
		var form = {
				indexnum : '${param.indexnum}'		
		}
		
		$.ajax({
			url : "qnaview",
			type : "POST",
			data :form,
			success : function(result){
				let html = "";
				for(var i=0;i<result.length;i++){
					html+="<h3>작성자 : "+result[i].writer +"</h3>&nbsp;&nbsp; 작성일 : "+result[i].reg_date+"</h3>"+
					"<h3>"+result[i].content +"</h3><hr><br>"
				}
			$('.replycontent').html(html);
			},
			error : function() {
				alert("문제가 발생 했습니다!!");
			}
		});
	}

	}	
</script>


</head>
<body onload='idcheck();ajax_qacomment()'>

<c:import url="/header"></c:import>
<div class = "bodyQ">
	<form action="">
	<h1 align="center" style="margin-top: 20px;">Q & A</h1><br>
	<!-- 상품 내용 -->
	<div>
	<table>
	<tr><td rowspan="5"><img id="quickImgQ" src="/nike/${quickProduct.image1 }"
			onerror="this.onerror=null; chageSrc(this)"
			onclick="location.href='/nike/productdetail?code=${quickProduct.code }'"></td><td>상품명</td>
	<td>
	<a style="text-decoration: none;"
	href="/nike/productdetail?code=CD4373-001"> : ${quickProduct.codename } </a><br></td></tr>
	<tr><td>상품코드</td><td> : ${quickProduct.code }</td></tr>
	<tr><td>상품컬러</td><td> : ${quickProduct.codecolor }</td></tr>
	<tr><td></td><td></td></tr>
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
		<input type="text" name="titlelist" style="width: 15%; min-width: 50px;" value="${qnaview.titlelist }" >
		<input id="readonlycheck" readonly type="text" name="title" style="width: 80%; min-width: 500px;" value="${qnaview.title }"  >
		</td>
	</tr>
	<tr>
		<th>작성자</th>
		<td><input id="readonlycheck" type="text" name="name" style="width: 99%;" value="${qnaview.name }" >
		<input type="hidden" readonly name="id" style="width: 99%;" value="${qnaview.id }">
		<input type="hidden" readonly name="indexnum" style="width: 99%;" value="${qnaview.indexnum }">
		</td>
			</tr>
	<tr><th>내용</th><td><textarea id="readonlycheck" readonly name = "content" style="width: 99%;" rows="25" cols=""  >${qnaview. content}</textarea></td></tr>
	</table>
	</div>
	<div align="right">
	<c:if test="${sessionScope.id==qnaview.id }"><input type="submit" value ="삭제" formaction="/nike/qadelete">  <input type="submit" value ="수정" formaction="/nike/qaupdate"></c:if>  
	<input type="button" value ="목록으로" onclick="location.href='window.history.back()'">
	</div> 
	</form><br><br>
	<c:import url="/reply"></c:import>
	<div class="replycontent"></div>
</div>
</body>
</html>