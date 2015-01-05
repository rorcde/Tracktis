var mPoints = [];
var map;
var mManager = null;
var mLastLocation = null;
var mUpdateTimeout = null;
var mPolyOptions = {geodesic:true};
var mPolyline = null;
var mLocs = {};

function loadMap() {
    if (GBrowserIsCompatible()) {
        map = new GMap2(document.getElementById("map"));
        map.addControl(new GLargeMapControl());
        map.addControl(new GMapTypeControl());
  }
}

function updateLiveLocation(device, location) {
    var loc = new GLatLng(location.latitude, location.longitude);
    map.setCenter(loc, map.getZoom() || 13);

    if(mManager == null) mManager = new MarkerManager(map);

    if(mLastLocation == null || !loc.equals(mLastLocation)) {
        var marker = createRegularMarker(loc, getInfoWindowTabsForLoc(location));
        mManager.addMarkers([marker], 1);

        if(mPolyline != null) map.removeOverlay(mPolyline);
        mPoints.push(loc);
        mPolyline = new GPolyline(mPoints, "#05EDFF", 10, 1, mPolyOptions);
        map.addOverlay(mPolyline);
        mLastLocation = loc;
        mManager.refresh();
        GEvent.trigger(marker, "click");
    }


    setStatus("Received latest location. " + new Date(location.date_added*1000).toLocaleString());
}

function getBlueIcon() {
    var icon = new GIcon();
    icon.image = "http://labs.google.com/ridefinder/images/mm_20_blue.png";
    icon.shadow = "http://labs.google.com/ridefinder/images/mm_20_shadow.png";
    icon.iconSize = new GSize(12, 20);
    icon.shadowSize = new GSize(22, 20);
    icon.iconAnchor = new GPoint(6, 20);
    icon.infoWindowAnchor = new GPoint(5, 1);

    return icon;
}

function getInfoWindowTabsForLoc(loc) {
    var tabs = [];
    var content = "";

    // location
    content = "<b>Latitude</b>: " + loc.latitude + "<br/>";
    content += "<b>Longitude</b>: " + loc.longitude + "<br/>";
    content += "<b>Altitude</b>: " + loc.altitude + "<br/>";
    content += "<b>Speed</b>: " + loc.speed + "<br/>";
    content += "<b>Course</b>: " + loc.heading + "<br/>";
    content += "<b>GPS Accuracy</b>: " + loc.accuracy + "<br/>";
    content += "<b>Date</b>: " + new Date(loc.date_added*1000).toLocaleString() + "";

    var locTab = new GInfoWindowTab('Location', content);
    tabs.push(locTab);

    // device
    content = "<b>Battery Level</b>: " + loc.battery + "%<br/>";
    var deviceTab = new GInfoWindowTab('Device', content);
    tabs.push(deviceTab);


    return tabs;
}

function createRegularMarker(point, html) {
    var markerOptions = {};
    var marker = new GMarker(point, markerOptions);
    GEvent.addListener(marker, "click", function() {
            marker.openInfoWindowTabsHtml(html);
        });
    return marker;
}

function createMarker(point, html) {
    var markerOptions = {icon: getBlueIcon()};
    var marker = new GMarker(point, markerOptions);
    GEvent.addListener(marker, "click", function() {
            marker.openInfoWindowTabsHtml(html);
        });
    return marker;
}

function addPrevLocations(locs) {
    if(mPolyline != null) map.removeOverlay(mPolyline);


    if(locs.length == 0) return;
    map.setCenter(new GLatLng(locs[0].latitude, locs[0].longitude), map.getZoom() || 13);
    if(mManager == null) mManager = new MarkerManager(map);
    for(var x = 0; x < locs.length; x++) {
        var pt = new GLatLng(locs[x].latitude, locs[x].longitude);

        mPoints.push(pt);
        var marker = createMarker(pt, getInfoWindowTabsForLoc(locs[x]));
        mManager.addMarkers([marker], 1);
    }
    mManager.refresh();
    mPolyline = new GPolyline(mPoints, "#05EDFF", 10, 1, mPolyOptions);
    map.addOverlay(mPolyline);
}

function updateLocation(device_id, updateMs) {
    var params = "?id=" + escape(device_id);
  new Ajax.Request('/tracking/location/' + params,
  {
    method:'get',
    onSuccess: function(transport){
      var response = transport.responseText.evalJSON();
      if(response.ok) {
        updateLiveLocation(response.ok.device, response.ok.location);
      }
      else {
        setNoLocation();
        setStatus(response.error);
      }
    },
    onFailure: function(){ setError("Unable to load location at this time."); }
  });
  mUpdateTimeout = setTimeout("updateLocation(" + device_id + ", " + updateMs + ");", updateMs);
}

function loadPreviousLocations(device_id) {
      var params = "?previous=1&id=" + escape(device_id);
      setStatus("Loading recent locations...");
  new Ajax.Request('/tracking/location/' + params,
  {
    method:'get',
    onSuccess: function(transport){
      var response = transport.responseText.evalJSON();
      if(response.ok) {
        addPrevLocations(response.ok.locations);
      }
      else {

      }
    },
    onFailure: function(){ setError("Unable to load location at this time."); }
  });
}

function setHistory(device, locs) {
    if(mPolyline != null) map.removeOverlay(mPolyline);
    mPoints = [];
    if(mManager != null) mManager.clearMarkers();

    if(locs.length == 0) {
        setStatus("There is no history available for this start/end date.");
        return;
    }
    map.setCenter(new GLatLng(locs[0].latitude, locs[0].longitude), map.getZoom() || 13);
    if(mManager == null) mManager = new MarkerManager(map);
    for(var x = 0; x < locs.length; x++) {
        var pt = new GLatLng(locs[x].latitude, locs[x].longitude);

        mPoints.push(pt);
        var marker = createMarker(pt, getInfoWindowTabsForLoc(locs[x]));
        mManager.addMarkers([marker], 1);
    }
    mManager.refresh();
    mPolyline = new GPolyline(mPoints, "#05EDFF", 10, 1, mPolyOptions);
    map.addOverlay(mPolyline);

    setStatus("Loaded " + locs.length.toString() + " locations from history.");
}

function loadHistory(device_id, start, end) {
  var params = "?id=" + escape(device_id) + "&start=" + escape(start) + "&end=" + escape(end);
  new Ajax.Request('/tracking/ahistory/' + params,
  {
    method:'get',
    onSuccess: function(transport){
      var response = transport.responseText.evalJSON();
      if(response.ok) {
        setHistory(response.ok.device, response.ok.locations);
      }
      else {
        setError("Unable to load history: " + response.error);
      }
    },
    onFailure: function(){ setError("Unable to load location at this time."); }
  });
}

function loadLiveLocation(device_id, updateMs) {
  if(mUpdateTimeout != null) {
    clearTimeout(mUpdateTimeout);
    mUpdateTimeout = null;
  }
  if(mManager != null) mManager.clearMarkers();
  mLastLocation = null;
  mPoints = [];
  mLocs = {};
  if(mPolyline != null) map.removeOverlay(mPolyline);
  map.clearOverlays();
  //updateLocation(device_id, updateMs);
  setTimeout("updateLocation(" + device_id + ", " + updateMs + ");", 0);
}