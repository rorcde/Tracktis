
<%@ page import="com.dreamhuggers.tracktis.Location" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Edit Location</title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${resource(dir:'')}">Home</a></span>
            <span class="menuButton"><g:link class="list" action="list">Location List</g:link></span>
            <span class="menuButton"><g:link class="create" action="create">New Location</g:link></span>
        </div>
        <div class="body">
            <h1>Edit Location</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${locationInstance}">
            <div class="errors">
                <g:renderErrors bean="${locationInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <input type="hidden" name="id" value="${locationInstance?.id}" />
                <input type="hidden" name="version" value="${locationInstance?.version}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="location">Location:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:locationInstance,field:'location','errors')}">
                                    <input type="text" maxlength="20" id="location" name="location" value="${fieldValue(bean:locationInstance,field:'location')}"/>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="description">Description:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:locationInstance,field:'description','errors')}">
                                    <input type="text" maxlength="150" id="description" name="description" value="${fieldValue(bean:locationInstance,field:'description')}"/>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="latitude">Latitude:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:locationInstance,field:'latitude','errors')}">
                                    <input type="text" id="latitude" name="latitude" value="${fieldValue(bean:locationInstance,field:'latitude')}" />
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="longitude">Longitude:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:locationInstance,field:'longitude','errors')}">
                                    <input type="text" id="longitude" name="longitude" value="${fieldValue(bean:locationInstance,field:'longitude')}" />
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="forEveryone">For Everyone:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:locationInstance,field:'forEveryone','errors')}">
                                    <g:checkBox name="forEveryone" value="${locationInstance?.forEveryone}" ></g:checkBox>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="geofence_radius">Geofenceradius:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:locationInstance,field:'geofence_radius','errors')}">
                                    <input type="text" id="geofence_radius" name="geofence_radius" value="${fieldValue(bean:locationInstance,field:'geofence_radius')}" />
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="notifications">Notifications:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:locationInstance,field:'notifications','errors')}">
                                    
<ul>
<g:each var="n" in="${locationInstance?.notifications?}">
    <li><g:link controller="notification" action="show" id="${n.id}">${n?.encodeAsHTML()}</g:link></li>
</g:each>
</ul>
<g:link controller="notification" params="['location.id':locationInstance?.id]" action="create">Add Notification</g:link>

                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="tags">Tags:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:locationInstance,field:'tags','errors')}">
                                    <g:select name="tags"
from="${com.dreamhuggers.tracktis.Tag.list()}"
size="5" multiple="yes" optionKey="id"
value="${locationInstance?.tags}" />

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
