package com.dreamhuggers.tracktis

/**
 * Authority domain class.
 */
class Role {

       static hasMany = [people: User]

       /** description */
       String description
       /** ROLE String */
       String authority

       static constraints = {
               authority(blank: false, unique: true)
               description()
       }
	String toString(){
        "${this.description}"
    }
}
