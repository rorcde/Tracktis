<div class="postImage">
    <g:if test="${location?.user?.profile?.photo}">
        <img src="<g:createLink controller='image' action='renderImage' id='${location?.user?.userId}'/>"/>
    </g:if>
</div>
<div class="postEntry">
    <div class="postText">

        <a href="<g:createLink controller='user'
           action='profile' id='${location?.user?.userId}'/>">${location?.user?.userId}</a>
        <a href="<g:createLink controller='location'
           action='show' id='${location?.id}'/>">${location?.location}</a> (lt: ${location?.latitude} - lg: ${location?.longitude}) <br/>
	    ${location.description}


    </div>
    <div class="postDate">
        <h:dateFromNow date="${location?.dateCreated}"/>
    </div>
</div>
 