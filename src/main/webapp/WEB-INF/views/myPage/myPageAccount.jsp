<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<style>
		.wrapper{
			font-family:"Noto Sans KR", "Malgun Gothic", "MalgunGothic" "Dotum", Helvetica, Arial, sans-serif;
			color:#111;
			height:550px;
		}
		.customer-contents{
			width:(100% - 265px); margin-top:-24px; margin-left:20px;
			
		}
		.title{
			font-size:23px; color:#111111; font-weight:bold; align:center;
		}
		.uk-grid{
		}
		.uk-width-medium{
			width:50%;
		}
		.uk-form-label{
			display:block; margin-bottom:8px; font-size:11px;
		}
		.input-textfield{
			width:100%;
		}
		.text1{
			background-color:#eeeeee;
			color:#a5a5a5;
			width:550px;
			border-radius:2px;
		}
		.text2{
			width:550px;
			border-radius:2px;
		}
		.uk-form-row{
			margin-top:10px;
		}
		.uk-button{
			margin-top:20px;
		}
		.submit{
			height:48px;
			font-size:15px;
			padding:16px 50px;
			color:#fff;
			background-color:#000000;
			cursor:pointer;
			border-radius:2px;
			width:550px;
		}
		.input-form-group{
			width:550px;
		}
	</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<header>
		<c:import url="/header">
		</c:import>
	</header>
	<section class="wrapper">
		<aside>
			<c:import url="/aside">
			</c:import>
		</aside>
		<div style="width: 75%; margin: auto; padding-top: 80px; float:right;">
			<div class="customer-contents" >
				<h2 class="title">회원정보 수정</h2>	
					<div>
						<div class="uk-grid">
							<div class="uk-width-medium">
								<div class="dynamic-form">
									<form action="memberinfoModify" method="post">
										<div class="uk-form-row">
											<label class="uk-form-label">아이디</label>
											<div class="input-textfield">
												<input class="text1" type="text" id="id" name="id" readonly="readonly" value="${dto.id }">
											</div>
										</div>
										<div class="uk-form-row">
											<label class="uk-form-label">이름</label>
											<div class="input-textfield">
												<input class="text1" type="text" id="name" name="name" readonly="readonly" value="${dto.name }">
											</div>
										</div>
										<div class="uk-form-row">
											<label class="uk-form-label">주소</label>
											<div class="input-textfield">
												<input class="text2" type="text" id="address" name="address" value="${dto.address }">
											</div>
										</div>
										<div class="uk-form-row">
											<label class="uk-form-label">휴대폰</label>
											<div class="input-textfield">
												<input class="text2" type="text" id="tel" name="tel" value="${dto.tel }">
											</div>
										</div>
										<div class="uk-form-row">
											<div class="input-form-group">
												<span class="input-checkbox">
													<input type="checkbox" id="receiveEmail" name="receiveEmail" checked="checked">
													<span class="label">이메일을 통한 상품 및 이벤트 정보 수신에 동의합니다.(선택)</span>
												</span>
											</div>
										</div>
										<div class="uk-form-row">
											<div class="input-form-group">
												<span class="input-checkbox">
													<input type="checkbox" id="receiveEmail" name="receiveEmail" checked="checked">
													<span class="label">휴대폰을 통한 상품 및 할인쿠폰 등의 정보 수신에 동의합니다.(선택)</span>
												</span>
											</div>
										</div>
										<div class="uk-button">
											<button class="submit" type="submit">수정하기</button>
										</div>
									</form>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>
		<footer>
			<c:import url="/footer">
			</c:import>
		</footer>
</body>
</html>