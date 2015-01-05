
class MoostraxJob {
	def startDelay = 60000
    def timeout = 1200000 // execute job once in 5 seconds

	def moostraxService

    def execute() {
        // execute task
	    for(user in User.getAll()){
		    if(user?.profile?.apiDevice == null){
			    moostraxService.getDevices(user?.profile?.apiKey)
		    }

	    }
    }
}
