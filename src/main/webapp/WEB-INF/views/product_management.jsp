<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품등록</title>
<script type="text/javascript" src="js/jquery-3.4.1.min.js"></script>
<script type="text/javascript">
	<!-- 등록에서 안누르고 넘겼을때 처리 -->
	function checkcode(){
		if(!document.product.code.value){
			document.product.code.focus();
			alert("상품 번호를 입력하세요.");	
			return false;
		}
		if(!document.product.codename.value){
			document.product.codename.focus();
			alert("제목를 입력하세요.");	
			return false;
		}
		if(!document.product.codecolor.value){
			document.product.codecolor.focus();
			alert("색상을 입력하세요.");	
			return false;
		}
		if(!document.product.price.value){
			document.product.price.focus();
			alert("가격을 입력하세요.");	
			return false;
		}
		if(!document.product.image1.value){
			alert("첫번째 이미지를 넣어주세요.");	
			return false;
		}
		if(!document.product.contents.value){
			document.product.contents.focus();
			alert("내용을 입력하세요.");	
			return false;
		}
		
	}
	
	<!-- 버튼을 누를경우  해당 버튼 색이 변하는 기능 -->
	function genderbuttonclick(clicked_id){
		if(document.getElementById('men').classList == 'button6' && clicked_id == "kids"){
			document.getElementById('men').classList.add('button5');
			document.getElementById('men').classList.remove('button6');
			document.getElementById(1).checked = false;
		}
		if(document.getElementById('women').classList == 'button6' && clicked_id == "kids"){
			document.getElementById('women').classList.add('button5');
			document.getElementById('women').classList.remove('button6');
			document.getElementById(2).checked = false;
		}
		if(document.getElementById('kids').classList == 'button6' && (clicked_id == "men" || clicked_id == "women")){
			document.getElementById('kids').classList.add('button5');
			document.getElementById('kids').classList.remove('button6');
			document.getElementById(3).checked = false;
		}
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
	<!-- 버튼을 누를경우  해당 버튼 색이 변하는 기능 -->
	
	function sizebuttonclick(clicked_id){
		var gender = clicked_id+1;
		if(document.getElementById(clicked_id).classList == 'button5'){
			document.getElementById(clicked_id).classList.add('button6');
			document.getElementById(clicked_id).classList.remove('button5');
			document.getElementById(gender).checked = true;
			size.innerHTML += "<label class='subtitle' id='"+clicked_id+2+"'>"+clicked_id+" 사이즈 수량</label>"
			size.innerHTML += "<input onKeyPress='return numkeyCheck(event)' id='"+clicked_id+3+"' name='size"+clicked_id+"' type='text'><br id='"+clicked_id+4+"'>"
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

	<!-- 이미지 삽입시 삽입한 이미지로 바뀜 -->
	
	$(document).ready(function(){
		$("#productImg1").change(function(){
			   if(this.files && this.files[0]) {
			    var reader = new FileReader;
			    reader.onload = function(data) {
			     $(".select_img1 img").attr("src", data.target.result);        
			     $("#image1").val('image1');
			    }
			    reader.readAsDataURL(this.files[0]);
			   }
			  });
	});
	$(document).ready(function(){
		$("#productImg2").change(function(){
			   if(this.files && this.files[0]) {
			    var reader = new FileReader;
			    reader.onload = function(data) {
			     $(".select_img2 img").attr("src", data.target.result);        
			     $("#image2").val('image2');        
			    }
			    reader.readAsDataURL(this.files[0]);
			   }
			  });
	});
	$(document).ready(function(){
		$("#productImg3").change(function(){
			   if(this.files && this.files[0]) {
			    var reader = new FileReader;
			    reader.onload = function(data) {
			     $(".select_img3 img").attr("src", data.target.result);        
			     $("#image3").val('image3');       
			    }
			    reader.readAsDataURL(this.files[0]);
			   }
			  });
	});
	$(document).ready(function(){
		$("#productImg4").change(function(){
			   if(this.files && this.files[0]) {
			    var reader = new FileReader;
			    reader.onload = function(data) {
			     $(".select_img4 img").attr("src", data.target.result);        
			     $("#image4").val('image4');      
			    }
			    reader.readAsDataURL(this.files[0]);
			   }
			  });
	});
	$(document).ready(function(){
		$("#productImg5").change(function(){
			   if(this.files && this.files[0]) {
			    var reader = new FileReader;
			    reader.onload = function(data) {
			     $(".select_img5 img").attr("src", data.target.result);        
			     $("#image5").val('image5');      
			    }
			    reader.readAsDataURL(this.files[0]);
			   }
			  });
	});
	$(document).ready(function(){
		$("#productImg6").change(function(){
			   if(this.files && this.files[0]) {
			    var reader = new FileReader;
			    reader.onload = function(data) {
			     $(".select_img6 img").attr("src", data.target.result);        
			     $("#image6").val('image6');      
			    }
			    reader.readAsDataURL(this.files[0]);
			   }
			  });
	});
	<!--이미지 클릭시 파일을 클릭하는 기능-->
	$(document).ready(function() {
		$("#img1").click(function() {
			$("#productImg1").click();
		});
		$("#img2").click(function() {
			$("#productImg2").click();
		});
		$("#img3").click(function() {
			$("#productImg3").click();
		});
		$("#img4").click(function() {
			$("#productImg4").click();
		});
		$("#img5").click(function() {
			$("#productImg5").click();
		});
		$("#img6").click(function() {
			$("#productImg6").click();
		});
	});
</script>
<style type="text/css">
	/*버튼 클릭전 css*/
	.button5 {
	  background-color: white;
	  color: black;
	  text-align: center;
	  text-decoration: none;
	  display: inline-block;
	  font-size: 16px;
	  margin: 4px 2px;
	  transition-duration: 0.4s;
	  cursor: pointer;
	  border: 2px solid #555555;
	  width: 100px; 
	  height: 60px;
	}
	/*버튼 클릭후 css*/
	.button6{
	  background-color: #555555;
	  color: white;
	  text-align: center;
	  text-decoration: none;
	  display: inline-block;
	  font-size: 16px;
	  margin: 4px 2px;
	  transition-duration: 0.4s;
	  cursor: pointer;
	  border: 2px solid #555555;
	  width: 100px; 
	  height: 60px;
	}
	/*이미지 div 크기*/
	.select_img1{
		margin : 10px;
		width: 300px;
		height: 300px;
	}
	.select_img2{
		margin : 10px;
		width: 300px;
		height: 300px;
	}
	.select_img3{
		margin : 10px;
		width: 300px;
		height: 300px;
	}
	.select_img4{
		margin : 10px;
		width: 300px;
		height: 300px;
	}
	.select_img5{
		margin : 10px;
		width: 300px;
		height: 300px;
	}
	.select_img6{
		margin : 10px;
		width: 300px;
		height: 300px;
	}
	/*이미지 크기 및 기본 css*/
	.select_img1 img{
		width: 300px;
		height: 300px;
		opacity : 1;
		display: block;
		transition : .5s ease;
		backface-visibility: hidden;
	}
	.select_img2 img{
		width: 300px;
		height: 300px;
		opacity : 1;
		display: block;
		transition : .5s ease;
		backface-visibility: hidden;
	}
	.select_img3 img{
		width: 300px;
		height: 300px;
		opacity : 1;
		display: block;
		transition : .5s ease;
		backface-visibility: hidden;
	}
	.select_img4 img{
		width: 300px;
		height: 300px;
		opacity : 1;
		display: block;
		transition : .5s ease;
		backface-visibility: hidden;
	}
	.select_img5 img{
		width: 300px;
		height: 300px;
		opacity : 1;
		display: block;
		transition : .5s ease;
		backface-visibility: hidden;
	}
	.select_img6 img{
		width: 300px;
		height: 300px;
		opacity : 1;
		display: block;
		transition : .5s ease;
		backface-visibility: hidden;
	}
	/*이미지 배열을 위한 css*/
	.rowimg{
		display: flex;
	}
	/*이미지 위에 마우스를 올릴시 나타나는 기능*/
	.select_img1:hover img {
	  border : 1px solid;
	  opacity: 0.3;
	}
	.select_img2:hover img {
	border : 1px solid;
	  opacity: 0.3;
	}
	.select_img3:hover img {
	border : 1px solid;
	  opacity: 0.3;
	}
	.select_img4:hover img {
	border : 1px solid;
	  opacity: 0.3;
	}
	.select_img5:hover img {
	border : 1px solid;
	  opacity: 0.3;
	}
	.select_img6:hover img {
	border : 1px solid;
	  opacity: 0.3;
	}
	/*맨 위에 있는 제목*/
	.maintitle {font-family: monospace; font-size: 30px; font-weight: bold;}
	/*안에 있는 제목*/
	.subtitle {font-size: 20px; margin: 20px;}
	/*input 크기*/
	.inputarea {}
	/*내용입력 div 부분*/
	.subinput {}
	.subinput label { display:inline-block; }
	.subinput textarea {width:800px; height:300px;}
	.subinput input[type=text]{
		width : 20%;
		padding: 10px 20px;
 		border-radius: 4px;
 		border : 2px solid #e6e6e6 ;
 		background-color: #f1f1f1;
 	}
	.subinput input[type=text]: focus{border: 3px solid #555;} 
	.subinput select {
		width : 20%;
		padding: 10px 20px;
		border: none;
 		border-radius: 4px;
 		background-color: #f1f1f1;
 	}
	/*안에 있는 div부분*/
	.bodyinside {background: white; padding: 10px; margin-top:20px; 
				height: 50%; border: 2px solid #d2d2d2;}
	/*body전체 부분(배경)*/
	.bodyback {padding: 20px;}
</style>
</head>
<body style="margin: 0px;">
<%@include file="product_header.jsp" %>
<div class="bodyback">
<label class="maintitle">상품 등록</label>
<form action="product_input" enctype="multipart/form-data" method="post" name="product" onsubmit="return checkcode()">
	<div class="bodyinside">
	<div class="subinput">
		<label class="subtitle">상품 번호</label>
		<input type="text" name="code">
	</div>
	<div class="subinput">
		<label class="subtitle">제목</label>
		<input type="text" name="codename">
	</div>
	<div class="subinput">
		<label class="subtitle">color</label>
		<input type="text" name="codecolor">
	</div>
	<div class="subinput">
		<label class="subtitle">금액</label>
		<input type="text" name="price" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');">
	</div>
	<div class="subinput">
		<label class="subtitle">분류</label>
		<select name="category">
			<option selected="selected" value="run">런닝화</option>
			<option value="soccer">축구화</option>
			<option value="basket">농구화</option>
		</select>
	</div>
	<div class="subinput">
		<label class="subtitle">성별</label>
      	<input type="button" class="button5" value="MEN" id="men" onclick="genderbuttonclick(this.id)">
      	<input type="checkbox" id="1" name="gender" value="남자" hidden="">
      	<input type="button" class="button5" value="WOMEN" id="women"  onclick="genderbuttonclick(this.id)">
      	<input type="checkbox" id="2" name="gender" value="여자" hidden="">
      	<input type="button" class="button5" value="KIDS" id="kids" onclick="genderbuttonclick(this.id)">
      	<input type="checkbox" id="3" name="gender" value="키즈" hidden="">
	</div>
	</div>
	<div class="subinput">
		<label class="subtitle">사이즈</label><br>
		<c:forEach var="i" begin="80" end="160" step="10">
			<input type="button" class="button5" value="${i}" id="${i}" onclick="sizebuttonclick(this.id)">
			<input type="checkbox" id="${i}1"hidden="">
		<c:if test="${i%110 eq 0}">
			<br>
		</c:if>
		</c:forEach><br>
		<c:forEach var="i" begin="220" end="330" step="10">
			<input type="button" class="button5" value="${i}" id="${i}" onclick="sizebuttonclick(this.id)">
			<input type="checkbox" id="${i}1"hidden="">
		<c:if test="${i%260 eq 0 or i%310 eq 0}">
			<br>
		</c:if>
		</c:forEach>
		<div  id="size">
		</div>
	</div>
	<div class="subinput">
		<label class="subtitle">이미지</label><br>
		<input type="file" id="productImg1" name="file1" hidden="">
		<input type="file" id="productImg2" name="file2" hidden="">
		<input type="file" id="productImg3" name="file3" hidden="">
		<input type="file" id="productImg4" name="file4" hidden="">
		<input type="file" id="productImg5" name="file5" hidden="">
		<input type="file" id="productImg6" name="file6" hidden="">
		<div class="rowimg">
			<div class="select_img1">
			<img src="image/plus.png" id="img1" name="" src="">	
			<input type="text" id="image1" name="image1" value="" hidden="">
			</div>
			<div class="select_img2">
			<img src="image/plus.png" id="img2" name=""/>
			<input type="text" id="image2" name="image2" value="" hidden="">
			</div>
			<div class="select_img3">
			<img src="image/plus.png" id="img3" name=""/>
			<input type="text" id="image3" name="image3" value="" hidden="">
			</div>
		</div>
			<div class="rowimg">
			<div class="select_img4">
			<img src="image/plus.png" id="img4" name=""/>
			<input type="text" id="image4" name="image4" value="" hidden="">
			</div>
			<div class="select_img5">
			<img src="image/plus.png" id="img5" name=""/>
			<input type="text" id="image5" name="image5" value="" hidden="">
			</div>
			<div class="select_img6">
			<img src="image/plus.png" id="img6" name=""/>
			<input type="text" id="image6" name="image6" value="" hidden="">
			</div>
		</div>
	</div>	
	<div class="subinput">
		<label class="subtitle">내용</label><br>
		<textarea rows="10" cols="50" name="contents"></textarea>
	</div>
	<div><input class="button6" type="submit" value="등록"></div>
	</div>
</form>
</div>
</body>
</html>