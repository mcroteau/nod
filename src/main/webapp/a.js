var start = Date.now()

$(document).ready(function(){
	var title = $(document).find("title").text();
	var loaded = Date.now()
	var loadTime = loaded - start
	
	var link = {}
	$("a").click(function(event){
		link = event.target.href
	})
	
	$(window).on('beforeunload', function(event) {
		var duration = Date.now() - loaded
		
		$.ajax({
			url: 'http://localhost:8080/nod/q/a',
			type: "post",
			data : {
				c: "2039481029431029843",
				application: "R",
				title : title,
				loadTime: loadTime,
				duration: duration,
				page : window.location.pathname,
				link : link
			},
			error : function(a, o){
				console.log(a, o)
			}
		})		
		//return ""	
	}); 
})