package com.dreamhuggers.tracktis

class Tag {

    String name
    User user

    static constraints = {
        name(blank: false)
    }

    static hasMany = [ posts : Post,
                       notifications:Notification,
		               locations:Location
    ]

    //NB owned by post, so you can only do post.addToTags() not other way around
    static belongsTo = [ User, Post, Notification, Location ]

	String toString(){
        "${this.name}"
    }
}
