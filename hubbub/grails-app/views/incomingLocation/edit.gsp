
<%@ page import="com.dreamhuggers.tracktis.IncomingLocation" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Edit IncomingLocation</title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${resource(dir:'')}">Home</a></span>
            <span class="menuButton"><g:link class="list" action="list">IncomingLocation List</g:link></span>
            <span class="menuButton"><g:link class="create" action="create">New IncomingLocation</g:link></span>
        </div>
        <div class="body">
            <h1>Edit IncomingLocation</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${incomingLocationInstance}">
            <div class="errors">
                <g:renderErrors bean="${incomingLocationInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <input type="hidden" name="id" value="${incomingLocationInstance?.id}" />
                <input type="hidden" name="version" value="${incomingLocationInstance?.version}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="latitude">Latitude:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:incomingLocationInstance,field:'latitude','errors')}">
                                    <input type="text" id="latitude" name="latitude" value="${fieldValue(bean:incomingLocationInstance,field:'latitude')}" />
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="longitude">Longitude:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:incomingLocationInstance,field:'longitude','errors')}">
                                    <input type="text" id="longitude" name="longitude" value="${fieldValue(bean:incomingLocationInstance,field:'longitude')}" />
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="speed">Speed:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:incomingLocationInstance,field:'speed','errors')}">
                                    <input type="text" id="speed" name="speed" value="${fieldValue(bean:incomingLocationInstance,field:'speed')}" />
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="accuracy">Accuracy:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:incomingLocationInstance,field:'accuracy','errors')}">
                                    <input type="text" id="accuracy" name="accuracy" value="${fieldValue(bean:incomingLocationInstance,field:'accuracy')}" />
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="heading">Heading:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:incomingLocationInstance,field:'heading','errors')}">
                                    <input type="text" id="heading" name="heading" value="${fieldValue(bean:incomingLocationInstance,field:'heading')}" />
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="user">User:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:incomingLocationInstance,field:'user','errors')}">
                                    <g:select optionKey="id" from="${com.dreamhuggers.tracktis.User.list()}" name="user.id" value="${incomingLocationInstance?.user?.id}" ></g:select>
                                </td>
                            </tr> 
                        
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><g:actionSubmit class="save" value="Update" /></span>
                    <span class="button"><g:actionSubmit class="delete" onclick="return confirm('Are you sure?');" value="Delete" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
