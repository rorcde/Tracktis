<html>
    <head>
        <title>Profile: ${profile.fullName}</title>
        <meta name="layout" content="main"/>
<style>
    .profilePic {
        border: 1px dotted gray;
        background: lightyellow;
        padding: 1em;
        font-size: 1em;
    }
</style>
    </head>
    <body>


        <div class="profilePic">
            <g:if test="${profile.photo}">
                <img src="<g:createLink controller='image' action='renderImage' id='${userId}'/>"/>
            </g:if>
            <p>Profile for <strong>${profile.fullName}</strong></p>
            <p>Bio: ${profile.bio}</p>
	        <g:if test="${!friends && !friendshipRequest}"><p><g:link controller='user' action='requestFriendship' id='${userId}'>Request friendship
	        </p></g:link></g:if> <g:if test="${friendshipRequest}">
	        <p><g:link controller='user' action='acceptFriendship' id='${userId}'>Accept friendship
	        </g:link> / <g:link controller='user' action='rejectFriendship' id='${userId}'>Reject friendship
	        </g:link></p>
	        </g:if>
        </div>
      

    </body>
</html>
