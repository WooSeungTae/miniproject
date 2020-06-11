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
	<!-- 버튼을 누를경우  해당 버튼 색이 변하는 기능 -->
	function genderbuttonclick(clicked_id){
		var gender = 1;
		var genderlabel = document.getElementById('subtitle');
		console.log(genderlabel)
		
		if(clicked_id == "men"){
			gender=1;
			genderlabel.innerHTML = "남"
		}else if(clicked_id == "women"){
			gender=2;
			genderlabel.innerHTML = "여"
		}else if(clicked_id == "kids"){
			genderlabel.innerHTML = "키즈"
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
		console.log(gender);
		if(document.getElementById(clicked_id).classList == 'button5'){
			document.getElementById(clicked_id).classList.add('button6');
			document.getElementById(clicked_id).classList.remove('button5');
			document.getElementById(gender).checked = true;
			size.innerHTML += "<label class='subtitle' id='"+clicked_id+2+"'>"+clicked_id+" 사이즈 수량</label>"
			size.innerHTML += "<input id='"+clicked_id+3+"' name='size"+clicked_id+"'type='text' value='0'><br id='"+clicked_id+4+"'>"
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
<script type="text/javascript">
		window.onload = function(){
			if(${sdto.size80}!=0){
				document.getElementById('80').classList.add('button6');
				size.innerHTML += "<label class='subtitle' id='80'>80 사이즈 수량</label>"
				size.innerHTML += "<input id='80' name='size80' type='text' value='${sdto.size80}'><br id='size80'>"
			}if(${sdto.size90}!=0){
				document.getElementById('90').classList.add('button6');
				size.innerHTML += "<label class='subtitle' id='90'>90 사이즈 수량</label>"
				size.innerHTML += "<input id='90' name='size90' type='text' value='${sdto.size90}'><br id='size90'>"
			}if(${sdto.size100}!=0){
				document.getElementById('100').classList.add('button6');
				size.innerHTML += "<label class='subtitle' id='100'>100 사이즈 수량</label>"
				size.innerHTML += "<input id='100' name='size100' type='text' value='${sdto.size100}'><br id='size100'>"
			}if(${sdto.size110}!=0){
				document.getElementById('110').classList.add('button6');
				size.innerHTML += "<label class='subtitle' id='110'>110 사이즈 수량</label>"
				size.innerHTML += "<input id='110' name='size110' type='text' value='${sdto.size110}'><br id='size110'>"
			}if(${sdto.size120}!=0){
				document.getElementById('120').classList.add('button6');
				size.innerHTML += "<label class='subtitle' id='120'>120 사이즈 수량</label>"
				size.innerHTML += "<input id='120' name='size120' type='text' value='${sdto.size120}'><br id='size120'>"
			}if(${sdto.size130}!=0){
				document.getElementById('130').classList.add('button6');
				size.innerHTML += "<label class='subtitle' id='130'>130 사이즈 수량</label>"
				size.innerHTML += "<input id='130' name='size130' type='text' value='${sdto.size130}'><br id='size130'>"
			}if(${sdto.size140}!=0){
				document.getElementById('140').classList.add('button6');
				size.innerHTML += "<label class='subtitle' id='140'>140 사이즈 수량</label>"
				size.innerHTML += "<input id='140' name='size140' type='text' value='${sdto.size140}'><br id='size140'>"
			}if(${sdto.size150}!=0){
				document.getElementById('150').classList.add('button6');
				size.innerHTML += "<label class='subtitle' id='150'>150 사이즈 수량</label>"
				size.innerHTML += "<input id='150' name='size150' type='text' value='${sdto.size150}'><br id='size150'>"
			}if(${sdto.size160}!=0){
				document.getElementById('160').classList.add('button6');
				size.innerHTML += "<label class='subtitle' id='160'>160 사이즈 수량</label>"
				size.innerHTML += "<input id='160' name='size160' type='text' value='${sdto.size160}'><br id='size160'>"
			}if(${sdto.size220}!=0){
				document.getElementById('220').classList.add('button6');
				size.innerHTML += "<label class='subtitle' id='220'>220 사이즈 수량</label>"
				size.innerHTML += "<input id='220' name='size220' type='text' value='${sdto.size220}'><br id='size220'>"
			}if(${sdto.size230}!=0){
				document.getElementById('230').classList.add('button6');
				size.innerHTML += "<label class='subtitle' id='230'>230 사이즈 수량</label>"
				size.innerHTML += "<input id='230' name='size230' type='text' value='${sdto.size230}'><br id='size230'>"
			}if(${sdto.size240}!=0){
				document.getElementById('240').classList.add('button6');
				size.innerHTML += "<label class='subtitle' id='240'>240 사이즈 수량</label>"
				size.innerHTML += "<input id='240' name='size240' type='text' value='${sdto.size240}'><br id='size240'>"
			}if(${sdto.size250}!=0){
				document.getElementById('250').classList.add('button6');
				size.innerHTML += "<label class='subtitle' id='250'>250 사이즈 수량</label>"
				size.innerHTML += "<input id='250' name='size250' type='text' value='${sdto.size250}'><br id='size250'>"
			}if(${sdto.size260}!=0){
				document.getElementById('260').classList.add('button6');
				size.innerHTML += "<label class='subtitle' id='260'>260 사이즈 수량</label>"
				size.innerHTML += "<input id='260' name='size260' type='text' value='${sdto.size260}'><br id='size260'>"
			}if(${sdto.size270}!=0){
				document.getElementById('270').classList.add('button6');
				size.innerHTML += "<label class='subtitle' id='270'>270 사이즈 수량</label>"
				size.innerHTML += "<input id='270' name='size270' type='text' value='${sdto.size270}'><br id='size270'>"
			}if(${sdto.size280}!=0){
				document.getElementById('280').classList.add('button6');
				size.innerHTML += "<label class='subtitle' id='280'>280 사이즈 수량</label>"
				size.innerHTML += "<input id='280' name='size280' type='text' value='${sdto.size280}'><br id='size280'>"
			}if(${sdto.size290}!=0){
				document.getElementById('290').classList.add('button6');
				size.innerHTML += "<label class='subtitle' id='290'>290 사이즈 수량</label>"
				size.innerHTML += "<input id='290' name='size290' type='text' value='${sdto.size290}'><br id='size290'>"
			}if(${sdto.size300}!=0){
				document.getElementById('300').classList.add('button6');
				size.innerHTML += "<label class='subtitle' id='300'>300 사이즈 수량</label>"
				size.innerHTML += "<input id='300' name='size300' type='text' value='${sdto.size300}'><br id='size300'>"
			}if(${sdto.size310}!=0){
				document.getElementById('310').classList.add('button6');
				size.innerHTML += "<label class='subtitle' id='310'>310 사이즈 수량</label>"
				size.innerHTML += "<input id='310' name='size310' type='text' value='${sdto.size310}'><br id='size310'>"
			}if(${sdto.size320}!=0){
				document.getElementById('320').classList.add('button6');
				size.innerHTML += "<label class='subtitle' id='320'>320 사이즈 수량</label>"
				size.innerHTML += "<input id='320' name='size320' type='text' value='${sdto.size320}'><br id='size320'>"
			}if(${sdto.size330}!=0){
				document.getElementById('330').classList.add('button6');
				size.innerHTML += "<label class='subtitle' id='330'>330 사이즈 수량</label>"
				size.innerHTML += "<input id='330' name='size330' type='text' value='${sdto.size330}'><br id='size330'>"
			}
			
			
		}
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
<%@include file="../product_header.jsp" %>
<div class="bodyback">
<label class="maintitle">상품 수정</label>
<form action="productupdate" enctype="multipart/form-data" method="post">
	<div class="bodyinside">
	<!-- 클릭한 상품 정보들 가져와서 수정값 입력 받기 -->
	<div class="subinput">
		<img src="${pdto.image1 }" style="width:320px; height:320px;">
	</div>
	<div class="subinput">
		<label class="subtitle">상품 번호</label>
		<input type="text" name="code" value="${pdto.code }" readonly>
	</div>
	<div class="subinput">
		<label class="subtitle">상품명</label>
		<input type="text" name="codename" placeholder="${pdto.codename }" value="${pdto.codename }">
	</div>
	<div class="subinput">
		<label class="subtitle">color</label>
		<input type="text" name="codecolor" placeholder="${pdto.codecolor }" value="${pdto.codecolor }">
	</div>
	<div class="subinput">
		<label class="subtitle">금액</label>
		<input type="text" name="price" placeholder="${pdto.price }" value="${pdto.price }">
	</div>
	<div class="subinput">
		<label class="subtitle">분류 : ${pdto.category }</label>
		<select name="category">
			<option selected="selected" value="런닝화">런닝화</option>
			<option value="축구화">축구화</option>
			<option value="농구화">농구화</option>
		</select>
	</div>
	<div class="subinput">
		<font style="font-size:20px; margin:20px;">성별 : </font><label id="subtitle" class="subtitle" style="margin-left:-20px;">${pdto.gender }</label>
		<input type="button" class="button5" value="MEN" id="men" onclick="genderbuttonclick(this.id)">
		<input type="checkbox" id="1" name="gender" value="men" hidden="">
		<input type="button" class="button5" value="WOMEN" id="women"  onclick="genderbuttonclick(this.id)">
		<input type="checkbox" id="2" name="gender" value="women" hidden="">
		<input type="button" class="button5" value="KIDS" id="kids" onclick="genderbuttonclick(this.id)">
		<input type="checkbox" id="3" name="gender" value="kids" hidden="">
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
			<img src="${pdto.image1}" id="img1" name="image1" onerror="this.src='image/plus.png'"/>	
			<input type="text" id="image1" name="image1" value="${pdto.image1 }" hidden="">
			</div>
			<div class="select_img2">
			<img src="${pdto.image2 }" id="img2" name="image2" onerror="this.src='image/plus.png'"/>
			<input type="text" id="image2" name="image2" value="${pdto.image2 }" hidden="">
			</div>
			<div class="select_img3">
			<img src="${pdto.image3 }" id="img3" name="image3" onerror="this.src='image/plus.png'"/>
			<input type="text" id="image3" name="image3" value="${pdto.image3 }" hidden="">
			</div>
		</div>
			<div class="rowimg">
			<div class="select_img4">
			<img src="${pdto.image4 }" id="img4" name="image4" onerror="this.src='image/plus.png'"/>
			<input type="text" id="image4" name="image4" value="${pdto.image4 }" hidden="">
			</div>
			<div class="select_img5">
			<img src="${pdto.image5  }" id="img5" name="image5" onerror="this.src='image/plus.png'"/>
			<input type="text" id="image5" name="image5" value="${pdto.image5 }" hidden="">
			</div>
			<div class="select_img6">
			<img src="${pdto.image6  }" id="img6" name="image6" onerror="this.src='image/plus.png'"/>
			<input type="text" id="image6" name="image6" value="${pdto.image6 }" hidden="">
			</div>
			<!--input type="hidden" name="beforefile1" value="${pdto.image1}"-->
		</div>
	</div>	
	<div class="subinput">
		<label class="subtitle">내용</label><br>
		<textarea rows="5" cols="20" name="contents" >${pdto.contents }</textarea>
	</div>
	<div>
		<input class="button6" type="submit" value="수정 완료">
		<input class="button5" type="button" value="삭제" onclick="location.href='productDelete?code=${pdto.code}'">
	</div>
</form>
</div>
</body>
</html>