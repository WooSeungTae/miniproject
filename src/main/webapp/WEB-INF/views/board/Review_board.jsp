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
			color:#111; padding-top:108px; height:1300px;
		}
		tr{
			height:50px; margin-bottom:20px;
		}
		.rating{
			position:relative; display:flex; flex-direction:row-reverse; margin-top:10px;
			border:1px solid #000; box-sizing:border-box; background:linear-gradient(to right, #f00, #ff0, #0f0);
		}
		
		.rating2{
			position:relative; display:flex; flex-direction:row-reverse; margin-top:10px;
			border:1px solid #000; box-sizing:border-box; background:linear-gradient(to right, #f00, #ff0, #0f0);
		}
		
		.rating3{
			position:relative; display:flex; flex-direction:row-reverse; margin-top:10px;
			border:1px solid #000; box-sizing:border-box; background:linear-gradient(to right, #f00, #ff0, #0f0);
		}
		
		.rating4{
			position:relative; display:flex; flex-direction:row-reverse; margin-top:10px;
			border:1px solid #000; box-sizing:border-box; background:linear-gradient(to right, #f00, #ff0, #0f0);
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
			display:block; cursor:pointer; width:50px; height:40px; display:flex; justify-content:center;
			align-items:center; transition:0.5s; background:#fff; color:#000; font-size:20px; border-right:1px solid #000;
		}
		
		.rating2 label{
			display:block; cursor:pointer; width:50px; height:40px; display:flex; justify-content:center;
			align-items:center; transition:0.5s; background:#fff; color:#000; font-size:20px; border-right:1px solid #000;
		}
		
		.rating3 label{
			display:block; cursor:pointer; width:50px; height:40px; display:flex; justify-content:center;
			align-items:center; transition:0.5s; background:#fff; color:#000; font-size:20px; border-right:1px solid #000;
		}
		
		.rating4 label{
			display:block; cursor:pointer; width:50px; height:40px; display:flex; justify-content:center;
			align-items:center; transition:0.5s; background:#fff; color:#000; font-size:20px; border-right:1px solid #000;
		}
		
		input[type="text"]{
			width:300px;
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
			background-color:#000; color:white; width:350px; height:45px; border:0px; border-radius:30px; margin-bottom:10px;
		}
		
		.select_img1{
			width: 300px; height: 300px;
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
			width: 100%;
			max-width: 200px;
			
		}
		
		.deletereview{
			background-color:#fff; color:#000; border:1px solid #000; width:350px; height:45px; border-radius:30px;
			margin-bottom:10px;
		}
	</style>
	<script type="text/javascript" src="js/jquery-3.4.1.min.js"></script>
	<script type="text/javascript">
		window.onload = function(){
			$('input:radio[name=star_input]:input[value='+${param.star_input}+']').attr("checked", true);
		}	
	
	
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
		<table>
				<tr>
					<td>사진</td>
 						<td align="center">
							<div class="subinput">
								<input type="file" id="productImg1" name="file" hidden="">
								<div class="rowimg">
									<div class="select_img1">
										<img src="${param.image }" id="img1" />	
										<input type="text" id="image1" name="image" value="" hidden="">
									</div>
								</div>
							</div>
						</td>
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
						  		<output for="star_input"><b>${param.star_input }</b>점</output>						
							</span>
							<script type="text/javascript" src="js/jquery-3.4.1.min.js"></script>
							<script src="js/star.js"></script>
						</td>
					</tr>
					<tr>
						<td>내용</td>
						<td><textarea cols="50" rows="10" name="reviewcontents">${ param.reviewcontents}</textarea>
					</td>
				</table>
</body>
</html>