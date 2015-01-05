package com.dreamhuggers.tracktis

class Location implements Comparable{

	static belongsTo = [user:User]
	static hasMany =[tags:Tag, notifications:Notification]

	String location
	String description
	Double latitude
	Double longitude
	Double geofence_radius
	Boolean forEveryone

	Date dateCreated
	Date lastUpdated

    static constraints = {
	    location(blank:false, maxSize:20)
	    description(blank:false, maxSize:150 )
	    latitude(nullable:false)
	    longitude(nullable:false)
	    forEveryone(nullable:true)

	    geofence_radius(nullable:true, blank:true)
	    dateCreated()
    }

		static mapping ={
		sort dateCreated:"desc"
	}

	def beforeInsert = {
       dateCreated = new Date()
   }
	def beforeUpdate = {
       lastUpdated = new Date()
   }


	boolean same(Location location){
		double localLatitude = trimmer(this.latitude);
		double externalLatitude = trimmer(location.latitude);
		double localLongitude = trimmer(this.longitude);
		double externalLongitude = trimmer(location.longitude);

		if(localLatitude == externalLatitude && localLongitude == externalLongitude){
			return true
		}
        else return false
	}

	double trimmer(double coordinate){
		int decimalPlace = 2;
		BigDecimal bd = new BigDecimal( Double.toString(coordinate) );
		bd = bd.setScale( decimalPlace, BigDecimal.ROUND_HALF_UP );
		double result=	bd.doubleValue();
		return result
	}
	    String toString(){
        "${this.location}"
    }

	int compareTo(obj) {
       dateCreated.compareTo(obj.dateCreated)
   }

}

