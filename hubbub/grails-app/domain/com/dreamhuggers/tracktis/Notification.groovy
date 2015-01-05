package com.dreamhuggers.tracktis

class Notification implements Comparable{
	//Define relationships among classes
	static hasMany=[tags:Tag, alerts:Notification]
	static belongsTo=[user:User, followed:User]

	//Common constructors needed for the notification class
	String name
	Location location
	String frequency
	boolean enter
	Date startDate
	Date endDate



	//Common dateCreated and lastUpdated, nothing relevant
	Date dateCreated
	Date lastUpdated


	//When sorting the objects of this class, do it descendant
	// Fetch the corresponding location table immediately each time a Notification object is requested
	static mapping ={
		sort dateCreated:"desc"
		location lazy:false
	}

	//Validation constraints for this class
    static constraints = {
	    location(nullable:false)
	    name(blank:false, maxSize:25)
	    frequency(inList:["Daily", "Weekly", "Monthly", "Yearly"])
	    startDate(nullable:false, validator: {return (it >= new Date()-1)})
	    endDate(nullable:false, validator: {return (it >= new Date()-1)})
	    dateCreated()

    }
	//Automatically generate de creation date
	def beforeInsert = {
       dateCreated = new Date()
   }
	//Automatically update the last update date
	def beforeUpdate = {
       lastUpdated = new Date()
   }

	int compareTo(obj) {
       dateCreated.compareTo(obj.dateCreated)
   }

    String toString(){
        "${this.name}"
    }
}