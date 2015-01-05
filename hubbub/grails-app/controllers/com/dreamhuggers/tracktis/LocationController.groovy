

package com.dreamhuggers.tracktis

class LocationController {
    def authenticateService
	def locationService
	def scaffold= true

static navigation = [
        [group: 'tabs', action: 'personal', title: 'My Locations', order: 6, isVisible: {authenticateService.userDomain() != null}],
        [action:'timeline', title: 'Location Timeline', order: 7, isVisible: {authenticateService.userDomain() != null}],
        [action: 'global', title: 'Public Locations', order: 8],

    ]


	def index = {
        redirect(action: 'timeline', params: params)
    }

    def global = {

        def (locations, locationCount) = locationService.getGlobalTimelineAndCount(params)
        [ locations : locations, locationCount : locationCount ]
    }

    def timeline = {

        def user = params.id ? User.findByUserId(params.id) : User.get(authenticateService.userDomain().id)
        if (!user) {
            response.sendError(404)
            return
        }
        def (locations, locationCount) = locationService.getUserTimelineAndCount(user.userId, params)

        [ targetUser : user, locations : locations, locationCount : locationCount ]
    }

    def personal = {

        def user = params.id ? User.findByUserId(params.id) : User.get(authenticateService.userDomain().id)
        if (!user) {
            response.sendError(404)
            return
        }
        def (locations, locationCount) = locationService.getUserLocations(user.userId, params)

        [ targetUser : user, locations : locations, locationCount : locationCount ]
    }

    def addLocation = {
        try {
	        String location = params.location
	        String description = params.description
	        double latitude = Double.parseDouble(params.latitude)
	        double longitude = Double.parseDouble(params.longitude)
	        double geofence_radius = Double.parseDouble(params.geofence_radius)
	        boolean forEveryone
	        if(params.forEveryone=="on"){
		         forEveryone = true
	        }else{
		      forEveryone = false
	        }
            def newLocation = locationService.createAndReturnLocation(authenticateService.userDomain().userId,
                                                                      location,
                                                                      description,
                                                                      latitude,
                                                                      longitude,
                                                                      geofence_radius,
                                                                      forEveryone
            )
            flash.message = "Added new location: ${newLocation.location}"
        } catch (LocationException pe) {
            flash.message = pe.message
        }
        redirect(action: 'timeline', id: params.id)
    }

    def addLocationAjax = {
        try {


            def user = authenticateService.userDomain()
	        String location = params.location
	        String description = params.description
	        double latitude = Double.parseDouble(params.latitude)
	        double longitude = Double.parseDouble(params.longitude)
	        double geofence_radius = Double.parseDouble(params.geofence_radius)
	        boolean forEveryone
	        if(params.forEveryone=="on"){
		         forEveryone = true
	        }else{
		      forEveryone = false  
	        }
				      

            def newLocation = locationService.createAndReturnLocation(user.userId,
                                                                      location,
                                                                      description,
                                                                      latitude,
                                                                      longitude,
                                                                      geofence_radius,
                                                                      forEveryone)
            def locations
            def locationCount
            switch(params.timelineToReturn) {
                case "global":
                    (locations, locationCount) = locationService.getGlobalTimelineAndCount(params)
                    break
                case "mytimeline":
                    (locations, locationCount) = locationService.getUserTimelineAndCount(user.userId, params)
                    break
                case "mylocations":
                    (locations, locationCount) = locationService.getUserLocations(user.userId, params)
                    break
            }
            println "locationCount is ${locationCount}"
            render(template:"locationentries", collection: locations, var: 'location')
        } catch (LocationException pe) {
            render {
                div(class:"errors", pe.message)
            }
        }

    }
}
