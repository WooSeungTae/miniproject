<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<style>
.wrapper {
	font-family: "Noto Sans KR", "Malgun Gothic", "MalgunGothic", Dotum,
		Helvetica, Arial, sans-serif;
	color: #111;
	padding-top: 150px;
	min-height: 100%;
	height: 1800px;
}

.contents-area {
	height: 80%;
}

.contents {
	box-sizing: border-box;
	height: 100%;
	overflow: 0 auto;
}

.contents.margin-small {
	margin-top: 30px;
	height: 70%;
}

.pt_product-detail {
	max-width: 1440px;
	margin: 68px auto 0 auto;
}

.img-detail_product_n {
	width: 55%;
	display: inline-block;
	padding: 0 30px;
	text-align: center;
	float: left;
	height: 70%;
	margin-left: 20px;
}

.img-detail-list {
	display: inline-block;
	width: 95%;
	height: 420px;
	overflow: 0 hidden;
}

.image-list {
	display: inline;
	width: 45%;
	height: 95%;
	overflow: 0 hidden;
	margin-bottom: 10px;
}

.prd-gutter {
	background: #f5f5f5;
	width: 400px;
	margin: 5px;
	height: 400px;
	overflow: 0 hidden;
	margin-bottom: 10px;
}

.product-image {
	width: 100%;
	height: 100%;
	margin: 0 hidden;
	overflow: 0 hidden;
	border:#fff;
}

.info-wrap_product_n {
	position: relative;
	float: right;
	width: 40%;
	padding: 0 54px 0 10px;
	color: #606060;
	box-sizing: border-box;
	text-align: left;
}

.info-wrap_product_n .price-wrap {
	display: inline-block;
	font-size: 16px;
	letter-spacing: 0.1px;
	color: #00000;
}

.product-option-container {
	position: relative;
	float: left;
}

.quantity {
	margin-bottom: 10px;
}

.order-wrap {
	margin-bottom: 10px;
}

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
	width: 100px; 
}

.button6 {
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
	width: 100px; 
}

.button7 {
	background-color: #BDBDBD;
	color: white;
	padding: 16px 32px;
	text-align: center;
	text-decoration: none;
	display: inline-block;
	font-size: 16px;
	margin: 4px 2px;
	transition-duration: 0.4s;
	cursor: pointer;
	border: 2px solid #BDBDBD;
	width: 100px; 
}

.directorder {
	background-color: #000;
	color: white;
	width: 350px;
	height: 45px;
	border: 0px;
	border-radius: 30px;
	margin-bottom: 10px;
}

.shoppingcart {
	background-color: #fff;
	color: #000;
	border: 1px solid #000;
	width: 350px;
	height: 45px;
	border-radius: 30px;
	margin-bottom: 10px;
}

/*리뷰 q&a 테이블 */
.bordertable {
	margin: auto;
	width: 80%;
	min-width: 800px;
	border-top: 1px solid #ddd;
	border-collapse: collapse;
}

.bordertable tr {
	border-bottom: 1px solid #ddd;
	height: 20px;
}
.bordertable1 {
	margin: auto;
	width: 80%;
	min-width: 800px;
	border-top: 1px solid #ddd;
	border-collapse: collapse;
}

.bordertable1 tr {
	border-bottom: 1px solid #ddd;
	height: 50px;
}

/*리뷰타이틀*/
#boardtitle {
	font-size: 20px;
	background-color: #f5f5f5;
}

/*리뷰창 사진*/
#imgreview {
	width: 100%;
	max-width: 80px;
}

