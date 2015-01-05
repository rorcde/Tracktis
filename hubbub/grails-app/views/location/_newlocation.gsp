<div id="newPost">

    <input id="charLeft" name="charLeft" size="5" value="160" readonly="true"/>

    <h3>
        Where is dangerous?
    </h3>

    <g:if test="${flash.message}">
        <div class="flash">
            ${flash.message}
        </div>
    </g:if>

    <p>
       

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


                <div id="tinyUrl" style="display:none;">

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
                $("charLeft").value = 160 - $F("postDescription").length
            }
            updateCounter();
        </g:javascript>

    </p>
</div>
