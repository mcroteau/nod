package nod


class RunningInstance {
	
	String ipAddress

	Date dateCreated
	Date lastUpdated

	
	static mapping = {
		sort id: "desc"
	}
	
	static constraints = {
		ipAddress(nullable:true)
		id generator: 'sequence', params:[sequence:'ID_RUNNING_INSTANCE_PK_SEQ']
    }
}
