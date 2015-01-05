package com.dreamhuggers.tracktis

import com.dreamhuggers.tracktis.*

class NotificationException extends RuntimeException {
    String message
    Notification notification
}

class NotificationService implements RemoteNotificationService {

    boolean transactional = true
    
    int MAX_ENTRIES_PER_PAGE = 10

    /**
     * Method for REST and remoting access.
     * Currently not weel implemented... left for next iteration of Tracktis
     */
    long createNotification(String name,
                            String followed,
                            Location location,
                            String frequency,
                            boolean enter,
                            String startDate,
                            String endDate){
        def user = User.findByUserId(username)
        if (!user) {
            throw new NotificationException(message: "User not found.")
        }

        def newNotification = createNotification(
		                user.id,
                        notification,
                        description,
                        latitude,
                        longitude,
                        geofence_radius,
                        forEveryone)
        if (!newNotification) {
            throw new NotificationException(message: "Create failed: ${newNotification.errors}")
        }
        else {
            return newNotification.id
        }
    }

    /**
     * Internal version of createNotification() method for our standard controllers.
     * It needs a different name because the arguments are the same as
     * the one used for remoting.
     */
    Notification createAndReturnNotification(String username, params) {
        def user = User.findByUserId(username)
	def name = params?.name
	def location = params?.location
	def frequency = params?.frequency
	def enter    = params?.enter
	def startDate = params?.startDate
	def endDate    = params?.endDate
	    
	    
        if (!user) {
            throw new NotificationException(message: "User not found.")
        }

        def notification = createNotification(user.id, name, location, frequency, enter, startDate, endDate)
        if (!notification) {
            throw new NotificationException(message: "Create failed: ${notification.errors}")
        }
        else {
            return notification
        }
    }


    Notification createNotification(long id, name, location, frequency, enter, startDate, endDate) {
        def user = User.get(id)
        if (user) {
            def notification = new Notification(name:name,location:location, frequency:frequency, enter:enter, startDate:startDate, endDate:endDate)
            user.addToNotifications(notification)

            if (!user.save()) {
                throw new NotificationException(message: "Invalid or empty notification", notification: notification)
            }


            return notification
        }
        throw new NotificationException(message: "Invalid User Id")

    }
    /*
    Not needed because Notifications are only visible for their own creators. Other users does not have access to them.
     */
    /* def getGlobalTimelineAndCount(params) {

        if (!params.max)
            params.max = MAX_ENTRIES_PER_PAGE

        def notifications = Notification.list(params)
	    List<Notification> notificationList = new ArrayList<Notification>();
	    for(aNotification in notifications){
		    if(aNotification.forEveryone){
			    notificationList.add(aNotification)
			    println "${aNotification.notification}"
		    }
		    println "${notificationList.size()}"
	    }
	    notifications = notificationList
        def notificationCount = notificationList?.size()
        [ notifications, notificationCount ]
    }
    
    def getUserTimelineAndCount(userId, params) {

        if (!params.max) 
            params.max = MAX_ENTRIES_PER_PAGE
        
        if (!params.offset)
            params.offset = 0

        
        def user = User.findByUserId(userId)
        def idsToInclude = user.following.collect { u -> u.id }
        idsToInclude.add(user.id)
        def query = "from Notification as p where p.user.id in (" + idsToInclude.join(",") + ")"
        println "Query is ${query}"
        def notifications = Notification.findAll( query + " order by p.dateCreated desc", 
                [ max: params.max, offset: params.offset ])
        def notificationCount = Notification.findAll(query).size()
        println "Notification count is ${notifications?.size()}"
        return [ notifications, notificationCount ]
        
    } */

    def getUserNotifications(userId, params) {

        if (!params.max)
            params.max = MAX_ENTRIES_PER_PAGE

        def user = User.findByUserId(userId)
        def notificationCount = Notification.countByUser(user)
        def notifications = Notification.findAllByUser(user, params)
        return [ notifications, notificationCount ]
        
    }

}
