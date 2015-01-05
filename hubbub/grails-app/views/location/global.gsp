<html>
    <head>
        <title>Public Locations</title>
        <meta name="layout" content="main"/>
    </head>
    <body>

	<!--	
        <h3>
            Global Timeline
        </h3>
	-->
	
        <g:if test="${session.user}">
            <g:render template="newlocation" model="[user: session.user, timelineType: 'global']"/>
        </g:if>

        <div id="allLocations">
            <g:render template="locationentries" collection="${locations}" />
        </div>

        <g:paginate total="${locationCount}"/>

    </body>
</html>
