var start = Date.now()

$(document).ready(function(){
	var title = $(document).find("title").text();
	var loaded = Date.now()
	var pageLoaded = loaded - start
	
	var link = {}
	$("a").click(function(event){
		link = event.target.href
	})
	
	$(window).on('beforeunload', function(event) {
		var duration = Date.now() - pageLoaded
		
		$.ajax({
			url: 'http://localhost:8080/nod/q/a',
			type: "post",
			data : {
				c: "102935273ALSKJD",
				application: "R",
				title : title,
				pageLoaded: pageLoaded,
				page : window.location.pathname,
				duration: duration,
				link : link
			},
			error : function(a, o){
				console.log(a, o)
			}
		})		
		//return ""	
	}); 
})