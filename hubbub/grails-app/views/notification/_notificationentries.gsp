<div class="postImage">
    <g:if test="${notification?.followed?.profile?.photo}">
        <img src="<g:createLink controller='image' action='renderImage' id='${notification?.followed?.userId}'/>"/>
    </g:if>
</div>
<div class="postEntry">
    <div class="postText">

        If <a href="<g:createLink controller='user'
           action='profile' id='${notification?.followed?.userId}'/>">${notification?.followed?.userId}</a>
	    <g:if test="${notification?.enter == true}">enters</g:if><g:else>exits</g:else> ${notification?.location?.location} (lng: ${notification?.location?.longitude} - ltd: ${notification?.location?.latitude})
	    every ${notification?.frequency} you will be notified!<br/>
	    Description: <a href="<g:createLink controller='notification' action='show' id='${notification?.id}'/>">${notification?.name}</a><br/>

    </div>
    <div class="postDate">
        <h:remainingTimeFromNow date="${notification?.endDate}"/>
    </div>
</div>
 