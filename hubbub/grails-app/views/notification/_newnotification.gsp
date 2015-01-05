<div id="newPost">

    <input id="charLeft" name="charLeft" size="5" value="160" readonly="true"/>

    <h3>
        Who do you want to track?
    </h3>

    <g:if test="${flash.message}">
        <div class="flash">
            ${flash.message}
        </div>
    </g:if>

    <p>
       

        <g:form name="postMessage" action="ajaxAdd">
                             <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="location">Location:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:notificationInstance,field:'location','errors')}">
                                    <g:select optionKey="id" from="${myLocations}" name="location.id" value="${notificationInstance?.location?.id}" ></g:select>
                                 <a href="#" id="showHideUrl" onClick="Effect.toggle('tinyUrl', 'slide', { duration: 0.5 }); return false;">or create a new location</a>
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
                                    <g:select optionKey="id" from="${targetUser}" name="user.id" value="${notificationInstance?.user?.id}" ></g:select>
                                </td>
                            </tr>

                        </tbody>

                       
                    </table>
	        <g:submitToRemote value="Post"
                 url="[controller: 'notification', action: 'addLocationAjax']"
                 update="allLocations"
                 onSuccess="clearLocation(e)"
                 onLoading="showSpinner(true)"
                 onComplete="showSpinner(false)"/>

             <g:hiddenField name="timelineToReturn" value="${timelineType}"/>
             <img id="spinner" style="display: none"
                src="<g:createLinkTo dir='/images' file='spinner.gif'/>"/>

              <!-- <a href="#" id="showHideUrlOld" onClick="return toggleTinyUrl()">Show TinyURL</a>  -->


                </g:form>


                <div id="tinyUrl" style="display:none;">
	                        <g:form name="postMessage" action="ajaxAdd">
	        Location: <g:textField id="location" name="location"/><br/>
	        <strong>Description:</strong></br>
            <g:textArea id='postDescription' name="description" rows="3" cols="50" onkeydown="updateCounter()" /><br/>
            Latitude:     <g:textField id="latitude" name="latitude"/><br/>
	        Longitude: <g:textField id="longitude" name="longitude"/><br/>
	        Radius: <g:textField id="geofence_radius" name="geofence_radius" value="0"/><br/>
	        Public location? <g:checkBox name="forEveryone" ></g:checkBox>
	        <g:submitToRemote value="Post"
                 url="[controller: 'location', action: 'addLocationAjax']"
                 update="allLocations"
                 onSuccess="clearLocation(e)"
                 onLoading="showSpinner(true)"
                 onComplete="showSpinner(false)"/>

             <g:hiddenField name="timelineToReturn" value="${timelineType}"/>
             <img id="spinner" style="display: none"
                src="<g:createLinkTo dir='/images' file='spinner.gif'/>"/>

              <!-- <a href="#" id="showHideUrlOld" onClick="return toggleTinyUrl()">Show map</a>  -->
                <a href="#" id="showHideUrl" onClick="Effect.toggle('tinyUrl', 'slide', { duration: 0.5 }); return false;">Display Map</a>

                </g:form>

						Find your location:
							<richui:map search="true" draggable="true" lat="48.1346121" lng="11.5708395" latId="latitude" lngId="longitude" showStartMarker="true" />
				</div>

        

        <g:javascript>
            function clearLocation(e) {
	            $('location').value=''
                $('postDescription').value=''
	            $('latitude').value=''
	            $('longitude').value=''
	            $('geofence_radius').value=''
            }
            function showSpinner(visible) {
                $('spinner').style.display = visible ? "inline" : "none"
            }


            function updateCounter() {
                $("charLeft").value = 160 - $F("locationDescription").length
            }
            updateCounter();
        </g:javascript>

    </p>
</div>
