
<%@ page import="com.dreamhuggers.tracktis.IncomingLocation" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>IncomingLocation List</title>
    </head>
    <body>
        <div class="body">
            <h1>IncomingLocation List</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="list">
                <table>
                    <thead>
                        <tr>
                        
                   	        <g:sortableColumn property="id" title="Id" />
                        
                   	        <g:sortableColumn property="latitude" title="Latitude" />
                        
                   	        <g:sortableColumn property="longitude" title="Longitude" />
                        
                   	        <g:sortableColumn property="speed" title="Speed" />
                        
                   	        <g:sortableColumn property="accuracy" title="Accuracy" />
                        
                   	        <g:sortableColumn property="heading" title="Heading" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${followers}" status="i" var="incomingLocationInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${incomingLocationInstance.id}">${fieldValue(bean:incomingLocationInstance, field:'id')}</g:link></td>
                        
                            <td>${fieldValue(bean:incomingLocationInstance, field:'latitude')}</td>
                        
                            <td>${fieldValue(bean:incomingLocationInstance, field:'longitude')}</td>
                        
                            <td>${fieldValue(bean:incomingLocationInstance, field:'speed')}</td>
                        
                            <td>${fieldValue(bean:incomingLocationInstance, field:'accuracy')}</td>
                        
                            <td>${fieldValue(bean:incomingLocationInstance, field:'heading')}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${incomingLocationInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
