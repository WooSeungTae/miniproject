<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="js/jquery-3.4.1.min.js"></script>
<script type="text/javascript">
	function genderbuttonclick(clicked_id){
		var gender = 1;
		if(clicked_id == "men"){
			gender=1;
		}else if(clicked_id == "women"){
			gender=2;
		}else if(clicked_id == "kids"){
			gender=3;
		}
		console.log(gender);
		if(document.getElementById(clicked_id).classList == 'button5'){
			document.getElementById(clicked_id).classList.add('button6');
			document.getElementById(clicked_id).classList.remove('button5');
			document.getElementById(gender).checked = true;
		}
		else{
			document.getElementById(clicked_id).classList.add('button5');
			document.getElementById(clicked_id).classList.remove('button6');
			document.getElementById(gender).checked = false;
		}
	}
	function sizebuttonclick(clicked_id){
		var gender = clicked_id+1;
		console.log(gender);
		if(document.getElementById(clicked_id).classList == 'button5'){
			document.getElementById(clicked_id).classList.add('button6');
			document.getElementById(clicked_id).classList.remove('button5');
			document.getElementById(gender).checked = true;
			size.innerHTML += "<label id='"+clicked_id+2+"'>"+clicked_id+" </label>"
			size.innerHTML += "<input id='"+clicked_id+3+"' name='size"+clicked_id+"' type='text'><br id='"+clicked_id+4+"'>"
		}
		else{
			document.getElementById(clicked_id).classList.add('button5');
			document.getElementById(clicked_id).classList.remove('button6');
			document.getElementById(gender).checked = false;
			document.getElementById('size').removeChild(document.getElementById(clicked_id+2));
			document.getElementById('size').removeChild(document.getElementById(clicked_id+3));
			document.getElementById('size').removeChild(document.getElementById(clicked_id+4));
		}
	}
	
	$(document).ready(function(){
		$("#productImg").change(function(){
			   if(this.files && this.files[0]) {
			    var reader = new FileReader;
			    reader.onload = function(data) {
			     $(".select_img img").attr("src", data.target.result).width(500);        
			    }
			    reader.readAsDataURL(this.files[0]);
			   }
			  });
	});
</script>
<style type="text/css">
	.button5 {
	  background-color: white;
	  color: black;
	  padding: 16px 32px;
	  text-align: center;
	  text-decoration: none;
	  display: inline-block;
	  font-size: 16px;
	  margin: 4px 2px;
	  transition-duration: 0.4s;
	  cursor: pointer;
	  border: 2px solid #555555;
	}
	
	.button6{
	  background-color: #555555;
	  color: white;
	  padding: 16px 32px;
	  text-align: center;
	  text-decoration: none;
	  display: inline-block;
	  font-size: 16px;
	  margin: 4px 2px;
	  transition-duration: 0.4s;
	  cursor: pointer;
	  border: 2px solid #555555;
	}
	.select_img img {margin : 20px 0;}
</style>
</head>
<body>
<h3>상품 등록</h3><hr>
<form action="product_input" enctype="multipart/form-data">
	<div>
		<label>상품 번호</label>
		<input type="text" name="code">
	</div>
	<div>
		<label>제목</label>
		<input type="text" name="codename">
	</div>
	<div>
		<label>color</label>
		<input type="text" name="codecolor">
	</div>
	<div>
		<label>수량</label>
		<input type="text">
	</div>
	<div>
		<label>분류</label>
		<select name="category">
			<option selected="selected" value="런닝화">런닝화</option>
			<option value="축구화">축구화</option>
			<option value="농구화">농구화</option>
		</select>
	</div>
	<div>
		<label>성별</label>
		<input type="button" class="button5" value="MEN" id="men" onclick="genderbuttonclick(this.id)">
		<input type="checkbox" id="1" name="men" hidden="">
		<input type="button" class="button5" value="WOMEN" id="women"  onclick="genderbuttonclick(this.id)">
		<input type="checkbox" id="2" name="women" hidden="">
		<input type="button" class="button5" value="KIDS" id="kids" onclick="genderbuttonclick(this.id)">
		<input type="checkbox" id="3" name="kids" hidden="">
	</div>
	<div>
		<label>사이즈</label><br>
		<c:forEach var="i" begin="230" end="330" step="10">
			<input type="button" class="button5" value="${i}" id="${i}" onclick="sizebuttonclick(this.id)">
			<input type="checkbox" id="${i}1" name="${i}" hidden="">
		<c:if test="${i%280 eq 0}">
			<br>
		</c:if>
		</c:forEach>
		<div  id="size">
		</div>
	</div>
	<div>
		<label for="productImg">이미지</label>
		<input type="file" id="productImg" name="file">
		<div class="select_img"><img src=""/></div>
	</div>	
	 <%=request.getRealPath("/") %>
	<div>
		<label>내용</label><br>
		<textarea rows="10" cols="50"></textarea>
	</div>
	<div><input type="submit" value="등록"></div>
</form>
</body>
</html>