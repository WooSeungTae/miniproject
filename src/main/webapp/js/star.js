/*별점 : .star-input*/
/*출처 : http://codepen.io/naradesign/pen/zxPbOw*/
var starRating = function(){
var $star = $(".star_input"),
    $result = $star.find("output>b");
	
  	$(document)
	.on("focusin", ".star_input>.input", 
		function(){
   		 $(this).addClass("focus");
 	})
		 
   	.on("focusout", ".star_input>.input", function(){
    	var $this = $(this);
    	setTimeout(function(){
      		if($this.find(":focus").length === 0){
       			$this.removeClass("focus");
     	 	}
   		}, 100);
 	 })
  
    .on("change", ".star_input :radio", function(){
    	$result.text($(this).next().text());
  	})
    .on("mouseover", ".star_input label", function(){
    	$result.text($(this).text());
    })
    .on("mouseleave", ".star_input>.input", function(){
    	var $checked = $star.find(":checked");
    		if($checked.length === 0){
     	 		$result.text("0");
   		 	} else {
     	 		$result.text($checked.next().text());
    		}
  	});
};

starRating();