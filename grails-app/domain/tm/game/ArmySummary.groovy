package tm.game

class ArmySummary{

	static transients = ['total']

	static final int TYPE_NATURE = 0
	static final int TYPE_GAULS = 1
	static final int TYPE_ROMAN = 2
	static final int TYPE_TUTAN = 3
	static final int TYPE_NATAR = 4

	boolean isActive = true
	//Integer type 

	Integer slot1 = 0
	Integer slot2 = 0
	Integer slot3 = 0
	Integer slot4 = 0
	Integer slot5 = 0
	Integer slot6 = 0
	Integer slot7 = 0
	Integer slot8 = 0
	Integer slot9 = 0
	
	Date dateCreated
   	Date lastUpdated

	static mapping = {
        version false
        autoTimestamp true
    }

    def getTotal(){
    	def sum = 0 
  		sum += slot1 ?:0
  		sum += slot2 ?:0
  		sum += slot3 ?:0
  		sum += slot4 ?:0
  		sum += slot5 ?:0
  		sum += slot6 ?:0
  		sum += slot7 ?:0
  		sum += slot8 ?:0
  		sum += slot9 ?:0
    }

}