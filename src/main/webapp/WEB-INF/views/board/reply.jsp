<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
					html+="<b>작성자 : "+result[i].writer +"&nbsp;&nbsp;&nbsp;&nbsp; </b> 작성일 : "+
					result[i].registerdate+"<input type='hidden' id = 'idcheck' value=''>"
					if('${sessionScope.id }'==result[i].id){
					html+="<b><span class ='"+result[i].numComment+result[i].writer+"'  onclick='modifycontent(this.className)' style='text'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;▶ 수정하기 &nbsp; &nbsp;</span>&nbsp;&nbsp;"
					+"<span class='"+result[i].indexnum+"' id ='"+result[i].numComment+"'  style='text-align: right;' onclick='replyDelete(this)'>▷ 삭제하기 </span></b><h3>"
					+result[i].contentComment +"</h3><hr><br>"+"<div id ='"+result[i].numComment+result[i].writer+"' style='display:none ;'><textarea  id ='"+result[i].numComment+result[i].id+"'name ='contentComment' style='width: 98%;' rows='4' cols=''>"+result[i].contentComment+"</textarea>"
					+"<div align='right'><button class='"+result[i].indexnum+"' id ='"+result[i].numComment+"' style='text-align: right;' onclick='replyUpdate(this)'>수정완료</button></div></div><br>"
					}else{
						html+="<h3>"+result[i].contentComment +"</h3><hr><br>"
					}
				}
			$('.replycontent').html(html);
			},
			error : function() {
				alert("문제가 발생 했습니다!!");
			}
		});
	}

	
	
	/*등록후 댓글 불러오기*/

	function ajax_comment() {
		var nullckeck = document.getElementById("commentcontent").value;
		if (!nullckeck) {
			alert("댓글을 입력하여 주세요")
			return;
		} else {
			$.ajax({
				url : "replyregister",
				type : "POST",
				data : $("#fo").serialize(),
				success : function(result) {
					list();
					document.getElementById("commentcontent").value ='';
				},
				error : function() {
					alert("문제가 발생 했습니다!!");
				}
			});
		}
	}
	
	
	/*댓글 수정하기 위한 창 display:""*/
	function modifycontent(contid){
		var select = document.getElementById(contid);
		console.log(select.style.display);
		if(select.style.display=='none'){
			select.style.display="";
		}else{
		select.style.display="none";
		}
	}
	
	/*댓글 수정후 불러오기*/
	
	function replyUpdate(obj){
		var contentid=obj.id+'${sessionScope.id}';
		console.log(contentid);
		var content = document.getElementById(contentid).value;
			form = {
				contentComment : content, 	
				numComment : obj.id,
				indexnum : obj.className	
			}		
			console.log(content);
			console.log(form);
		$.ajax({
			url : "replyUpdate",
			type : "POST",
			data : form,
			success : function(result) {
				list();
				alert("수정되었습니다.")
			},
			error : function(result) {
				console.log(result);			
				alert("문제가 발생 했습니다!!");
			}
		});
	}
	
	/*댓글 삭제*/
	
	function replyDelete(obj){
		var contentid=obj.id;	
		form = {
				numComment : obj.id,	
				indexnum : obj.className
			}	
		var content = document.getElementById(contentid).value;
		$.ajax({
			url : "replyDelete",
			type : "POST",
			data : form,
			success : function(result) {
				list();
			},
			error : function(result) {
				console.log(result);			
				alert("문제가 발생 했습니다!!");
			}
		});
	}
	
</script>
<style type="text/css">
	/*리플 css*/
	.replycontent{
		text-align: left;
	}

</style>
</head>
<body onload="list()">
<form id ="fo" method="post">
<div>
<div class="replyset">
<h3 align="left">Comments </h3>
<hr>
<textarea  id ="commentcontent"name = "contentComment" style="width: 98%;" rows="4" cols=""></textarea>
<input type="hidden" name = "indexnum" value = "${param.indexnum }">
<input type="hidden" name = "writer" value = "${sessionScope.name }"> 
<input type="hidden" name = "id" value = "${sessionScope.id }">
</div>
<div align="right" ><input style="margin-right: 2%;" type="button" value="등록" onclick="ajax_comment()"></div>
</div>


</form>
<div class="replycontent"></div>
</body>
</html>