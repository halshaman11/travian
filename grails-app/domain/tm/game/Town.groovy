package tm.game
import tm.common.*


class Town {

	static belongsTo = [userInfo: UserInfo]
	static transients = ['activeSet']
	String name
	Integer population
	Integer wallLevel
	Integer residentLevel
	
	Integer x
	Integer y

	static hasMany = [armySets: ArmySet]

	static constraints = {
		population nullable: true
		wallLevel nullable: true
		residentLevel nullable: true
	}

	def getActiveSet(){
		return armySets.find{ it.isActive }
	}
}