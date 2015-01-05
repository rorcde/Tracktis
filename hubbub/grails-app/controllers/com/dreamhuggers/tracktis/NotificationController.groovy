

package com.dreamhuggers.tracktis

class NotificationController {
    def authenticateService
	def notificationService
	def locationService
	def scaffold= true

static navigation = [
        [group: 'tabs', action: 'personal', title: 'My Notifications', order: 6, isVisible: {authenticateService.userDomain() != null}]]

	def create = {
		def currentUser = User.get(authenticateService.userDomain().id)
		def myLocations = Location.findAllByUser(currentUser)
		def publicLocations = Location.findAllByForEveryone(true)
		myLocations += publicLocations
        def notificationInstance = new Notification()

        notificationInstance.properties = params
        return ['notificationInstance':notificationInstance, currentUser:currentUser, myLocations:myLocations, following:currentUser?.following]
    }

    def personal = {


        def user = params.id ? User.findByUserId(params.id) : User.get(authenticateService.userDomain().id)
        if (!user) {
            response.sendError(404)
            return
        }

		def myLocations = Location.findAllByUser(user)
		def publicLocations = Location.findAllByForEveryone(true)
		myLocations += publicLocations
        def notificationInstance = new Notification()


        def (notifications, notificationCount) = notificationService.getUserNotifications(user.userId, params)

        [ targetUser : user, notifications : notifications, notificationCount : notificationCount, following:user?.following, myLocations:myLocations, 'notificationInstance':notificationInstance ]
    }

    def addNotification = {
        try {
            def newNotification = notificationService.createAndReturnNotification(authenticateService.userDomain().userId,
		                params
            )
            flash.message = "Added new notification: ${newNotification.notification}"
        } catch (NotificationException pe) {
            flash.message = pe.message
        }
        redirect(action: 'timeline', id: params.id)
    }

    def addNotificationAjax = {
        try {


	        User user = authenticateService?.userDomain()

	        	/*String name
	Location location
	String frequency
	boolean enter
	Date startDate
	Date endDate*/


            def newNotification = notificationService.createAndReturnNotification(
		                user?.userId,
		                params
            )
            def nofications
            def notificationCount
            switch(params.timelineToReturn) {
                /*case "global":
                    (notification, notificationCount) = notificationService.getGlobalTimelineAndCount(params)
                    break
                case "mytimeline":
                    (notifications, notificationCount) = notifiationService.getUserTimelineAndCount(user.userId, params)
                    break */
                case "mynotifications":
                    (notifications, notificationCount) = notificationService.getUserNotifications(user.userId, params)
                    break
            }
            println "notificationCount is ${notificationCount}"
            render(template:"notificationentries", collection: notifications, var: 'notification')
        } catch (NotificationException pe) {
            render {
                div(class:"errors", pe.message)
            }
        }

    }
	
}

class DateCommand {
Date regDate
}
