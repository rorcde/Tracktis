
<%@ page import="com.dreamhuggers.tracktis.Location" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Location List</title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${resource(dir:'')}">Home</a></span>
            <span class="menuButton"><g:link class="create" action="create">New Location</g:link></span>
        </div>
        <div class="body">
            <h1>Location List</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="list">
                <table>
                    <thead>
                        <tr>
                        
                   	        <g:sortableColumn property="id" title="Id" />
                        
                   	        <g:sortableColumn property="location" title="Location" />
                        
                   	        <g:sortableColumn property="description" title="Description" />
                        
                   	        <g:sortableColumn property="latitude" title="Latitude" />
                        
                   	        <g:sortableColumn property="longitude" title="Longitude" />
                        
                   	        <g:sortableColumn property="forEveryone" title="For Everyone" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${locationInstanceList}" status="i" var="locationInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${locationInstance.id}">${fieldValue(bean:locationInstance, field:'id')}</g:link></td>
                        
                            <td>${fieldValue(bean:locationInstance, field:'location')}</td>
                        
                            <td>${fieldValue(bean:locationInstance, field:'description')}</td>
                        
                            <td>${fieldValue(bean:locationInstance, field:'latitude')}</td>
                        
                            <td>${fieldValue(bean:locationInstance, field:'longitude')}</td>
                        
                            <td>${fieldValue(bean:locationInstance, field:'forEveryone')}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${locationInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
