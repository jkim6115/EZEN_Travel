$(document).ready(function() {
	$('.tag_fillter_list li').click(function() {
		var tagValue = $(this).attr("value");
		$.ajax({
  			url: "./tagmap.do",
  			type: "POST",
  			dataType: "json",
  			success: function (data) {
    		console.log(data);
  		},
  		error: function () {
    	alert("error");
  		},
});   		
	}) 
})
