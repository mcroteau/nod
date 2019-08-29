var APPLICATION = "Hilo",
    SECRET_KEY = "3aLe6zI0GW"

var start = Date.now()

$(document).ready(function(){
        
        var link = {}
        
        var title = $(document).find("title").text(),
            loaded = Date.now()
            loadTime = loaded - start


        $("a").click(function(event){
            link = event.target.href
        })

        $(window).on('beforeunload', function(event) {
                var duration = Date.now() - loaded

                $.ajax({
                        url: 'http://104.207.157.132:8080/nod/abc/a',
                        type: "post",
                        data : {
                                c: SECRET_KEY,
                                application: APPLICATION,
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
        });

})
