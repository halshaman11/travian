
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
			println ""+_date
			_date++

		}

		println "ok"
		result.dates = dates
		return result
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