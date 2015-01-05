package com.dreamhuggers.tracktis



import groovyx.net.http.RESTClient
import groovyx.net.http.HTTPBuilder
import groovy.util.slurpersupport.GPathResult
import static groovyx.net.http.ContentType.URLENC

class PhotoUploadCommand {
    byte[] photo
    String userId
}

class ImageController {
	def authenticateService
    def imageService
	def moostraxService

    def upload = { PhotoUploadCommand puc ->
        println "Starting upload"
        def user = User.findByUserId(puc.userId)
        user.profile.photo = puc.photo
        redirect(controller: 'user', action: 'profile', id: puc.userId)
    }

    def rawUpload = {
	      def currentUser = User.get(authenticateService.userDomain().id)
       /* // a Spring MultipartHttpServletRequest
        def mhsr = request.getFile('photo')
        if(!mhsr?.empty && mhrs.size < 1024*200) { // 200kb
            mhsr.transferTo(
                new File('/hubbub/images/${currentUser.userId}/mugshot.gif') )

        } */
	    //handle uploaded file
    def uploadedFile = request.getFile('photo')
    if(!uploadedFile.empty){
      println "Class: ${uploadedFile.class}"
      println "Name: ${uploadedFile.name}"
      println "OriginalFileName: ${uploadedFile.originalFilename}"
      println "Size: ${uploadedFile.size}"
      println "ContentType: ${uploadedFile.contentType}"
	    def webRootDir = servletContext.getRealPath("/")
	          def userDir = new File(webRootDir, "/hubbub/images/${currentUser.userId}")
	          userDir.mkdirs()
	          uploadedFile.transferTo( new File( userDir, uploadedFile.originalFilename))
	        }

    }
     



    

    def form = {




	    def currentUser = User.get(authenticateService.userDomain().id)
	    //def testi = moostraxService.getDevice(0,currentUser?.profile?.apiKey)
	    //currentUser?.profile?.apiDevice = testi
	    //currentUser.save()
	    //def lastLocation = moostraxService.getLastLocation(currentUser?.profile?.apiKey, currentUser?.profile?.apiDevice)

	    def locations = moostraxService.getHistory(currentUser?.profile?.apiKey, currentUser?.profile?.apiDevice, "06/01/2009 00:00:00", "07/14/2009 13:00:00")
        // pass through to upload form
	   for(location in locations){
		   currentUser.addToIncomingLocations(location)
	   }

	   [currentUser:currentUser, testi:currentUser?.profile?.apiDevice, lastLocation:lastLocation, locations:locations]

    }

    def view = {
        // path through to "view photo" page
    }

    def renderImage = {
        def user = User.findByUserId(params.id)
        if (user && user?.profile?.photo) {
            response.setContentLength(user.profile.photo.length)
            response.getOutputStream().write(user.profile.photo)
        } else {
            response.sendError(404)
        }

    }

    def tiny = {
        if (params.id) {
            def image = imageService.getUserTinyThumbnail(params.id)
            response.setContentLength(image.length)
            response.getOutputStream().write(image)
        } else {
            response.sendError(404)
        }

    }


}
