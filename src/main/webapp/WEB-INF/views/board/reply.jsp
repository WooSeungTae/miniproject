<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<script type="text/javascript" src="js/jquery-3.4.1.min.js"></script>
<script type="text/javascript" src="js/jquery-1.11.3.min.js"></script>
<script type="text/javascript">

/*시작시 댓글 불러오기*/
	//$(document).ready(function(){
	function list(){
		var form = {
				indexnum : '${param.indexnum }'		
		}
		
		$.ajax({
			url : "replyview",
			type : "POST",
			data :form,
			success : function(result){
				let html = "";
				for(var i=0;i<result.length;i++){
					html+="<h3>작성자 : "+result[i].writer +"&nbsp;&nbsp; 작성일 : "+result[i].registerdate+"</h3>"+
					"<h3>"+result[i].contentComment +"</h3><hr><br>"
				}
			$('.replycontent').html(html);
			},
			error : function() {
				alert("문제가 발생 했습니다!!");
			}
		});
	}
	/*등록후 댓글 불러오기*/
	
	function ajax_comment(){
		
	if(document.getElementById("commentcontent").innerHTML==''){
		alert('댓글 내용을 입력하세요');
	}
	document.getElementById("commentcontent").value='';
	$.ajax({
		url : "replyregister",
		type : "POST",
		data :$("#fo").serialize(),
		success : function(result){
			list();
	             
		},
		error : function() {
			alert("문제가 발생 했습니다!!");
		}
	});
}

</script>
</head>
<body onload="list()">
<form id ="fo" method="post">
<div>
<div>
<h3>Comments </h3>
<hr>
<textarea  id ="commentcontent"name = "contentComment" style="width: 98%;" rows="7" cols=""></textarea>
<input type="hidden" name = "indexnum" value = "${param.indexnum }">
<input type="hidden" name = "writer" value = "${sessionScope.name }"> 
</div>
<div align="right" ><input style="margin-right: 2%;" type="button" value="등록" onclick="ajax_comment()"></div>
</div>
</form>
<div class="replycontent"></div>
</body>
</html>