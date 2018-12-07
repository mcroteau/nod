

<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="admin">
		<title>Nod</title>
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
							<g:sortableColumn property="dateCreated" title="Date"/>
							<g:sortableColumn property="ipaddress" title="IP Address" params="${[admin:admin]}"/>
						</tr>
					</thead>
					<tbody>
						<g:each in="${runningInstances}" var="runningInstance">
							<tr>
								<td>${runningInstance.dateCreated}</td>
								<td>${runningInstance.ipaddress}</td>
							</tr>
						</g:each>
					</tbody>
				</table>

				<g:paginate total="${runningInstancesTotal}"/>
			</g:if>
			<g:else>
				<p>No Running Instances found..</p>
			</g:else>
		</div>	
	</body>
</html>
