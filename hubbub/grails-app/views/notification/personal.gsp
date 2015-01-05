<html>
    <head>
        <title>Posts for ${targetUser.profile.fullName}</title>
	    <resource:dateChooser />
	    <resource:map type="GoogleMaps" key="ABQIAAAATd-YY7Y8hHu6Wl5TiGI3hRT2yXp_ZAY8_ufC3CFXhHIE1NvwkxQLJItfYLTgoKVjXatiOtEp9_h9ig" />
        <meta name="layout" content="main"/>
        <g:if test="${user.profile.skin}">
            <link rel="stylesheet" href="<g:createLinkTo dir='css' file='${user.profile.skin}.css'/>"/>
        </g:if>
    </head>
    <body>

	<!--
        <h3>
            Personal Posts for ${targetUser.profile.fullName}
        </h3>
	-->

        <g:if test="${ targetUser == user }">
            <g:render template="newnotification" model="[user: user, timelineType: 'mynotifications']"/>
        </g:if>

        <div id="allNotifications">
            <g:render template="notificationentries" collection="${notifications}" />
        </div>

        
        <g:paginate total="${notificationCount}"/>
        
    </body>
</html>
