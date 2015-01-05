package com.dreamhuggers.tracktis

/*
The profile class stores the ApiKEY and the Device API of the MoosTrax client it also offers the possibility of diplaying
personal basic information.
 */

class Profile {

    static belongsTo = User

    byte[] photo

    String fullName
    String bio
    String apiKey
    String email
    String timezone
    String country
	String apiDevice
    String jabberAddress
    String skin

    static constraints = {
        fullName(nullable: true)
        bio(nullable: true, maxSize: 1000)
        apiKey(nullable: false)
        email(email: true, nullable: true)
	    apiDevice(nullable:true)
        photo(nullable: true)
        country(nullable: true)
        timezone(nullable: true)
        jabberAddress(email: true, nullable: true)
        skin(nullable: true, inList: ['blues', 'nighttime', ''])
    }

    String toString() {
        "Profile for ${fullName} (${id})"
    }

}
