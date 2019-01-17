package nod

class PageAnalytic {
	
	String page
	long duration
	long loadTime
	String ipAddress
	String application

	Date dateCreated
	Date lastUpdated

	static mapping = {
		sort id: "desc"
	}
	
	static constraints = {
		page(nullable:false)
		loadTime(nullable:true)
		duration(nullable:true)
		ipAddress(nullable:true)
		application(nullable:true)
		id generator: 'sequence', params:[sequence:'ID_PAGE_ANALYTIC_PK_SEQ']
    }
}
