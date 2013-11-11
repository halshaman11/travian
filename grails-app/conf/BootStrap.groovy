import tm.common.*
import tm.game.*

class BootStrap {

    def init = { servletContext ->
    	def gaul = Race.findByName("Gaul")
    	if(!gaul){
    		gaul = new Race()
    		gaul.name = "Gauls"
    		gaul.save()
    	}
    	def roman = Race.findByName("Roman")
    	if(!roman){
    		roman = new Race()
    		roman.name = "Roman"
    		roman.save()
    	}
    	def teuton = Race.findByName("Teuton")
    	if(!teuton){
    		teuton = new Race()
    		teuton.name = "Teuton"
    		teuton.save()
    	}

    	def iku = Guild.findByName("อิคึ")
    	if(!iku){
    		iku = new Guild()
    		iku.name = "อิคึ"
    		iku.save()
    	}

    	iku = Guild.findByName("อิไตโย")
    	if(!iku){
    		iku = new Guild()
    		iku.name = "อิไตโย"
    		iku.save()
    	}


        def user = User.findByUsername("admin")
        if(!user){
            def role = Role.findByAuthority("ROLE_ADMIN")
            if(!role){
                role = new Role()
                role.authority = "ROLE_ADMIN"
                role.save(flush:true)
            }
            user = new User()
            user.username = "admin"
            user.password = "qwer1234"
            user.enabled = true
            user.accountExpired = false
            user.accountLocked = false
            user.passwordExpired = false
            user.validate()
            println user.errors
            user.save(flush:true)
            UserRole.create user,role,true
        }
        def role = Role.findByAuthority("ROLE_USER")
            if(!role){
                role = new Role()
                role.authority = "ROLE_USER"
                role.save(flush:true)
            }
        /*user = User.findByUsername("aaa")
        if(!user){
            def role = Role.findByAuthority("ROLE_USER")
            if(!role){
                role = new Role()
                role.authority = "ROLE_USER"
                role.save(flush:true)
            }
            user = new User()
            user.username = "aaa"
            user.password = "aaa"
            user.enabled = true
            user.accountExpired = false
            user.accountLocked = false
            user.passwordExpired = false
            user.info = new UserInfo()
            user.info.username = "aaa"
            user.info.heroLevel = 23
            user.info.isUseGold = true
            user.info.playType = ""
            user.info.playTime = ""
            user.info.race = Race.get(1 as Long)
            user.info.guild = Guild.get(1 as Long)
            user.validate()
            println user.errors
            user.save(flush:true)
            println "ok"
            UserRole.create user,role,true
            println "ok2"
        }
        */

    }
    def destroy = {
    }
}
