

<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<title>Nod</title>
		<link rel="stylesheet" href="https://cdn.concisecss.com/concise.min.css">
	</head>
	<body>

		<div id="list-catalog" class="content scaffold-list" role="main">
			
			<h2 class="">Triage</h2>
			
			<g:if test="${flash.error}">
				<br/>
				<div class="alert alert-danger" role="status">${flash.error}</div>
			</g:if>
			
			<g:if test="${flash.message}">
				<br/>
				<div class="alert alert-info" role="status">${flash.message}</div>
			</g:if>
			
			
			<g:if test="${triageInstances?.size() > 0}">
				<table class="table" style="margin-top:0px !important; padding-top:0px">
					<thead>
						<tr>
							<g:sortableColumn property="id" title="Id"/>
							<g:sortableColumn property="dateCreated" title="Date"/>
							<g:sortableColumn property="path" title="Path"/>
							<g:sortableColumn property="error" title="Issue"/>
							<g:sortableColumn property="ipAddress" title="Ip Adress"/>
							<g:sortableColumn property="email" title="Email"/>
							<th></th>
						</tr>
					</thead>
					<tbody>
						<g:each in="${triageInstances}" var="triageInstance">
							<tr>
								<td>${triageInstance.id}</td>
								<td><g:formatDate format="MMM dd hh:mm" date="${triageInstance.dateCreated}"/></td>
								<td>${triageInstance.path}</td>
								<td>${triageInstance.error}</td>
								<td>${triageInstance.ipAddress}</td>
								<td>${triageInstance.email}</td>
								<td>
									<g:form action="delete" method="post" id="${triageInstance.id}">
										<g:actionSubmit value="Delete"
                onclick="return confirm('Are you sure???')"/>
									</g:form>
								</td>
							</tr>
						</g:each>
					</tbody>
				</table>

				<g:paginate total="${triageInstancesTotal}"/>
			</g:if>
			<g:else>
				<p>No Triages found...</p>
			</g:else>
		</div>	

	</body>
</html>
