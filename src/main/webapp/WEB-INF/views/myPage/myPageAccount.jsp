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
		}
		.customer-contents{
			float:left; width(100% - 265px); margin-top:-24px;
		}
		.title{
			font-size:23px; color:#111111; font-weight:bold;
		}
		.uk-grid{
			margin-left:-20px;
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
		.input-textfield.disabled > input{
			background-color:#eeeeee;
			color:#a5a5a5;
		}
	</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<section class="wrapper">
	<div style="width: 60%; margin: auto; padding-top: 80px;">
		<c:import url="/aside"></c:import>
		<div class="customer-contents">
			<h2 class="title">회원정보 수정</h2>	
				<div>
					<div class="uk-grid">
						<div class="uk-width-medium">
							<div class="dynamic-form">
								<form action="memberinfoModify" method="post">
									<div class="uk-form-row">
										<label class="uk-form-label">아이디</label>
										<div class="input-textfield">
											<input type="text" id="id" name="id" readonly="readonly" value="jeongseonju15@gmail.com">
										</div>
									</div>
									<div class="uk-form-row">
										<label class="uk-form-label">이름</label>
										<div class="input-textfield">
											<input type="text" id="name" name="name" readonly="readonly" value="정선주">
										</div>
									</div>
									<div class="uk-form-row">
										<label class="uk-form-label">주소</label>
										<div class="input-textfield">
											<input type="text" id="address" name="address" value="서울시 동대문구 이문동">
										</div>
									</div>
									<div class="uk-form-row">
										<label class="uk-form-label">휴대폰</label>
										<div class="input-textfield">
											<input type="text" id="tel" name="tel" value="010-2558-3282">
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
												<span class="label">이메일을 통한 상품 및 이벤트 정보 수신에 동의합니다.(선택)</span>
											</span>
										</div>
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