
<%@ page import="com.dreamhuggers.tracktis.Notification" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Notification List</title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${resource(dir:'')}">Home</a></span>
            <span class="menuButton"><g:link class="create" action="create">New Notification</g:link></span>
        </div>
        <div class="body">
            <h1>Notification List</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="list">
                <table>
                    <thead>
                        <tr>
                        
                   	        <g:sortableColumn property="id" title="Id" />
                        
                   	        <th>Location</th>
                   	    
                   	        <g:sortableColumn property="name" title="Name" />
                        
                   	        <g:sortableColumn property="frequency" title="Frequency" />
                        
                   	        <g:sortableColumn property="startDate" title="Start Date" />
                        
                   	        <g:sortableColumn property="endDate" title="End Date" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${notificationInstanceList}" status="i" var="notificationInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${notificationInstance.id}">${fieldValue(bean:notificationInstance, field:'id')}</g:link></td>
                        
                            <td>${fieldValue(bean:notificationInstance, field:'location')}</td>
                        
                            <td>${fieldValue(bean:notificationInstance, field:'name')}</td>
                        
                            <td>${fieldValue(bean:notificationInstance, field:'frequency')}</td>
                        
                            <td>${fieldValue(bean:notificationInstance, field:'startDate')}</td>
                        
                            <td>${fieldValue(bean:notificationInstance, field:'endDate')}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${notificationInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
