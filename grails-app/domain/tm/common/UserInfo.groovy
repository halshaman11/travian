package tm.common
import tm.game.*

class UserInfo{

	static belongsTo = [user:User]
	static hasMany = [armySummarys: ArmySummary, towns:Town]
	static transients = ['army','armySummary']
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
	def getArmySummary(){
	     def units = [u1:0,u2:0,u3:0,u4:0,u5:0,u6:0,u7:0,u8:0,u9:0]
	     towns.each{  
	       def set = it.activeSet
	       units.u1 += set.slot1
	       units.u2 += set.slot2
	       units.u3 += set.slot3
	       units.u4 += set.slot4
	       units.u5 += set.slot5
	       units.u6 += set.slot6
	       units.u7 += set.slot7
	       units.u8 += set.slot8
	       units.u9 += set.slot9
	     }
     	return units
 	}
}