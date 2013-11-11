package tm.common
import tm.game.*

class UserInfo{

	static belongsTo = [user:User]
	static hasMany = [armySummarys: ArmySummary]
	static transients = ['army']
	boolean isUseGold = false
	Race race 
	Guild guild
	String username
	Integer heroLevel
	String playType
	String playTime
	String note
	Date dateCreated
   	Date lastUpdated

   	static mapping = {
        version false
        autoTimestamp true
    }

	static constraints = {
		note nullable: true
	}
	def getArmy(){
		 return armySummarys.find { it.isActive }
	}
}