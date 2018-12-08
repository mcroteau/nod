<!doctype html>
<html lang="en" class="no-js">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <title>
        <g:layoutTitle default="Grails"/>
    </title>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <asset:link rel="icon" href="favicon.ico" type="image/x-ico" />

	<link rel="stylesheet" href="https://cdn.concisecss.com/concise.min.css">
	<style type="text/css">
		body{
			padding:10px;
		}
		html, body, th,
		td{
			font-size:0.9em;
			line-height:1.2em !important;
		}
		button, input[type=submit]{
			font-size:0.9em !important;
			line-height:1.2em !important;
			padding:10px 15px !important;
			
		}
		table{
			min-width:0px;
		}
		th{
			line-height:1.2 !important;
		}
	</style>
		
    <g:layoutHead/>
</head>
<body>
	
	<g:link controller="q" action="nods">Nods</g:link>
	<g:link controller="q" action="triage">Triage</g:link>
	

    <g:layoutBody/>


    <div id="spinner" class="spinner" style="display:none;">
        <g:message code="spinner.alt" default="Loading&hellip;"/>
    </div>

    <asset:javascript src="application.js"/>

</body>
</html>
