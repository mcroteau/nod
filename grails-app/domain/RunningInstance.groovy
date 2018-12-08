
class RunningInstance {
	
	String ipaddress

	Date dateCreated
	Date lastUpdated

	static constraints = {
		ipaddress(nullable:true)
		id generator: 'sequence', params:[sequence:'ID_RUNNING_INSTANCE_PK_SEQ']
    }
}
