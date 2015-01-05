package com.dreamhuggers.tracktis

import com.dreamhuggers.tracktis.*

class LocationException extends RuntimeException {
    String message
    Location location
}

class LocationService implements RemoteLocationService {

    boolean transactional = true
    
    int MAX_ENTRIES_PER_PAGE = 10

    /**
     * Method for REST and remoting access.
     */
    long createLocation(String username,
                        String location,
                        String description,
                        double latitude,
                        double longitude,
                        double geofence_radius,
                        boolean forEveryone) {
        def user = User.findByUserId(username)
        if (!user) {
            throw new LocationException(message: "User not found.")
        }

        def newLocation = createLocation(
		                user.id,
                        location,
                        description,
                        latitude,
                        longitude,
                        geofence_radius,
                        forEveryone)
        if (!newLocation) {
            throw new LocationException(message: "Create failed: ${newLocation.errors}")
        }
        else {
            return newLocation.id
        }
    }

    /**
     * Internal version of createLocation() method for our standard controllers.
     * It needs a different name because the arguments are the same as
     * the one used for remoting.
     */
    Location createAndReturnLocation(String username,
                                     String newLocation,
                                     String description,
                                     double latitude,
                                     double longitude,
                                     double geofence_radius,
                                     boolean forEveryone) {
        def user = User.findByUserId(username)
        if (!user) {
            throw new LocationException(message: "User not found.")
        }

        def location = createLocation(user.id,
                                      newLocation,
                                      description,
                                      latitude,
                                      longitude,
                                      geofence_radius,
                                      forEveryone)
        if (!location) {
            throw new LocationException(message: "Create failed: ${location.errors}")
        }
        else {
            return location
        }
    }


    Location createLocation(long id, String locationName,
                        String description,
                        double latitude,
                        double longitude,
                        double geofence_radius,
                        boolean forEveryone) {
        def user = User.get(id)
        if (user) {
            def location = new Location(location:locationName,
                        description:description,
                        latitude:latitude,
                        longitude:longitude,
                        geofence_radius:geofence_radius,
                        forEveryone:forEveryone)
            user.addToLocations(location)

            if (!user.save()) {
                throw new LocationException(message: "Invalid or empty location", location: location)
            }


            return location
        }
        throw new LocationException(message: "Invalid User Id")

    }
    
    def getGlobalTimelineAndCount(params) {

        if (!params.max)
            params.max = MAX_ENTRIES_PER_PAGE

        def locations = Location.list(params)
	    List<Location> locationList = new ArrayList<Location>();
	    for(aLocation in locations){
		    if(aLocation.forEveryone){
			    locationList.add(aLocation)
			 
		    }

	    }
	    locations = locationList
        def locationCount = locationList?.size()
        [ locations, locationCount ]
    }
    
    def getUserTimelineAndCount(userId, params) {

        if (!params.max) 
            params.max = MAX_ENTRIES_PER_PAGE
        
        if (!params.offset)
            params.offset = 0

        
        def user = User.findByUserId(userId)
        def idsToInclude = user.following.collect { u -> u.id }
        idsToInclude.add(user.id)
        def query = "from Location as p where p.user.id in (" + idsToInclude.join(",") + ")"
        println "Query is ${query}"
        def locations = Location.findAll( query + " order by p.dateCreated desc", 
                [ max: params.max, offset: params.offset ])
        def locationCount = Location.findAll(query).size()

        return [ locations, locationCount ]
        
    }

    def getUserLocations(userId, params) {

        if (!params.max)
            params.max = MAX_ENTRIES_PER_PAGE

        def user = User.findByUserId(userId)
        def locationCount = Location.countByUser(user)
        def locations = Location.findAllByUser(user, params)
        return [ locations, locationCount ]
        
    }

}
