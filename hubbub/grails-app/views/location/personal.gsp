<html>
    <head>
        <title>${targetUser.profile.fullName}' locations</title>
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
            <g:render template="newlocation" model="[user: user, timelineType: 'mylocations']"/>
        </g:if>

        <div id="allLocations">
            <g:render template="locationentries" collection="${locations}" />
        </div>

        
        <g:paginate total="${locationCount}"/>
        
    </body>
</html>
