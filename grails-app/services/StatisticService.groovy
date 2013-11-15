import tm.common.*
import tm.game.*

class StatisticService{

	def getStatistic(date,toDate){
		def result = [:]
		println date
		def _date = resetDate(date)
		def _toDate = resetDate(toDate)
		def dates = []
		while(_date != _toDate){
			def sdf = new java.text.SimpleDateFormat("dd/MM")
			def calendar = Calendar.getInstance()
			calendar.setTime(_date)
			dates << sdf.format(_date)
			
			_date++

		}

		println "ok"
		result.dates = dates
		return result
	}

	def generateSummary(guild){
		
		def userSums = []
		def users  = User.withCriteria {
			info{
				eq("guild",guild)
			}
		}
		users.each {user->
			def result = generateSummaryUser(user)
			userSums << result
		}
		def guildSum = new GuildSummary()
		guildSum.date =  resetDate(new Date())
		guildSum.amount= 0
		guildSum.catAmount = 0 
		guildSum.atkAmount = 0
		guildSum.defAmount = 0
		guildSum.guild= guild
		userSums.each{userSum->
			guildSum.amount += userSum.amount
			guildSum.catAmount += userSum.catAmount
			guildSum.atkAmount += userSum.atkAmount
			guildSum.defAmount += userSum.defAmount
		}
		guildSum.save()
	}

	def generateSummaryUser(user){

		def summary = user.info.armySummary
		def atk = 0
		def defend = 0
		if(user.info.race.name == "Gauls"){
			atk = summary.u2+summary.u4+summary.u6
			defend = summary.u1+summary.u5+summary.u6
		}
		if(user.info.race.name == "Roman"){
			atk = summary.u3+summary.u5+summary.u6
			defend = summary.u1+summary.u2
		}
		if(user.info.race.name == "Teuton"){
			atk = summary.u1+summary.u3+summary.u6
			defend = summary.u2+summary.u5
		}
		def cat = summary.u7+summary.u8
		def userSum = new Summary()
		userSum.date =  resetDate(new Date())
		userSum.userInfo = user.info
		userSum.amount = atk+defend+cat
		userSum.catAmount = cat 
		userSum.atkAmount = atk 
		userSum.defAmount = defend
		userSum.save()
		return userSum
	}

	def resetDate(date){
        def cal = Calendar.getInstance();       
        cal.setTime(date);                           
        cal.set(Calendar.HOUR_OF_DAY, 0);            
        cal.set(Calendar.MINUTE, 0);                 
        cal.set(Calendar.SECOND, 0);                 
        cal.set(Calendar.MILLISECOND, 0);            
        return cal.getTime();            
    }
}