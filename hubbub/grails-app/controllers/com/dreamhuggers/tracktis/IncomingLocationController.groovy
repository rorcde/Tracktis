

package com.dreamhuggers.tracktis

class IncomingLocationController {
    def moostraxService
	def authenticateService

static navigation = [
        [group: 'tabs', action: 'list', title: 'Where is my family?', order: 6, isVisible: {authenticateService.userDomain() != null}]]





    def index = { redirect(action:list,params:params) }




    // the delete, save and update actions only accept POST requests
    static allowedMethods = [delete:'POST', save:'POST', update:'POST']

    def list = {
	     def currentUser = User.get(authenticateService.userDomain().id)
	     def locations = moostraxService.getLastLocation(currentUser?.profile?.apiKey, currentUser?.profile?.apiDevice)
        // pass through to upload form

 

        params.max = Math.min( params.max ? params.max.toInteger() : 10,  100)
	    def followers = currentUser?.incomingLocations
        [ followers: followers, incomingLocationInstanceTotal: followers?.count() ]
    }

    def show = {
        def incomingLocationInstance = IncomingLocation.get( params.id )

        if(!incomingLocationInstance) {
            flash.message = "IncomingLocation not found with id ${params.id}"
            redirect(action:list)
        }
        else { return [ incomingLocationInstance : incomingLocationInstance ] }
    }

    def delete = {
        def incomingLocationInstance = IncomingLocation.get( params.id )
        if(incomingLocationInstance) {
            try {
                incomingLocationInstance.delete(flush:true)
                flash.message = "IncomingLocation ${params.id} deleted"
                redirect(action:list)
            }
            catch(org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "IncomingLocation ${params.id} could not be deleted"
                redirect(action:show,id:params.id)
            }
        }
        else {
            flash.message = "IncomingLocation not found with id ${params.id}"
            redirect(action:list)
        }
    }

    def edit = {
        def incomingLocationInstance = IncomingLocation.get( params.id )

        if(!incomingLocationInstance) {
            flash.message = "IncomingLocation not found with id ${params.id}"
            redirect(action:list)
        }
        else {
            return [ incomingLocationInstance : incomingLocationInstance ]
        }
    }

    def update = {
        def incomingLocationInstance = IncomingLocation.get( params.id )
        if(incomingLocationInstance) {
            if(params.version) {
                def version = params.version.toLong()
                if(incomingLocationInstance.version > version) {
                    
                    incomingLocationInstance.errors.rejectValue("version", "incomingLocation.optimistic.locking.failure", "Another user has updated this IncomingLocation while you were editing.")
                    render(view:'edit',model:[incomingLocationInstance:incomingLocationInstance])
                    return
                }
            }
            incomingLocationInstance.properties = params
            if(!incomingLocationInstance.hasErrors() && incomingLocationInstance.save()) {
                flash.message = "IncomingLocation ${params.id} updated"
                redirect(action:show,id:incomingLocationInstance.id)
            }
            else {
                render(view:'edit',model:[incomingLocationInstance:incomingLocationInstance])
            }
        }
        else {
            flash.message = "IncomingLocation not found with id ${params.id}"
            redirect(action:list)
        }
    }

    def create = {
        def incomingLocationInstance = new IncomingLocation()
        incomingLocationInstance.properties = params
        return ['incomingLocationInstance':incomingLocationInstance]
    }

    def save = {
        def incomingLocationInstance = new IncomingLocation(params)
        if(!incomingLocationInstance.hasErrors() && incomingLocationInstance.save()) {
            flash.message = "IncomingLocation ${incomingLocationInstance.id} created"
            redirect(action:show,id:incomingLocationInstance.id)
        }
        else {
            render(view:'create',model:[incomingLocationInstance:incomingLocationInstance])
        }
    }
}

class IncommingLocationCommand{
	def altitude
	def longitude
	def latitude

}