<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
<meta http-equiv="Content-Type" content="text/html" charset="utf-8">
<title>Insert title here</title>
	<style>
		.wrapper{
			font-family:"Noto Sans KR", "Malgun Gothic", "MalgunGothic", Dotum, Helvetica, Arial, sans-serif;
			color:#111;
			padding-top:108px;
			height:1300px;
		}
		tr{
			height:50px;
			margin-bottom:20px;
		}
		.rating{
			position:relative;
			display:flex;
			flex-direction:row-reverse;
			margin-top:10px;
			border:1px solid #000;
			box-sizing:border-box;
			background:linear-gradient(to right, #f00, #ff0, #0f0);
		}
		
		.rating2{
			position:relative;
			display:flex;
			flex-direction:row-reverse;
			margin-top:10px;
			border:1px solid #000;
			box-sizing:border-box;
			background:linear-gradient(to right, #f00, #ff0, #0f0);
		}
		
		.rating3{
			position:relative;
			display:flex;
			flex-direction:row-reverse;
			margin-top:10px;
			border:1px solid #000;
			box-sizing:border-box;
			background:linear-gradient(to right, #f00, #ff0, #0f0);
		}
		
		.rating4{
			position:relative;
			display:flex;
			flex-direction:row-reverse;
			margin-top:10px;
			border:1px solid #000;
			box-sizing:border-box;
			background:linear-gradient(to right, #f00, #ff0, #0f0);
		}
		.rating input{
			display:none;
		}
		.rating2 input{
			display:none;
		}
		.rating3 input{
			display:none;
		}
		
		.rating4 input{
			display:none;
		}
		.rating label{
			display:block;
			cursor:pointer;
			width:50px;
			height:40px;
			display:flex;
			justify-content:center;
			align-items:center;
			transition:0.5s;
			background:#fff;
			color:#000;
			font-size:20px;
			border-right:1px solid #000;
		}
		
		.rating2 label{
			display:block;
			cursor:pointer;
			width:50px;
			height:40px;
			display:flex;
			justify-content:center;
			align-items:center;
			transition:0.5s;
			background:#fff;
			color:#000;
			font-size:20px;
			border-right:1px solid #000;
		}
		
		.rating3 label{
			display:block;
			cursor:pointer;
			width:50px;
			height:40px;
			display:flex;
			justify-content:center;
			align-items:center;
			transition:0.5s;
			background:#fff;
			color:#000;
			font-size:20px;
			border-right:1px solid #000;
		}
		
		.rating4 label{
			display:block;
			cursor:pointer;
			width:50px;
			height:40px;
			display:flex;
			justify-content:center;
			align-items:center;
			transition:0.5s;
			background:#fff;
			color:#000;
			font-size:20px;
			border-right:1px solid #000;
		}
		
		input[type="text"]{
			width:300px;
		}
		
		.rating input[type="radio"]:hover ~ label,
		.rating input[type="radio"]:checked ~ label{
			background:transparent;
		}
		
		.rating2 input[type="radio"]:hover ~ label,
		.rating2 input[type="radio"]:checked ~ label{
			background:transparent;
		}
		
		.rating3 input[type="radio"]:hover ~ label,
		.rating3 input[type="radio"]:checked ~ label{
			background:transparent;
		}
		
		.rating4 input[type="radio"]:hover ~ label,
		.rating4 input[type="radio"]:checked ~ label{
			background:transparent;
		}
		  
		.star_input>.input,
		.star_input>.input>label:hover,
		.star_input>.input>input:focus+label,
		.star_input>.input>input:checked+label{display: inline-block;vertical-align:middle;background:url('/nike/reviewimage/grade_img.png')no-repeat;}
		.star_input{display:inline-block; white-space:nowrap;width:225px;height:40px;padding:0px;line-height:30px;}
		.star_input>.input{display:inline-block;width:150px;background-size:150px;height:28px;white-space:nowrap;overflow:hidden;position: relative;}
		.star_input>.input>input{position:absolute;width:1px;height:1px;opacity:0;}
		star_input>.input.focus{outline:1px dotted #ddd;}
		.star_input>.input>label{width:30px;height:0;padding:28px 0 0 0;overflow: hidden;float:left;cursor: pointer;position: absolute;top: 0;left: 0;}
		.star_input>.input>label:hover,
		.star_input>.input>input:focus+label,
		.star_input>.input>input:checked+label{background-size: 150px;background-position: 0 bottom;}
		.star_input>.input>label:hover~label{background-image: none;}
		.star_input>.input>label[for="p1"]{width:30px;z-index:5;}
		.star_input>.input>label[for="p2"]{width:60px;z-index:4;}
		.star_input>.input>label[for="p3"]{width:90px;z-index:3;}
		.star_input>.input>label[for="p4"]{width:120px;z-index:2;}
		.star_input>.input>label[for="p5"]{width:150px;z-index:1;}
		.star_input>output{display:inline-block;width:60px; font-size:18px;text-align:right; vertical-align:middle;}
		
		.goreview{
			background-color:#000;
			color:white;
			width:350px;
			height:45px;
			border:0px;
			border-radius:30px;
			margin-bottom:10px;
		}
		
		.select_img1{
			width: 300px;
			height: 300px;
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
		
		#img1{
			width: 300px;
			height: 300px;
		}
	</style>
	<script type="text/javascript" src="js/jquery-3.4.1.min.js"></script>
	<script type="text/javascript">
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
		$(document).ready(function() {
			$("#img1").click(function() {
				$("#productImg1").click();
			});
		});
	
	</script>
	
</head>
<body>
	<header>
		<c:import url="../sminj/header.jsp">
		</c:import>
	</header>
	<section class="wrapper">
	<div align="center">
		<h1>상품 리뷰 작성하기</h1>
		<div style="margin-bottom:20px; height:20px;">
		</div>
			<form action="reviewsave" enctype="multipart/form-data" method="post">
				<table>
					<tr>
						<td>작성자</td>
						<td><input type="text" name="name" value="${name }" readonly></td>
					</tr>
					<tr>
						<td>상품코드</td>
						<td><input type="text" name="code" value="${code }" readonly></td>
					</tr>
					<tr>
						<td>상품명</td>
						<td><input type="text" name="codename" value="${codename }" readonly></td>
					</tr>
					<tr>
						<td>별점</td>
						<td>
							<span class="star_input">
								<span class="input">
		    						<input type="radio" name="star_input" value="1" id="p1">
		    						<label for="p1">1</label>
							    	<input type="radio" name="star_input" value="2" id="p2">
							    	<label for="p2">2</label>
							    	<input type="radio" name="star_input" value="3" id="p3">
							    	<label for="p3">3</label>
							    	<input type="radio" name="star_input" value="4" id="p4">
							    	<label for="p4">4</label>
							    	<input type="radio" name="star_input" value="5" id="p5">
							    	<label for="p5">5</label>
						  		</span>
						  		<output for="star_input"><b>0</b>점</output>						
							</span>
							<script type="text/javascript" src="js/jquery-3.4.1.min.js"></script>
							<script src="js/star.js"></script>
						</td>
					</tr>
					<tr>
						<td>제목</td>
						<td><input type="text" name="reviewtitle" placeholder="제목을 작성해주세요"></td>
					</tr>
					<tr>
						<td>내용</td>
						<td><textarea cols="50" rows="10" name="reviewcontents" placeholder="내용을 작성해주세요"></textarea>
					</td>
					<tr>
						<td>편안함</td>
						<td>
							<div class="rating">
								<input type="radio" name="rating" id="rate10" value="10">
								<label for="rate10">10</label>
								<input type="radio" name="rating" id="rate9" value="9">
								<label for="rate9">9</label>
								<input type="radio" name="rating" id="rate8" value="8">
								<label for="rate8">8</label>
								<input type="radio" name="rating" id="rate7" value="7">
								<label for="rate7">7</label>
								<input type="radio" name="rating" id="rate6" value="6">
								<label for="rate6">6</label>
								<input type="radio" name="rating" id="rate5" value="5">
								<label for="rate5">5</label>
								<input type="radio" name="rating" id="rate4" value="4">
								<label for="rate4">4</label>
								<input type="radio" name="rating" id="rate3" value="3">
								<label for="rate3">3</label>
								<input type="radio" name="rating" id="rate2" value="2">
								<label for="rate2">2</label>
								<input type="radio" name="rating" id="rate1" value="1">
								<label for="rate1">1</label>
							</div>
						</td>
					</tr>
					<tr>
						<td>사이즈</td>
						<td>
							<div class="rating2">
								<input type="radio" name="rating2" id="rate2_10" value="10">
								<label for="rate2_10">10</label>
								<input type="radio" name="rating2" id="rate2_9" value="9">
								<label for="rate2_9">9</label>
								<input type="radio" name="rating2" id="rate2_8" value="8">
								<label for="rate2_8">8</label>
								<input type="radio" name="rating2" id="rate2_7" value="7">
								<label for="rate2_7">7</label>
								<input type="radio" name="rating2" id="rate2_6" value="6">
								<label for="rate2_6">6</label>
								<input type="radio" name="rating2" id="rate2_5" value="5">
								<label for="rate2_5">5</label>
								<input type="radio" name="rating2" id="rate2_4" value="4">
								<label for="rate2_4">4</label>
								<input type="radio" name="rating2" id="rate2_3" value="3">
								<label for="rate2_3">3</label>
								<input type="radio" name="rating2" id="rate2_2" value="2">
								<label for="rate2_2">2</label>
								<input type="radio" name="rating2" id="rate2_1" value="1">
								<label for="rate2_1">1</label>
							</div>
						</td>
					</tr>
					<tr>
						<td>내구성</td>
						<td>
							<div class="rating3">
								<input type="radio" name="rating3" id="rate3_10" value="10">
								<label for="rate3_10">10</label>
								<input type="radio" name="rating3" id="rate3_9" value="9">
								<label for="rate3_9">9</label>
								<input type="radio" name="rating3" id="rate3_8" value="8">
								<label for="rate3_8">8</label>
								<input type="radio" name="rating3" id="rate3_7" value="7">
								<label for="rate3_7">7</label>
								<input type="radio" name="rating3" id="rate3_6" value="6">
								<label for="rate3_6">6</label>
								<input type="radio" name="rating3" id="rate3_5" value="5">
								<label for="rate3_5">5</label>
								<input type="radio" name="rating3" id="rate3_4" value="4">
								<label for="rate3_4">4</label>
								<input type="radio" name="rating3" id="rate3_3" value="3">
								<label for="rate3_3">3</label>
								<input type="radio" name="rating3" id="rate3_2" value="2">
								<label for="rate3_2">2</label>
								<input type="radio" name="rating3" id="rate3_1" value="1">
								<label for="rate3_1">1</label>
							</div>
						</td>
					</tr>
					<tr>
						<td>폭</td>
						<td>
							<div class="rating4">
								<input type="radio" name="rating4" id="rate4_10" value="10">
								<label for="rate4_10">10</label>
								<input type="radio" name="rating4" id="rate4_9" value="9">
								<label for="rate4_9">9</label>
								<input type="radio" name="rating4" id="rate4_8" value="8">
								<label for="rate4_8">8</label>
								<input type="radio" name="rating4" id="rate4_7" value="7">
								<label for="rate4_7">7</label>
								<input type="radio" name="rating4" id="rate4_6" value="6">
								<label for="rate4_6">6</label>
								<input type="radio" name="rating4" id="rate4_5" value="5">
								<label for="rate4_5">5</label>
								<input type="radio" name="rating4" id="rate4_4" value="4">
								<label for="rate4_4">4</label>
								<input type="radio" name="rating4" id="rate4_3" value="3">
								<label for="rate4_3">3</label>
								<input type="radio" name="rating4" id="rate4_2" value="2">
								<label for="rate4_2">2</label>
								<input type="radio" name="rating4" id="rate4_1" value="1">
								<label for="rate4_1">1</label>
							</div>
						</td>
					</tr>
					<tr>
						<td>사진</td>
						<td align="center">
							<div class="subinput">
								<input type="file" id="productImg1" name="file" hidden="">
								<div class="rowimg">
									<div class="select_img1">
										<img src="image/plus.png" id="img1" />	
										<input type="text" id="image1" name="image" value="" hidden="">
									</div>
								</div>
							</div>
						</td>
					</tr>
				</table>
				<div align="center" style="margin-top:50px;">
					<input type="submit" value="리뷰등록" class="goreview">
				</div>
			</form>
		</div>
	</section>
	<footer>
		<c:import url="../sminj/footer.jsp">
		</c:import>
	</footer>
</body>
</html>