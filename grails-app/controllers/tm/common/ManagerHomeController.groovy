package tm.common
import tm.game.*
import grails.plugins.springsecurity.Secured

@Secured(['ROLE_MANAGER'])
class ManagerHomeController {

	def statisticService
	def springSecurityService

	def index = {
		

		def adminGuild = springSecurityService.getCurrentUser()?.guild
		def guildSum = GuildSummary.findAllByGuild(adminGuild,[max: 10, sort: "date", order: "desc"])
		
		def users = User.withCriteria {
			info{
				eq("guild",adminGuild)
			}
		}

		[all:users.size(),guild:adminGuild,guildSum:guildSum]
	}

	def delete = {
		def user = User.get(params.id as Long)
		user.delete(flush:true)
		redirect(action:"index")
	}

	def users = {
		def adminGuild = springSecurityService.getCurrentUser()?.guild
		println adminGuild
		def users = User.withCriteria {
			info{
				eq("guild",adminGuild)
			}
		}
		println users
		[users:users]
	}

	def user = {

		def adminGuild = springSecurityService.getCurrentUser()

		def user = User.get(params.id)
		if(user?.info?.guild?.id != adminGuild?.guild?.id){
			redirect(action:"users")
			return
		}
		def guildSum = Summary.findAllByUserInfo(user.info,[max: 10, sort: "date", order: "desc"])
		
		//[user:user,armySummarys:user.info.armySummarys.sort{ it.id }.reverse(),race:user.info.race.name[0].toLowerCase()]
		[guildSum:guildSum,user:user,info:user.info,towns:user.info.towns,armySummarys:user.info.towns.sort{ it.id },race:user.info.race.name[0].toLowerCase()]
	}

	def doSummary = {
		def date = statisticService.resetDate(new Date())
		def adminGuild = springSecurityService.getCurrentUser()?.guild
		def guildSum = GuildSummary.findByDateAndGuild(date,adminGuild)
		if(!guildSum)
			statisticService.generateSummary(adminGuild)
		redirect(action:"index")
	}
	

}