/*페이지 div부분*/
	.pagingdiv{text-align: center; margin: 10px;}
	.paging{display: inline-block;}
	.paging a{
	color: black;
	float: left;
	padding: 8px 16px;
	text-decoration: none;
	transition: background-color .3s;
	}
	.paging a.active{
	background-color: black;
	color: white;
	}
	.paging a:hover:not(.active) {background-color: #ddd;}
</style>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript" src="js/jquery-3.4.1.min.js"></script>
<script type="text/javascript">
	function start(){
		var noadd = document.getElementById("noadd").value;
		console.log("bbbbbbbbbbbbbbbbbbbbbbbbbbbbb");
		
		
		if(${pdto.gender!="키즈"}){
			if(${sdto.size230==0}){
				document.getElementById("230").setAttribute("disabled", "disabled");
				document.getElementById("230").className = "button7";
			}
			if(${sdto.size240==0}){
				document.getElementById("240").setAttribute("disabled", "disabled");
				document.getElementById("240").className = "button7";
			}
			if(${sdto.size250==0}){
				document.getElementById("250").setAttribute("disabled", "disabled");
				document.getElementById("250").className = "button7";
			}
			if(${sdto.size260==0}){
				document.getElementById("260").setAttribute("disabled", "disabled");
				document.getElementById("260").className = "button7";
			}
			if(${sdto.size270==0}){
				document.getElementById("270").setAttribute("disabled", "disabled");
				document.getElementById("270").className = "button7";
			}
			if(${sdto.size280==0}){
				document.getElementById("280").setAttribute("disabled", "disabled");
				document.getElementById("280").className = "button7";
			}
			if(${sdto.size290==0}){
				document.getElementById("290").setAttribute("disabled", "disabled");
				document.getElementById("290").className = "button7";
			}
			if(${sdto.size300==0}){
				document.getElementById("300").setAttribute("disabled", "disabled");
				document.getElementById("300").className = "button7";
			}
			if(${sdto.size310==0}){
				document.getElementById("310").setAttribute("disabled", "disabled");
				document.getElementById("130").className = "button7";
			}
			if(${sdto.size320==0}){
				document.getElementById("320").setAttribute("disabled", "disabled");
				document.getElementById("320").className = "button7";
			}
			if(${sdto.size330==0}){
				document.getElementById("330").setAttribute("disabled", "disabled");
				document.getElementById("330").className = "button7";
			}
		}else{
			if(${sdto.size80==0}){
				document.getElementById("80").setAttribute("disabled", "disabled");
				document.getElementById("80").className = "button7";
			}
			if(${sdto.size90==0}){
				document.getElementById("90").setAttribute("disabled", "disabled");
				document.getElementById("90").className = "button7";
			}
			if(${sdto.size100==0}){
				document.getElementById("100").setAttribute("disabled", "disabled");
				document.getElementById("100").className = "button7";
			}
			if(${sdto.size110==0}){
				document.getElementById("110").setAttribute("disabled", "disabled");
				document.getElementById("110").className = "button7";
			}
			if(${sdto.size120==0}){
				document.getElementById("120").setAttribute("disabled", "disabled");
				document.getElementById("120").className = "button7";
			}
			if(${sdto.size130==0}){
				document.getElementById("130").setAttribute("disabled", "disabled");
				document.getElementById("130").className = "button7";
			}
			if(${sdto.size140==0}){
				document.getElementById("140").setAttribute("disabled", "disabled");
				document.getElementById("140").className = "button7";
			}
			if(${sdto.size150==0}){
				document.getElementById("150").setAttribute("disabled", "disabled");
				document.getElementById("150").className = "button7";
			}
			if(${sdto.size310==0}){
				document.getElementById("160").setAttribute("disabled", "disabled");
				document.getElementById("160").className = "button7";
			}
			
		}
	}
</script>
<script>

	/* ========= 리뷰 페이징 관련 스크립트 =========*/
	var page = 1;
	var cntPerPage = 3;//리뷰 행수 지정
	var totalrv = ${totalrv}; // 리뷰토탈페이지
	var endpage = Math.ceil(totalrv / cntPerPage); //리뷰 페이지 갯수
	var cntPage = 5; //페이지 보이는 수
	var startPage=0; //제일 앞에 보이는 페이지수
	var lastPage=0; //마지막에 보이는 페이지수
	/*1. 리뷰 테이블 ajax*/
	function RVPaging(page){
		page = page; //페이지 선택시 입력
		var form = {
				nowPage : page,
				code : '${pdto.code}'
					}
		$.ajax({
			url : "ajax_RV",
			type : "POST",
			data : form,
			success : function(result){
				let html = "<table class='bordertable'>";
				html += "<tr style='border-top: 1px solid white;'><td colspan='5'<b>총"+${totalrv}+" 개의 리뷰가 등록되어있습니다.</b></td></tr><tr></tr>"
				+"<tr id='boardtitle'><th>번호</th><th colspan='2'>제목</th><th>작성자</th>"
				+"<th>작성일</th><th style='display: none;'>코드번호</th></tr>"		
			 	if(result.length == 0){                
		       		html+="<tr><th colspan='5' style='padding:30px;'>리뷰가 없습니다.</th></tr>"
		       	}else{
		       		for(var i=0;i<result.length;i++){
		       		html+="<tr class='contentqa' id='rvtablebody'><th style='width: 10%;'>"+result[i].rn+"</th>"+
						"<th style='width: 10%;'><img id='imgreview' src='/nike/"+result[i].image+"'></th>"+
						"<th class='"+result[i].reviewnum+"' id='"+result[i].reviewnum+result[i].reviewtitle+"' style='width: 60%;' onclick='reviewclick(this)'' >"+result[i].reviewtitle+" "
						if(result[i].indexcnt!=null){
							html+="<span style='color:blue'>["+result[i].indexcnt+"]</span></th>"
						}else{
							html+="</th>"}
						html+="<th style='width: 10%;'>"+result[i].name+"</th>"+
						"<th style='width: 10%;'>"+chahgeDate(result[i].writeDate)+"</th>"+
						"<th style='display: none;'>"+result[i].code+"</th></tr>"+
						"<tr class='contentqa'><th class='importcontent' id ='"+result[i].reviewnum+result[i].reviewtitle+"qnanike'  colspan='5' style='display:none;'></tr>"
		       		}
		       	}
				html+="</table>"
				html+="<div class='pagingdiv'><div class='paging'>"
				calcstartendPage(page);
				if(startPage!=1){
					html+="<span onclick='RVPaging("+(startPage-1)+")'><a> 이전 </a></span>"
					}
				for(var k=startPage; k<=lastPage;k++){
					html+="<span id='"+k+"' onclick='RVPaging(this.id)'><a> "+ k +" </a></span>"
					}
				if(lastPage!=endpage){
					html+="<span onclick='RVPaging("+(lastPage+1)+")'><a> 다음 </a></span>"
					}
				html+="</div></div>"
				$("#rvtablediv").html(html);
			},
		error : function() {
			alert("문제가 발생 했습니다!!");
		}

		       	});	
		
		}
	/*2. 리뷰페이지 시작, 끝 페이지 계산*/
		function calcstartendPage(page){
			lastPage = (Math.ceil(page / cntPage)) * cntPage;
			if(lastPage > endpage){
				lastPage=endpage;
			}
			startPage = lastPage  - cntPage +1;
			if(startPage<1) startPage=1;
		
	}
	/* ========= Q & A 페이징 관련 스크립트 =========*/
	var pageqa = 1;
	var cntPerPageqa = 3;//Q & A 행수 지정
	var totalqa = ${totalqa}; // Q & A 토탈페이지
	var endpageqa = Math.ceil(totalqa / cntPerPage);  //Q & A  페이지 갯수 
	var cntPageqa = 5; //페이지 보이는 수
	var startPageqa=0; //제일 앞에 보이는 페이지수
	var lastPageqa=0; //마지막에 보이는 페이지수
	
	/*1. Q & A  테이블 ajax*/
	function QAPaging(pageqa){
		pageqa = pageqa; //페이지 선택시 입력
		var form = {
				nowPage : pageqa,
				code : '${pdto.code}'
					}
		$.ajax({
			url : "ajax_QA",
			type : "POST",
			data : form,
			success : function(result){
				let html = "<table class='bordertable1'>";
				html +="<tr style='border-top: 1px solid white;'><td colspan='5'<b>총"+${totalqa}+" 개의 리뷰가 등록되어있습니다.</b></td></tr><tr></tr>" 
				+"<tr id='boardtitle'><th>번호</th><th>제목</th><th>작성자</th>"
				+"<th>작성일</th><th style='display: none;'>코드번호</th></tr>"	
				
			 	if(result.length == 0){     
			 		html +="<tr><th colspan='4' style='padding:30px;'>작성하신 Q&A가 없습니다.</th></tr>"
		       	}else{
		       		for(var i=0;i<result.length;i++){
		       		html+="<tr class='contentqa' id='rvtablebody'><th style='width: 10%;'>"+result[i].rn+"</th>"+
						"<th id='"+result[i].indexnum+"' style='width: 60%;' onclick='qna(this.id)'>"+result[i].title+" "
						if(result[i].indexcnt!=null){
							html+="<span style='color:blue'>["+result[i].indexcnt+"]</span></th>"
							console.log("진입하였습니다. 널값아님" + result[i].indexcnt);
						}else{
							html+="</th>"
							console.log("진입하였습니다. 널값"+result[i].indexcnt);}
						
						html+="<th style='width: 10%;'>"+result[i].name+"</th>"+
						"<th style='width: 10%;'>"+chahgeDate(result[i].writeDate)+"</th>"+
						"<th style='display: none;'>"+result[i].code+"</th></tr></tr>"
		       		}
		       	}
				html+="</table>"
				html+="<div class='pagingdiv'><div class='paging'>"
				calcstartqaendqaPageqa(pageqa);
				if(startPageqa!=1){
					html+="<span onclick='QAPaging("+(startPageqa-1)+")'><a> 이전 </a></span>"
					}
				for(var k=startPageqa; k<=lastPageqa;k++){
					html+="<span id='"+k+"' onclick='QAPaging(this.id)'><a> "+ k +" </a></span>"
					}
				if(lastPageqa!=endpageqa){
					html+="<span onclick='QAPaging("+(lastPageqa+1)+")'><a> 다음 </a></span>"
					}
				html+="</div></div>"
				$("#QAtablediv").html(html);
			},
		error : function() {
			alert("문제가 발생 했습니다!!");
		}

		       	});	
		
		}
	/*2. Q & A  페이지 시작, 끝 페이지 계산*/
		function calcstartqaendqaPageqa(pageqa){
			lastPageqa = (Math.ceil(pageqa / cntPageqa)) * cntPageqa;
			if(lastPageqa > endpageqa){
				lastPageqa=endpageqa;
			}
			startPageqa = lastPageqa  - cntPageqa +1;
			if(startPageqa<1) startPageqa=1;
		
	}
	
	
	function sizebuttonclick(clicked_id){
		var radio = clicked_id*10;
		if(${sdto.size230>0}){
			document.getElementById("230").className = "button5";
		}
		if(${sdto.size240>0}){
			document.getElementById("240").className = "button5";
		}
		if(${sdto.size250>0}){
		document.getElementById("250").className = "button5";
		}
		if(${sdto.size260>0}){
		document.getElementById("260").className = "button5";
		}
		if(${sdto.size270>0}){
		document.getElementById("270").className = "button5";
		}
		if(${sdto.size280>0}){
		document.getElementById("280").className = "button5";
		}
		if(${sdto.size290>0}){
		document.getElementById("290").className = "button5";
		}
		if(${sdto.size300>0}){
		document.getElementById("300").className = "button5";
		}
		if(${sdto.size310>0}){
		document.getElementById("310").className = "button5";
		}
		if(${sdto.size320>0}){
		document.getElementById("320").className = "button5";
		}
		if(${sdto.size330>0}){
		document.getElementById("330").className = "button5";
		}
		if(document.getElementById(clicked_id).className == "button5"){
			document.getElementById(clicked_id).className = "button6";
			document.getElementById(radio).checked = true;
		}else if(document.getElementById(clicked_id).className == "button6"){
			document.getElementById(clicked_id).className = "button5";
		}
	
	}
	
	function sizebuttonclick2(clicked_id){
		var radio = clicked_id*10;
		if(${sdto.size80>0}){
			document.getElementById("80").className = "button5";
		}
		if(${sdto.size90>0}){
			document.getElementById("90").className = "button5";
		}
		if(${sdto.size100>0}){
		document.getElementById("100").className = "button5";
		}
		if(${sdto.size110>0}){
		document.getElementById("110").className = "button5";
		}
		if(${sdto.size120>0}){
		document.getElementById("120").className = "button5";
		}
		if(${sdto.size130>0}){
		document.getElementById("130").className = "button5";
		}
		if(${sdto.size140>0}){
		document.getElementById("140").className = "button5";
		}
		if(${sdto.size150>0}){
		document.getElementById("150").className = "button5";
		}
		if(${sdto.size160>0}){
		document.getElementById("160").className = "button5";
		}
		
		if(document.getElementById(clicked_id).className == "button5"){
			document.getElementById(clicked_id).className = "button6";
			document.getElementById(radio).checked = true;
		}else if(document.getElementById(clicked_id).className == "button6"){
			document.getElementById(clicked_id).className = "button5";
		}
	
	}
	function sizebuttonclick2(clicked_id){
		var radio = clicked_id*10;
		document.getElementById("80").className = "button5";
		document.getElementById("90").className = "button5";
		document.getElementById("100").className = "button5";
		document.getElementById("110").className = "button5";
		document.getElementById("120").className = "button5";
		document.getElementById("130").className = "button5";
		document.getElementById("140").className = "button5";
		document.getElementById("150").className = "button5";
		document.getElementById("160").className = "button5";
		if(document.getElementById(clicked_id).className == "button5"){
			document.getElementById(clicked_id).className = "button6";
			document.getElementById(radio).checked = true;
		}else if(document.getElementById(clicked_id).className == "button6"){
			document.getElementById(clicked_id).className = "button5";
		}
	
	}

	function chageSrc(obj){
  			var imgId = obj.id;
  			var imgName =obj.src;
   			imgName = imgName.toLowerCase();
   			var firstName = imgName.substring(0, imgName.indexOf('.') + 1);
   			var lastName = imgName.substring(imgName.indexOf('.') + 1);
   			lastName = lastName.toUpperCase();
   			var changeName = firstName + lastName;
   			document.getElementById(imgId).src = changeName;
   		}
   		
   		function clickminus(){
   			var count = document.getElementById("count")
   			if(count.value<=0){
   				alert('수량은 1개 이상부터 구입할 수 있습니다.')
   			}else{
   				count.value--;
   			}
   		}
   		
   		function clickplus(){
   			var count = document.getElementById("count")
   			if(count.value>=3){
   				alert('수량은 3개 이상 구입할 수 없습니다.')
   			}else{
   				count.value++;
   			}
   		}

   		
		
   		
   		/*qa제목클릭*/
			function qna(clickid){
   			console.log(clickid);
  			location.href="/nike/qnaview?indexnum="+clickid+"&code="+'${pdto.code}';
   		}
   		
   		/*리뷰 제목 클릭*/
   			function reviewclick(obj){
   			location.href="/nike/reviewsearch?reviewnum="+obj.className;
   		}
   		
		/*날짜 변환 함수*/
		function chahgeDate(date){
			date =  new Date(parseInt(date));
			year = date.getFullYear();
			month = date.getMonth();
			day = date.getDate();
			hour = date.getHours();
			minute = date.getMinutes();
			second = date.getSeconds();
			strDate = year+"-"+month+"-"+day;
			return strDate;
			
		}
		
		
</script>
<script type="text/javascript">
		function buttoncheck(){
			console.log("aaaaaaaaaaaaaaaaaaaaaaaaaaa");
			if(!document.fo.ordersize.value){
				alert("사이즈를 선택해주세요!!!");
				return false;
			}
			
		}
	</script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body onload="start();RVPaging(1);QAPaging(1)">
	<header>
		<c:import url="../sminj/header.jsp">
		</c:import>
	</header>
	<section class="wrapper">
		<section class="content-area" style="height: 80%;">
			<section>
				<article>
					<article class="contents-area contents">
						<input type="hidden" name="add" id="noadd" value="${noadd}">
						<div class="img-detail_product_n">
							<ul id="product-gallery" class="img-detail-list">
								<li class="image-list" style="float: left;">
										<img id="${pdto.image1 }" class="product-image"
											src="${pdto.image1 }" 
											onerror="this.onerror=null; chageSrc(this)">
								</li>
								<li class="image-list"
									style="float: right; margin-right: 100px;">
										<img id="${pdto.image2 }" class="product-image"
											src="${pdto.image2 }"
											onerror="this.style.display='none'" alt=""/>
								</li>
							</ul>
							<ul class="img-detail-list">
								<li class="image-list" style="float: left;">
										<img id="${pdto.image3 }" class="product-image"
											src="${pdto.image3 }"
											onerror="this.style.display='none'" alt=""/>
								</li>
								<li class="image-list"
									style="float: right; margin-right: 100px;">
										<img id="${pdto.image4 }" class="product-image"
											src="${pdto.image4 }"
											onerror="this.style.display='none'" alt=""/>
								</li>
							</ul>
							<ul class="img-detail-list">
								<li class="image-list" style="float: left;">
										<img id="${pdto.image5 }" class="product-image"
											src="${pdto.image5 }"
											onerror="this.style.display='none'" alt=""/>
								</li>
								<li class="image-list"
									style="float: right; margin-right: 100px;">
										<img id="${pdto.image6 }" class="product-image"
											src="${pdto.image6 }"
											onerror="this.style.display='none'" alt=""/>
								</li>
							</ul>
						</div>
						<div class="info-wrap_product_n">
							<div class="product-option-container">
								<div class="uk-hidden-small uk-position-relative">
									<div class="price-wrap">
										<div class="uk-float-left"
											style="display: inline-block; float: left;">
											<div class="product-subtitle">
												<span class="text-color-secondary"
													style="font-size: 15px; color: #111;"> <c:if
														test="${pdto.category=='run' }">런닝</c:if> <c:if
														test="${pdto.category=='soccer' }">축구</c:if> <c:if
														test="${pdto.category=='basket' }">농구</c:if>
												</span>
											</div>
										</div>
										<div class="uk-float-right"
											style="display: inline-block; margin-left: 300px;">
											<span class="price"> <strong> <script
														type="text/javascript">
													var price = ${pdto.price};
													document.write(price.toLocaleString()+' 원');
												</script>
											</strong>
											</span>
										</div>
									</div>
									<h1 class="title-wrap">
										<span class="tit" style="font-size: 30px; color: #000;">${pdto.codename }</span>
									</h1>
								</div>
								<div class="pinfo-item-box">
									<form name="fo" method="GET" onsubmit="return buttoncheck()">
										<input type="hidden" name="code" value="${pdto.code }">
										<div class="option-wrap">
											<div class="size-grid-type padding radius">
												<strong class="tit">사이즈 선택</strong>
												<div class="product-option_radio square">
													<div class="opt-list">
														<!-- input type="hidden" id="ordersize" class="ordersize" name="ordersize"-->
														<c:choose>
															<c:when test="${pdto.gender!='키즈'}">
																<c:forEach var="ordersize" begin="230" end="330" step="10">
																	<button type="button" class="button5" name="ordersize"
																		 id="${ordersize}" 
																		onclick="sizebuttonclick(this.id)">${ordersize}</button>
																	<input type="radio" id="${ordersize*10 }"
																		name="ordersize" value="${ordersize }" hidden="">
																	<c:if test="${ordersize%270 eq 0 || ordersize%320 eq 0}">
																		<br>
																	</c:if>
																</c:forEach>
															</c:when>
															<c:otherwise>
																<c:forEach var="ordersize" begin="80" end="160" step="10">
																	<input type="button" class="button5" name="ordersize" value="${ordersize}" id="${ordersize}" onclick="sizebuttonclick2(this.id)">
																	<input type="radio" id="${ordersize*10 }" name="ordersize" value="${ordersize }" hidden="" >
																	<c:if test="${ordersize%120 eq 0}">
																	<br>
																	</c:if>
																</c:forEach>
															</c:otherwise>
														</c:choose>
													</div>
												</div>
											</div>
											<div class="stocked-wrap line" id="set-restock-alarm"
												style="display: block"></div>
											<div class="quantity" style="margin-bottom: 15px;">
												<h2 class="tit">
													<span>수량</span> <span class="msg"></span>
												</h2>
												<span class="btn-qy"> <input id="count" name="count"
													class="label" type="text" value="1">
													<button type="button" class="btn-minus"
														style="width: 20px; border: 1px solid #EAEAEA; background-color: #EAEAEA; font-size: 15px;"
														onclick="clickminus()">-</button>
													<button type="button" class="btn-plus"
														style="width: 20px; border: 1px solid #EAEAEA; background-color: #EAEAEA; font-size: 15px;"
														onclick="clickplus()">+</button>
												</span>
											</div>
										</div>
										<div class="btn-group-box line type2">
											<div>
												<div class="status-wrap btn-wrap radius">
													<div class="order-wrap">
														<input class="directorder" type="submit" value="바로구매"
															formaction="checkoutQuick"> <input type="submit"
															class="shoppingcart" value="장바구니" formaction="cartSave">
													</div>
												</div>
											</div>
										</div>
									</form>
								</div>
								<div class="store-reserve-wrap radius">
									<span class="ns-store icon"></span> <span
										class="btn-storereserve">배송보다 빠른, 매장픽업 서비스</span>
									<div class="store-reserve-info">
										<span>지금 주문하고, 매장에서 바로 픽업하세요.</span>
									</div>
								</div>
								<div class="discription-wrap uk-accordian"
									data-uk-accordian="{collapse:true}">
									<div class="pop-detail-content">
										<div class="description conTab" id="pdp-description-summary"
											data-info-height="{outerHeight:456, infoType:product-detail}"></div>
										<div class="description-preview">
											<p>
												<b>${pdto.contents }</b>
											</p>
											<br>
										</div>
										<span class="style-color">현재 컬러 : ${pdto.codecolor }<br></span>
										<span class="style-code">스타일 : ${pdto.code }<br></span>
									</div>
									<h2 class="pop-detail-title uk-accordian-title uk-active"
										data-click-toggle-on="off" data-click-area="pdp"
										data-click-name="review_learn more">
										리뷰 <span class="review-num">(4)</span>
										<div class="review-wrap">
											<span class="like" style="display: none"> <i
												class="icon-star 5 per" style="width: 85.0%">☆☆☆☆☆</i>
											</span>
										</div>
									</h2>
								</div>
							</div>
							<h2 class="pop-detail-title uk-accordian-title"
								data-click-toggle-on="off" data-click-area="pdp"
								data-click-name="delivery_learn_more">
								배송 <span class="sub-title-wrap">일반배송 / 오늘도착</span>
							</h2>
							<div data-wrapper="true" class="accordian-wrapper"
								aria-expanded="true" style="height: auto">
								<div class="pop-detail-content uk-accordian-content uk-active">
									<h3 class="detail-content-title uk-margin-top-remove">일반배송
										안내</h3>
									<ul class="detail-content-list">
										<li>배송지역 : 전국(일부 지역 제외)</li>
										<li>배송비 : 상품의 구매금액에 상관없이 모든 상품 무료배송</li>
										<li>배송기간 : 결제 후 3일 이내 (토요일, 공휴일 제외)</li>
									</ul>
									<h3 class="detail-content-title">
										오늘도착 안내 <span class="flag-sameday">나이키멤버 전용</span>
									</h3>
									<ul class="detail-content-list">
										<li>서비스 가능 시간 : 00시부터 13시까지 결제하시면 주문 당일 도착합니다.</li>
										<li>서비스 가능 제품 : 상품 상세 페이지의 <i class="icon-somday"></i>&nbsp;
											<span class="flag-someday">오늘도착</span> 아이콘이 표기되는 제품
										</li>
										<li>서비스 이용 방법 : 결제화면 배송선택 옵션을 통해 "오늘도착" 배송을 이용하실 수 있습니다.
										</li>
										<li>오늘도착 가능 지역 : 제품 수령지가, 서울특별시 전에 혹은 경기도 성남시 분당구에 한함</li>
										<li>배송 가능 지역 : 서울．분당 지역에 한해 배송됩니다.</li>
										<li>서비스 비용 : 5,000원</li>
										<li>주문 가능 수량 : 1회 주문 시, 최대 상품 2개</li>
									</ul>
								</div>
							</div>
							<h2 class="pop-detail-title uk-accordian-title uk-active"
								data-click-toggle-on="off" data-click-area="pdp"
								data-click-name="return_learn more">
								반품/AS <span class="sub-title-wrap">온라인 접수 / 매장 접수</span>
							</h2>
							<div data-wrapper="true" class="accordian-wrapper"
								aria-expended="true" style="height: auto";>
								<div class="pop-detail-content uk-accordian-content uk-active">
									<h3 class="detail-content-title uk-margin-top-remove">무료반품서비스</h3>
									<ul class="detail-content-list">
										<li>상품의 구매금액에 상관없이 무료반품서비스를 제공하고 있습니다.</li>
									</ul>
									<h3 class="detail-content-title">매장 반품 접수</h3>
									<ul>
										<li>나이키 닷컴에서 구매하신 제품은 가까운 나이키 매장에서 반품 접수가 가능합니다. (일부 매장
											제외)</li>
										<li>대표 매장 : 강남점, 명동점, 타임스퀘어점, 코엑스점, 롯데월드 타워점</li>
										<li>반품점수 가능 <a class="btn-more-pop" href="#">전체
												ASSIST SERVICE 매장 확인하기</a>
										</li>
									</ul>
									<h3 class="detail-content-title">반품 안내</h3>
									<ul class="detail-content-list">
										<li>반품접수는 상품 수령 후 7일 이내에 상품 미훼손 및 미사용한 경우에만 해당됩니다.</li>
										<li>색상/사이즈 불만족, 고객 변심 반품의 경우, 오늘도착 서비스 (배송)비용에 대한 배송비는
											환불되지 않음을 유의해 주시기 바랍니다.</li>
									</ul>
									<h3 class="detail-content-title">AS 안내</h3>
									<ul class="detail-content-list">
										<li>나이키닷컴에서 구매하신 제품에 대해 A/S 접수를 원하실 경우에는 1:1 이메일 문의와
											나이키닷컴 고객센터(TEL : 080-022-0182)를 이용해주세요.</li>
									</ul>
									<h3 class="detail-content-title">미성년자 권리보호 안내</h3>
									<ul class="detail-content-list">
										<li>미성년 고객께서 상품을 주문(계약) 하시는 경우, 법정대리인(부모님 등)의 동의가 없으면
											미성년자 본인 또는 법정대리인(부모님 등)이 그 주문(계약)을 취소하실 수 있습니다.</li>
									</ul>
								</div>
							</div>
						</div>
						</div>
						</div>
						</div>
						
					</article>
				</article>
			</section>
		</section>
	</section>
	<div class="reviewTitle" style="margin-top: 100px;">
		<h2 align="center">REVIEW</h2>
		<br>
		<div id="rvtablediv"></div>
		
	</div>
	<br>
	<br>

	<div class="QATitle">
		<h2 align="center">Q & A</h2>
		<br>
		<div id="QAtablediv"></div>
	</div>
	<footer>
		<c:import url="../sminj/footer.jsp">
		</c:import>
	</footer>
</body>
</html>