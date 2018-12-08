
class Triage {

	String path
	String error
	String email
	String ipAddress

	Date dateCreated
	Date lastUpdated
	
	static constraints = {
		path(nullable:false)
		error(nullable:false)
		email(nullable:true)
		ipAddress(nullable:true)
		id generator: 'sequence', params:[sequence:'ID_TRIAGE_PK_SEQ']
    }

}