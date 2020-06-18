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
<script src='js/autosize.js'></script> 
<script>autosize(document.querySelectorAll('textarea'));</script> 
<script type="text/javascript">
	var textEleHeight="";

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
				let html = "<b>총"+result.length+" 개의 댓글이 등록되어있습니다.</b><br><br>";
				for(var i=0;i<result.length;i++){
					html+="<b>작성자 : "+result[i].writer +"&nbsp;&nbsp;&nbsp;&nbsp; </b> 작성일 : "+
					result[i].registerdate+"<input type='hidden' id = 'idcheck' value=''>"
					if('${sessionScope.id }'==result[i].id){
					html+="<b><span class ='"+result[i].numComment+result[i].writer+"'  onclick='modifycontent(this.className)' style='text'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;▶ 수정하기 &nbsp; &nbsp;</span>&nbsp;&nbsp;"
					+"<span class='"+result[i].indexnum+"' id ='"+result[i].numComment+"'  style='text-align: right;' onclick='replyDelete(this)'>▷ 삭제하기 </span></b>"
					+"<br><br><textarea class='textareacss' style='border: none;' disabled rows='4' >"+result[i].contentComment +"</textarea><hr><br><div id ='"+result[i].numComment+result[i].writer+"' style='display:none;'><textarea  id ='"
					+result[i].numComment+result[i].id+"'name ='contentComment' onkeydown='resize(this)' onkeyup='resize(this)' class='modifytextareacss' style='width: 98%;'>"+result[i].contentComment+"</textarea>"
					+"<div align='right'><button class='"+result[i].indexnum+"' id ='"+result[i].numComment+"' onclick='replyUpdate(this)' style='text-align: right; background-color: #e9e9e9;border: none;color: black;padding: 8px 24px;"+
					"text-align: center;text-decoration: none; font-size: 16px;font-weight : 900;border-radius: 8px; margin-right:20px;'>수정완료</button></div></div><br>"
					}else{
						html+="<br><br><textarea class='textareacss' id ='"+result[i].numComment+"' style='border: none;' disabled rows='4' >"+result[i].contentComment +"</textarea><hr><br>"
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
	
	/*textarea 내용물 높이 맞추기*/
	function resize(obj) {
	  obj.style.height = "1px";
	  obj.style.height = (12+obj.scrollHeight)+"px";
	}

	
</script>
<style type="text/css">
	/*리플 css*/
	.replycontent{
		text-align: left;
	}
	/*textarea Css*/
	.textareacss{
	resize: none;
	width: 98%;
	height: auto;
	font-size: 15px;
	font-weight: bolder;
	}
	
	/*댓글 등록  div*/
	.submitrelpy{
	background-color: #e9e9e9; 
	color: black; 
	font-size:20px;
	font-weight: bold;
	text-align: center; 
	padding: 5px;
	width: 98%;

	}

</style>
</head>
<body onload="list()">
<form id ="fo" method="post">

<div class="replyset">
<h3 align="left">Comments </h3>
<hr style="color: #ddd; ">
<div align="center">
<textarea  id ="commentcontent"name = "contentComment"  onkeydown="resize(this)" onkeyup="resize(this)" style="width: 98%; resize: none; margin: auto;" rows="4" cols="" ></textarea>
<input type="hidden" name = "indexnum" value = "${param.indexnum }">
<input type="hidden" name = "writer" value = "${sessionScope.name }"> 
<input type="hidden" name = "id" value = "${sessionScope.id }">
<c:if test="${sessionScope.id!=null}"><div class='submitrelpy' onclick="ajax_comment()">댓글 등록</div></c:if>
<c:if test="${sessionScope.id==null}"><div class='submitrelpy'>로그인 한 사용자만 댓글 등록이 가능합니다.</div></c:if>

</div>
</div>
<br><br>


</form>
<div class="replycontent"></div>
</body>
</html>