

<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<title>Nod</title>
		<link rel="stylesheet" href="https://cdn.concisecss.com/concise.min.css">
	</head>
	<body>

		<div id="list-catalog" class="content scaffold-list" role="main">
			
			<h2 class="">PageAnalytic</h2>
			
			<g:if test="${flash.error}">
				<br/>
				<div class="alert alert-danger" role="status">${flash.error}</div>
			</g:if>
			
			<g:if test="${flash.message}">
				<br/>
				<div class="alert alert-info" role="status">${flash.message}</div>
			</g:if>
			
			
			<g:if test="${pageAnalytics?.size() > 0}">
				<table class="table" style="margin-top:0px !important; padding-top:0px">
					<thead>
						<tr>
							<g:sortableColumn property="id" title="Id"/>
							<g:sortableColumn property="dateCreated" title="Date"/>
							<g:sortableColumn property="page" title="Page"/>
							<g:sortableColumn property="duration" title="Duration"/>
							<g:sortableColumn property="loadTime" title="Load Time"/>
							<g:sortableColumn property="ipAddress" title="Ip Adress"/>
							<g:sortableColumn property="application" title="Application"/>
							<th></th>
						</tr>
					</thead>
					<tbody>
						<g:each in="${pageAnalytics}" var="pageAnalyticInstance">
							<tr>
								<td>${pageAnalyticInstance.id}</td>
								<td><g:formatDate format="MMM dd hh:mm" date="${pageAnalyticInstance.dateCreated}"/></td>
								<td>${pageAnalyticInstance.page}</td>
								<td>${pageAnalyticInstance.duration}</td>
								<td>${pageAnalyticInstance.loadTime}</td>
								<td>${pageAnalyticInstance.ipAddress}</td>
								<td>${pageAnalyticInstance.application}</td>
								<td>
									<g:form action="delete" method="post" id="${pageAnalyticInstance.id}">
										<g:actionSubmit value="Delete"
                onclick="return confirm('Are you sure???')"/>
									</g:form>
								</td>
							</tr>
						</g:each>
					</tbody>
				</table>

				<g:paginate total="${pageAnalyticsTotal}"/>
			</g:if>
			<g:else>
				<p>No PageAnalytics found...</p>
			</g:else>
		</div>	

	</body>
</html>
