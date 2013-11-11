package tm.common
import tm.game.*
import grails.plugins.springsecurity.Secured

@Secured(['ROLE_ADMIN','ROLE_USER'])
class UserHomeController {

	def springSecurityService

	def index = {
		def user = springSecurityService.getCurrentUser()
		[user:user,race:user.info.race.name[0].toLowerCase(),armySummary:user.info.army]		
	}


	def updateArmy = {
		def user = springSecurityService.getCurrentUser()
		[user:user,info:user.info,towns:user.info.towns.sort{ it.id },race:user.info.race.name[0].toLowerCase()]
	}

	def doUpdateTown = {
		def town = Town.get(params.id as Long)
		def set = town.activeSet
		set.isActive = false
		set.save()
		def armySet = new ArmySet(params)
		town.addToArmySets(armySet)
		if(town.save()){
			set.isActive = false
			set.save()
		}
		redirect(action:"updateArmy")

	}

	def doUpdateSummary = {
		try{
			def user = springSecurityService.getCurrentUser()
			def set = user.info?.army
			if(set){
				set.isActive = false
				set.save()	
			}
		
			def newSet = new ArmySummary(params)
			user.info.addToArmySummarys(newSet)	
			user.save(flush:true)
			flash.success = true
			redirect(action:"index")
		}catch(Exception e){
			redirect(action:"index")
		}
	}

	def history = {
		def user = springSecurityService.getCurrentUser()
		[armySummarys:user.info.armySummarys.sort{ it.id }.reverse(),race:user.info.race.name[0].toLowerCase()]

	}

	def addTown = {
		def user = springSecurityService.getCurrentUser()
		[user:user,race:user.info.race.name[0].toLowerCase()]
	}

	def doAdd = {
		def user = springSecurityService.getCurrentUser()
		def town = new Town(params)
		def armySet = new ArmySet(params)
		town.addToArmySets(armySet)
		armySet.validate()
		println armySet.errors
		town.validate()
		println town.errors
		town.save(flush:true)

		user.info.addToTowns(town)
		user.info.validate()
		println user.info.errors
		user.info.save(flush:true)
		
		redirect(action:'updateArmy')
	}
}