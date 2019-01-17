

<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<title>Nod</title>
		<link rel="stylesheet" href="https://cdn.concisecss.com/concise.min.css">
	</head>
	<body>

		<div id="list-catalog" class="content scaffold-list" role="main">
			
			<h2 class="">Running Instances</h2>
			
			<g:if test="${flash.error}">
				<br/>
				<div class="alert alert-danger" role="status">${flash.error}</div>
			</g:if>
			
			<g:if test="${flash.message}">
				<br/>
				<div class="alert alert-info" role="status">${flash.message}</div>
			</g:if>
			
			
			<g:if test="${runningInstances?.size() > 0}">
				<table class="table" style="margin-top:0px !important; padding-top:0px">
					<thead>
						<tr>
							<g:sortableColumn property="id" title="Id"/>
							<g:sortableColumn property="dateCreated" title="Date"/>
							<g:sortableColumn property="ipAddress" title="IP Address" params="${[admin:admin]}"/>
							<th>Country/State/Zip</th>
						</tr>
					</thead>
					<tbody>
						<g:each in="${runningInstances}" var="runningInstance">
							<tr>
								<td>${runningInstance.id}</td>
								<td><g:formatDate format="MMM dd hh:mm" date="${runningInstance.dateCreated}"/></td>
								<td><span class="ipAddress" id="ip-${runningInstance.id}">${runningInstance.ipAddress}</span></td>
								<td><span id="ip-${runningInstance.id}-origin"></span></td>
								<td>
									<g:form action="delete_nod" method="post" id="$runningInstance.id">
										<input type="submit" value="Delete" name="delete_nod"
				                			onclick="return confirm('Are you sure???')"/>
									</g:form>
								</td>
							</tr>
						</g:each>
					</tbody>
				</table>

				<g:paginate total="${runningInstancesTotal}"/>
			</g:if>
			<g:else>
				<p>No Running Instances found...</p>
			</g:else>
		</div>	

		<script type="text/javascript" src="${resource(dir:'js/lib/jquery.min.js')}"></script>
		
		<script type="text/javascript">
		$(document).ready(function(){
			
			var baseUrl = "http://api.ipstack.com/"
			var accessKey = "?access_key=0f94e485f1874c3ab43d0081fb8d7b0a"
			
			//getOrigins().then(renderStates).then(setState(state));
			
			var $ipAddresses = $('.ipAddress')
			var ipMap = {}
			
			function initialize(){
				$($ipAddresses).each(function(){
					var $row = $(this)
					var ipAddress = $row.html()
					var id = $row.attr("id")
					
					if(!ipMap.hasOwnProperty(ipAddress)){
						console.log(ipAddress)
						ipMap[ipAddress] = {}
						ipMap[ipAddress]["id"] = id + "-origin"
					}
					
					return ""
					
				});
				
				for(var ip in ipMap){
					var id = ipMap[ip].id
					//getOrigin(ip).then(renderOrigin)
					getOrigin(ip).then(renderOrigin(id))
				}
			}
			
			
			function getOrigin(ipAddress){
				var url = baseUrl + ipAddress + accessKey
				return $.ajax({
					url : url,
					type : 'get',
    				crossDomain: true,
					dataType : 'jsonp',
					contentType : 'application/json',
					error : function(){
						//console.log("errored...")
					}
				})
			}
	

			function renderOrigin(id){
				return function(data, response){
					//console.log(data, response)
					var $origin = $("#" + id);
					var html = data.city + "<br/>" + data.country_name
					$origin.html(html)
				}
			}
			
			initialize()
		})
		</script>
	</body>
</html>
