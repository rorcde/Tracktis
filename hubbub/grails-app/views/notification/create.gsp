
<%@ page import="com.dreamhuggers.tracktis.Notification" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Create Notification</title>
	    <resource:dateChooser />
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${resource(dir:'')}">Home</a></span>
            <span class="menuButton"><g:link class="list" action="list">Notification List</g:link></span>
        </div>
        <div class="body">
            <h1>Create Notification</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${notificationInstance}">
            <div class="errors">
                <g:renderErrors bean="${notificationInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="save" method="post" >
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="location">Location:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:notificationInstance,field:'location','errors')}">
                                    <g:select optionKey="id" from="${myLocations}" name="location.id" value="${notificationInstance?.location?.id}" ></g:select>
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
                                    <richui:dateChooser name="startDate" format="dd.MM.yyyy" value="${new Date()}" locale="en" firstDayOfWeek="Mo" />
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="endDate">End Date:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:notificationInstance,field:'endDate','errors')}">
                                    <richui:dateChooser name="endDate" format="dd.MM.yyyy" value="${new Date()+6}" locale="en" firstDayOfWeek="Mo" />
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
                                    <g:select optionKey="id" from="${following}" name="followed.id" value="${notificationInstance?.followed?.id}" ></g:select>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="user">User:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:notificationInstance,field:'user','errors')}">
                                    <g:select optionKey="id" from="${currentUser}" name="user.id" value="${notificationInstance?.user?.id}" ></g:select>
                                </td>
                            </tr> 
                        
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><input class="save" type="submit" value="Create" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
