package com.dreamhuggers.tracktis
class IncomingLocation implements Comparable{

	static belongsTo=[user:User]


    Double latitude
    Double longitude
	Double speed
	Double accuracy
	Double heading
    public static final String API_KEY = "ABQIAAAATd-YY7Y8hHu6Wl5TiGI3hRT2yXp_ZAY8_ufC3CFXhHIE1NvwkxQLJItfYLTgoKVjXatiOtEp9_h9ig"

	Date dateCreated
    Date lastUpdated

	def beforeInsert = {
       dateCreated = new Date()
   }
	def beforeUpdate = {
       lastUpdated = new Date()
   }

    static constraints = {
        latitude(nullable:true)
        longitude(nullable:true)
	    speed(nullable:true)
	    accuracy(nullable:true)
	    heading(nullable:true)
	    lastUpdated(nullable: true)
    }

	static mapping ={
		sort dateCreated:"desc"
	}

	int compareTo(obj) {
       dateCreated.compareTo(obj.dateCreated)
   }
    String toString(){
        "${id}"
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

}
