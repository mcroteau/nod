
import grails.converters.*

class QController {
	
	def o(){
		def runningInstance = new RunningInstance()
		runningInstance.ipAddress = request.getRemoteHost()
		runningInstance.save(flush:true)
		
		return [ m: "Thank you for trying Greenfield" ] as JSON
	}
	
	
	def nods(){
		def max = 10
		def offset = params?.offset ? params.offset : 0
		def sort = params?.sort ? params.sort : "id"
		def order = params?.order ? params.order : "desc"
		
		def runningInstances = RunningInstance.list(max: max, offset: offset, sort: sort, order: order)
		
		[runningInstances: runningInstances, runningInstancesTotal: RunningInstance.count()]
	}
	
	
	def t(){
		def triageInstance = new Triage()
		triageInstance.ipAddress = request.getRemoteHost()
		triageInstance.path = params.uri
		triageInstance.error = params.q
		triageInstance.email = params.m
		
		println triageInstance.error
		
		triageInstance.save(flush:true)
		return [:] as JSON
	}
	
	
	def triage(){		
		def max = 10
		def offset = params?.offset ? params.offset : 0
		def sort = params?.sort ? params.sort : "id"
		def order = params?.order ? params.order : "desc"
		
		def triageInstances = Triage.list(max: max, offset: offset, sort: sort, order: order)
		
		[triageInstances: triageInstances, triageInstancesTotal: Triage.count()]
	}
	
	
	def delete(Long id){
		println "delete triage..."
		if(params.id){
			def triage = Triage.get(params.id)
			triage.delete(flush:true)
			flash.message = "Removed Triage..."
		}
		redirect(action:"triage")
	}
	
}