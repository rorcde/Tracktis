
<%@ page import="com.dreamhuggers.tracktis.IncomingLocation" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Show IncomingLocation</title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${resource(dir:'')}">Home</a></span>
            <span class="menuButton"><g:link class="list" action="list">IncomingLocation List</g:link></span>
            <span class="menuButton"><g:link class="create" action="create">New IncomingLocation</g:link></span>
        </div>
        <div class="body">
            <h1>Show IncomingLocation</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="dialog">
                <table>
                    <tbody>

                    
                        <tr class="prop">
                            <td valign="top" class="name">Latitude:</td>
                            
                            <td valign="top" class="value">${fieldValue(bean:incomingLocationInstance, field:'latitude')}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Longitude:</td>
                            
                            <td valign="top" class="value">${fieldValue(bean:incomingLocationInstance, field:'longitude')}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Speed:</td>
                            
                            <td valign="top" class="value">${fieldValue(bean:incomingLocationInstance, field:'speed')}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Accuracy:</td>
                            
                            <td valign="top" class="value">${fieldValue(bean:incomingLocationInstance, field:'accuracy')}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Heading:</td>
                            
                            <td valign="top" class="value">${fieldValue(bean:incomingLocationInstance, field:'heading')}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Last Updated:</td>
                            
                            <td valign="top" class="value">${fieldValue(bean:incomingLocationInstance, field:'lastUpdated')}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Date Created:</td>
                            
                            <td valign="top" class="value">${fieldValue(bean:incomingLocationInstance, field:'dateCreated')}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">User:</td>
                            
                            <td valign="top" class="value"><g:link controller="user" action="show" id="${incomingLocationInstance?.user?.id}">${incomingLocationInstance?.user?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                    
                    </tbody>
                </table>
            </div>
            <div class="buttons">
                <g:form>
                    <input type="hidden" name="id" value="${incomingLocationInstance?.id}" />
                    <span class="button"><g:actionSubmit class="edit" value="Edit" /></span>
                    <span class="button"><g:actionSubmit class="delete" onclick="return confirm('Are you sure?');" value="Delete" /></span>
                </g:form>
            </div>
        </div>
    </body>
</html>
