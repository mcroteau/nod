package nod

class UsageAnalytic {
	
	String page
	String ipAddress

	Date dateCreated
	Date lastUpdated

	static constraints = {
		ipAddress(nullable:true)
		id generator: 'sequence', params:[sequence:'ID_USAGE_ANALYTIC_PK_SEQ']
    }
}
