
<%@ page import="com.dreamhuggers.tracktis.Notification" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Edit Notification</title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${resource(dir:'')}">Home</a></span>
            <span class="menuButton"><g:link class="list" action="list">Notification List</g:link></span>
            <span class="menuButton"><g:link class="create" action="create">New Notification</g:link></span>
        </div>
        <div class="body">
            <h1>Edit Notification</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${notificationInstance}">
            <div class="errors">
                <g:renderErrors bean="${notificationInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <input type="hidden" name="id" value="${notificationInstance?.id}" />
                <input type="hidden" name="version" value="${notificationInstance?.version}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="location">Location:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:notificationInstance,field:'location','errors')}">
                                    <g:select optionKey="id" from="${com.dreamhuggers.tracktis.Location.list()}" name="location.id" value="${notificationInstance?.location?.id}" ></g:select>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="name">Name:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:notificationInstance,field:'name','errors')}">
                                    <input type="text" maxlength="25" id="name" name="name" value="${fieldValue(bean:notificationInstance,field:'name')}"/>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="frequency">Frequency:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:notificationInstance,field:'frequency','errors')}">
                                    <g:select id="frequency" name="frequency" from="${notificationInstance.constraints.frequency.inList}" value="${notificationInstance.frequency}" ></g:select>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="startDate">Start Date:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:notificationInstance,field:'startDate','errors')}">
                                    <g:datePicker name="startDate" value="${notificationInstance?.startDate}" precision="minute" ></g:datePicker>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="endDate">End Date:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:notificationInstance,field:'endDate','errors')}">
                                    <g:datePicker name="endDate" value="${notificationInstance?.endDate}" precision="minute" ></g:datePicker>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="alerts">Alerts:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:notificationInstance,field:'alerts','errors')}">
                                    
<ul>
<g:each var="a" in="${notificationInstance?.alerts?}">
    <li><g:link controller="alert" action="show" id="${a.id}">${a?.encodeAsHTML()}</g:link></li>
</g:each>
</ul>
<g:link controller="alert" params="['notification.id':notificationInstance?.id]" action="create">Add Alert</g:link>

                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="enter">Enter:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:notificationInstance,field:'enter','errors')}">
                                    <g:checkBox name="enter" value="${notificationInstance?.enter}" ></g:checkBox>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="followed">Followed:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:notificationInstance,field:'followed','errors')}">
                                    <g:select optionKey="id" from="${com.dreamhuggers.tracktis.User.list()}" name="followed.id" value="${notificationInstance?.followed?.id}" ></g:select>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="tags">Tags:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:notificationInstance,field:'tags','errors')}">
                                    <g:select name="tags"
from="${com.dreamhuggers.tracktis.Tag.list()}"
size="5" multiple="yes" optionKey="id"
value="${notificationInstance?.tags}" />

                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="user">User:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:notificationInstance,field:'user','errors')}">
                                    <g:select optionKey="id" from="${com.dreamhuggers.tracktis.User.list()}" name="user.id" value="${notificationInstance?.user?.id}" ></g:select>
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
