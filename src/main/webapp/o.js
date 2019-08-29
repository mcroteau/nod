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
                                c: "3aLe6zI0GW",
                                application: "R",
                                title : title,
                                loadTime: loadTime,
                                page : window.location.pathname,
                                duration: duration,
                                link : link
                        },
                        error : function(d, o){
                                console.log(d, o)
                        }
                })
                //return ""     
        });
})

