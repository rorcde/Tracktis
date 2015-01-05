<html>
    <head>
        <title>Search Results</title>
        <meta name="layout" content="main"/>
    </head>
    <body>

        <h1>Results</h1>
        <p>Searched ${com.dreamhuggers.tracktis.User.count()} records
        for items matching <em>${term}</em>.
        Found <strong>${users.size()}</strong> hits.
        </p>
        <ul>
            <g:each var="user" in="${users}">
                <li><g:link controller='user' action='profile' id='${user.userId}'>${user.userId}</g:link></li>

            </g:each>
        </ul>
          <br/>
    <br/>
        <g:link action='search'>Search Again</g:link>

    </body>
</html>
