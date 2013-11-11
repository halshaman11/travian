package tm.common
import tm.game.*
import grails.plugins.springsecurity.Secured

@Secured(['ROLE_ADMIN'])
class AdminHomeController {

	def statisticService

	def index = {
		
	}

	def unlock = {
		def role = Role.findByAuthority("ROLE_USER")
		if(!role){
			role = new Role()
			role.authority = "ROLE_USER"
			role.save()
		}
		def user = User.get(params.id as Long)
		user.accountLocked = false 
		user.save()
		UserRole.create user,role
		redirect(action:"index")
	}

	def delete = {
		def user = User.get(params.id as Long)
		user.delete(flush:true)
		redirect(action:"index")
	}

	def users = {
		def admin = User.findByUsername("admin")
		def users = (User.list() - admin)
		[users:users]
	}

	def user = {
		def user = User.get(params.id)

		[user:user,armySummarys:user.info.armySummarys.sort{ it.id }.reverse(),race:user.info.race.name[0].toLowerCase()]
		//[user:user,info:user.info,towns:user.info.towns.sort{ it.id },race:user.info.race.name[0].toLowerCase()]
	}
	

}