
<%@ page import="com.dreamhuggers.tracktis.Location" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Show Location</title>
	    <resource:map type="GoogleMaps" key="ABQIAAAATd-YY7Y8hHu6Wl5TiGI3hRT2yXp_ZAY8_ufC3CFXhHIE1NvwkxQLJItfYLTgoKVjXatiOtEp9_h9ig" />
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${resource(dir:'')}">Home</a></span>
            <span class="menuButton"><g:link class="list" action="list">Location List</g:link></span>
            <span class="menuButton"><g:link class="create" action="create">New Location</g:link></span>
        </div>
        <div class="body">
            <h1>Show Location</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="dialog">
                <table>
                    <tbody>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Location:</td>
                            
                            <td valign="top" class="value"><richui:map lat="${locationInstance?.latitude}" lng="${locationInstance?.longitude}" /></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Description:</td>
                            
                            <td valign="top" class="value">${fieldValue(bean:locationInstance, field:'description')}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Latitude:</td>
                            
                            <td valign="top" class="value">${fieldValue(bean:locationInstance, field:'latitude')}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Longitude:</td>
                            
                            <td valign="top" class="value">${fieldValue(bean:locationInstance, field:'longitude')}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">For Everyone:</td>
                            
                            <td valign="top" class="value">${fieldValue(bean:locationInstance, field:'forEveryone')}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Geofenceradius:</td>
                            
                            <td valign="top" class="value">${fieldValue(bean:locationInstance, field:'geofence_radius')}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Date Created:</td>
                            
                            <td valign="top" class="value">${fieldValue(bean:locationInstance, field:'dateCreated')}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Last Updated:</td>
                            
                            <td valign="top" class="value">${fieldValue(bean:locationInstance, field:'lastUpdated')}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Notifications:</td>
                            
                            <td  valign="top" style="text-align:left;" class="value">
                                <ul>
                                <g:each var="n" in="${locationInstance.notifications}">
                                    <li><g:link controller="notification" action="show" id="${n.id}">${n?.encodeAsHTML()}</g:link></li>
                                </g:each>
                                </ul>
                            </td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Tags:</td>
                            
                            <td  valign="top" style="text-align:left;" class="value">
                                <ul>
                                <g:each var="t" in="${locationInstance.tags}">
                                    <li><g:link controller="tag" action="show" id="${t.id}">${t?.encodeAsHTML()}</g:link></li>
                                </g:each>
                                </ul>
                            </td>
                            
                        </tr>
                    
                    </tbody>
                </table>
            </div>
            <div class="buttons">
                <g:form>
                    <input type="hidden" name="id" value="${locationInstance?.id}" />
                    <span class="button"><g:actionSubmit class="edit" value="Edit" /></span>
                    <span class="button"><g:actionSubmit class="delete" onclick="return confirm('Are you sure?');" value="Delete" /></span>
                </g:form>
            </div>
        </div>
    </body>
</html>
