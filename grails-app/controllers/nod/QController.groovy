
import grails.converters.*

class QController {
	
	def o(){
		def runningInstance = new RunningInstance()
		runningInstance.ipaddress = request.getRemoteHost()
		runningInstance.save(flush:true)
		
		return [ workerBee: "Thank you for trying Greenfield" ] as JSON
	}
	
	
	def list(){
		def max = 10
		def offset = params?.offset ? params.offset : 0
		def sort = params?.sort ? params.sort : "id"
		def order = params?.order ? params.order : "asc"
		
		def runningInstances = RunningInstance.list(max: max, offset: offset, sort: sort, order: order)
		
		[runningInstances: runningInstances, runningInstancesTotal: RunningInstance.count()]
	}
	
}