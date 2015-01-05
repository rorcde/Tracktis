package com.dreamhuggers.tracktis

import groovyx.net.http.RESTClient
import groovyx.net.http.HTTPBuilder
import groovy.util.slurpersupport.GPathResult
import static groovyx.net.http.ContentType.URLENC
import org.springframework.beans.factory.InitializingBean;
import com.dreamhuggers.tracktis.*;

 /*
 The MoosTrax Rest service makes a request to the Moostrax API, it contains 4 methods:
 devices/ Gets a list of devices for an account
 device/ Gets a device's info
 location/ Gets the current location of a device
 history / Returns the history for a device

 The requested data is received as XML an parsed using the XmlSlurper, then it is passed to a map [:]
 and sent back to the controller for further processing
  */

class MoostraxService implements InitializingBean{

    boolean transactional = true

	String deviceId
	def grailsApplication



	def msapi
	def crs

	void afterPropertiesSet(){
	    	msapi 	= grailsApplication.config.std.msapi
    	crs 	= grailsApplication.config.std.crs	
	}


	def instaMapper(){
	String tempBuilder = "http://www.instamapper.com/api?action=getPositions&key=9465048385207065508&num=10&from_ts=1209252240"	
	def pro = tempBuilder.toURL().text
		def instamapper = new XmlSlurper().parseText(pro)

	}






	def getHistory(String myApiKey, String myDeviceKey, String startDate, String endDate ){
try{
String tempBuilder = msapi.MOOSTRAX_ADDRESS+msapi.HISTORY_LOCATION_ADDRESS+"?api_key="+myApiKey+"&device_id="+myDeviceKey+"&start="+startDate+"&end="+endDate
	println tempBuilder
	def pro = tempBuilder.toURL().text
	def moostrax = new XmlSlurper().parseText(pro)

	println moostrax.response.altitude.toString()
	def locationList = []


	moostrax.response.locations.location.each{
	def tempLocation = new IncomingLocation()
		println "Longitude: "+it?.longitude
		tempLocation.longitude= it?.longitude
		println "Date: "+it.date
		tempLocation.dateCreated = new Date().parse("yyyy-M-d H:m:s",location?.date.toString());
		println "Latitude: "+it?.latitude
		tempLocation.latitude= it?.latitude
		println "Accuracy: "+it?.accuarcy
		tempLocation.accuracy = it?.accuarcy
		println "Speed: "+it?.speed
		tempLocation.speed=it?.speed
		println "Heading: "+it?.heading
		tempLocation.heading=it?.heading
		 println "Next"
	locationList.add(tempLocation)
	    }

	[locationList:locationList]



//





		return [altitude:altitude, longitude:longitude, latitude:latitude, accuracy:accuracy, speed:speed, heading:heading, date:date]
			}
		catch(Exception e){println "There was a mistake"}






	}


	

	def getLastLocation(String myApiKey, String myDeviceKey){


				                       try{


String tempBuilder = msapi.MOOSTRAX_ADDRESS+msapi.LOCATION_ADDRESS+"?api_key="+myApiKey+"&device_id="+myDeviceKey
	println tempBuilder
	def pro = tempBuilder.toURL().text

		def moostrax = new XmlSlurper().parseText(pro)
println moostrax.response.altitude.toString()

		def altitude = moostrax.response.altitude.toString();
		def longitude = moostrax.response.longitude.toString();
		def latitude = moostrax.response.latitude.toString();
		def accuracy = moostrax.response.accuarcy.toString();
		def speed = moostrax.response.speed.toString();
		def heading = moostrax.response.heading.toString();
		def date = new Date().parse("yyyy-M-d H:m:s",moostrax.response.date.toString());
					                   
		println date;
		println altitude
		println longitude
		println latitude

					                      
//





		return [altitude:altitude, longitude:longitude, latitude:latitude, accuracy:accuracy, speed:speed, heading:heading, date:date]
			}
		catch(Exception e){println "There was a mistake"}




	}



    List getDevices(String myApiKey) {
	  		try{


		String tempBuilder = msapi.MOOSTRAX_ADDRESS+msapi.DEVICES_ADDRESS+"?api_key="+myApiKey
			def pro = tempBuilder.toURL().text

		def moostrax = new XmlSlurper().parseText(pro)
		def devicesList = moostrax.response.devices.device
				  List tempList
		for(d in devicesList){
			 String tempString = d.toString()
			tempList.add(tempString)
		}


		println moostrax.@count


		println moostrax.response.devices.device.@count


		return tempList
			}
		catch(Exception e){println "There was a mistake"}



    }

	String getDevice(int deviceNr, String myApiKey){
		try{


		String tempBuilder = msapi.MOOSTRAX_ADDRESS+msapi.DEVICES_ADDRESS+"?api_key="+myApiKey
			def pro = tempBuilder.toURL().text

		def moostrax = new XmlSlurper().parseText(pro)
		println moostrax.@count


		println moostrax.response.devices.device.@count

		return moostrax.response.devices.device[deviceNr].toString()
			}
		catch(Exception e){println "There was a mistake"}





	}




	def getLocation(){}






}