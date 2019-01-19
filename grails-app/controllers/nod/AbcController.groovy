package nod

import grails.converters.*

import nod.Triage
import nod.RunningInstance
import nod.PageAnalytic


class AbcController {
	
    static allowedMethods = [ a: "POST", delete: "POST", delete_nod: "POST"]
	
	def secret = "3aLe6zI0GW"
	
	def index(){
		redirect(action:"nods")
	}
	
	
	def o(){
		def runningInstance = new RunningInstance()
		runningInstance.ipAddress = request.getRemoteHost()
		runningInstance.save(flush:true)
		
		return "hello..."
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
	
	
	def delete_nod(Long id){
		if(params.id){
			def ri = RunningInstance.get(params.id)
			ri.delete(flush:true)
			flash.message = "Removed Nod/Running Instance..."
		}
		redirect(action:"nods")
	}
	
	

	def a(){
		if(secret == params.c){
			def pageAnalytic = new PageAnalytic()
			pageAnalytic.page = params.page ? params.page : "no page defined"
			pageAnalytic.duration = params.duration ? params.duration as Long : 0
			pageAnalytic.loadTime = params.loadTime ?  params.loadTime as Long : 0
			pageAnalytic.ipAddress = request.getRemoteHost()
			pageAnalytic.application = params.application ? params.application : "no application defined"
			pageAnalytic.save(flush:true)
		}
		
		render "Hello..."
	}
	
	
	
	def analytics(){
		def max = 10
		def offset = params?.offset ? params.offset : 0
		def sort = params?.sort ? params.sort : "id"
		def order = params?.order ? params.order : "desc"
		
		def pageAnalytics = PageAnalytic.list(max: max, offset: offset, sort: sort, order: order)
		
		[pageAnalytics: pageAnalytics, pageAnalyticsTotal: PageAnalytic.count()]
	}
	
	
	def delete_analytic(){
		if(params.id){
			def pa = PageAnalytic.get(params.id)
			pa.delete(flush:true)
			flash.message = "Removed Page Analytic..."
		}
		redirect(action:"analytics")
	}
	
	
	def delete_analytic_ip_address(){
		if(params.id){
			def pa = PageAnalytic.get(params.id)
			def analytics = PageAnalytic.findAllByIpAddress(pa.ipAddress)
			analytics.each { analytic ->
				analytic.delete(flush:true)
			}
		}
		redirect(action:"analytics")
	}
	
	
}