import grails.converters.JSON
import tm.common.*
import tm.game.*
import javax.servlet.http.HttpServletResponse

import org.codehaus.groovy.grails.plugins.springsecurity.SpringSecurityUtils

import org.springframework.security.authentication.AccountExpiredException
import org.springframework.security.authentication.CredentialsExpiredException
import org.springframework.security.authentication.DisabledException
import org.springframework.security.authentication.LockedException
import org.springframework.security.core.context.SecurityContextHolder as SCH
import org.springframework.security.web.WebAttributes
import org.springframework.security.web.authentication.UsernamePasswordAuthenticationFilter

class LoginController {

	/**
	 * Dependency injection for the authenticationTrustResolver.
	 */
	def authenticationTrustResolver

	/**
	 * Dependency injection for the springSecurityService.
	 */
	def springSecurityService

	/**
	 * Default action; redirects to 'defaultTargetUrl' if logged in, /login/auth otherwise.
	 */

	 def register = {

	 }

	 def success = {}
	 def failure = {}

	 def doRegister = {
	 	
	 	if(!params.travianID || !params.password){
	 		redirect(action:"failure")
	 	}else{
	 		def userRole = Role.findByAuthority("ROLE_USER")
	 		def user = new User()
	 		user.username = params.travianID
	 		user.password = params.password
	 		user.info = new UserInfo()
	 		user.info.username = params.travianID
	 		user.info.heroLevel = 0
	 		user.info.isUseGold = params.isUseGold ?:false
	 		user.info.playType = params.playType ?:""
	 		user.info.playTime = params.playTime ?:""
	 		user.info.race = Race.get(params.race as Long)
	 		user.info.guild = Guild.get(params.guild as Long)
	 		user.enabled = true
	 		user.accountExpired = false
			user.accountLocked = false
			user.passwordExpired = false
			user.validate()
			println user.errors
	 		if(user.save(flush:true)){
	 			UserRole.create user,userRole
	 			redirect(action:"success")
	 		}else{
	 			redirect(action:"failure")
	 		}
	 	}
	 }

	def index = {
		if (springSecurityService.isLoggedIn()) {
			redirect(action:"loginSuccess")
		}
		else {
			redirect action: 'auth', params: params
		}
	}



	/**
	 * Show the login page.
	 */
	def auth = {
		def config = SpringSecurityUtils.securityConfig

		if (springSecurityService.isLoggedIn()) {
			redirect(action:"loginSuccess")
			return
		}

		String view = 'auth'
		String postUrl = "${request.contextPath}${config.apf.filterProcessesUrl}"
		render view: view, model: [postUrl: postUrl,
		                           rememberMeParameter: config.rememberMe.parameter]
	}

	def loginSuccess = {
		println "is admin =>"+SpringSecurityUtils.ifAllGranted('ROLE_ADMIN')
		println "is user =>"+SpringSecurityUtils.ifAllGranted('ROLE_USER')
		if (SpringSecurityUtils.ifAllGranted('ROLE_ADMIN')) {
         	redirect controller: 'adminHome'
         	return
      	}
      	else {//(SpringSecurityUtils.ifAllGranted('ROLE_USER')) {
         	redirect controller: 'userHome'
         	return
      	}
	}

	/**
	 * The redirect action for Ajax requests.
	 */
	def authAjax = {
		response.setHeader 'Location', SpringSecurityUtils.securityConfig.auth.ajaxLoginFormUrl
		response.sendError HttpServletResponse.SC_UNAUTHORIZED
	}

	/**
	 * Show denied page.
	 */
	def denied = {
		if (springSecurityService.isLoggedIn() &&
				authenticationTrustResolver.isRememberMe(SCH.context?.authentication)) {
			// have cookie but the page is guarded with IS_AUTHENTICATED_FULLY
			redirect action: 'full', params: params
		}
	}

	/**
	 * Login page for users with a remember-me cookie but accessing a IS_AUTHENTICATED_FULLY page.
	 */
	def full = {
		def config = SpringSecurityUtils.securityConfig
		render view: 'auth', params: params,
			model: [hasCookie: authenticationTrustResolver.isRememberMe(SCH.context?.authentication),
			        postUrl: "${request.contextPath}${config.apf.filterProcessesUrl}"]
	}

	/**
	 * Callback after a failed login. Redirects to the auth page with a warning message.
	 */
	def authfail = {

		def username = session[UsernamePasswordAuthenticationFilter.SPRING_SECURITY_LAST_USERNAME_KEY]
		String msg = ''
		def exception = session[WebAttributes.AUTHENTICATION_EXCEPTION]
		if (exception) {
			if (exception instanceof AccountExpiredException) {
				msg = g.message(code: "springSecurity.errors.login.expired")
			}
			else if (exception instanceof CredentialsExpiredException) {
				msg = g.message(code: "springSecurity.errors.login.passwordExpired")
			}
			else if (exception instanceof DisabledException) {
				msg = g.message(code: "springSecurity.errors.login.disabled")
			}
			else if (exception instanceof LockedException) {
				msg = g.message(code: "springSecurity.errors.login.locked")
			}
			else {
				msg = g.message(code: "springSecurity.errors.login.fail")
			}
		}

		if (springSecurityService.isAjax(request)) {
			render([error: msg] as JSON)
		}
		else {
			flash.message = msg
			redirect action: 'auth', params: params
		}
	}

	/**
	 * The Ajax success redirect url.
	 */
	def ajaxSuccess = {
		render([success: true, username: springSecurityService.authentication.name] as JSON)
	}

	/**
	 * The Ajax denied redirect url.
	 */
	def ajaxDenied = {
		render([error: 'access denied'] as JSON)
	}
}
