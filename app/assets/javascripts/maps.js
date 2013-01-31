function initialize() {
  var mapOptions = {
    zoom: 16,
    center: new google.maps.LatLng(10.775659,106.700424),
    mapTypeId: google.maps.MapTypeId.ROADMAP
  }
  var map = new google.maps.Map(document.getElementById("map_canvas"), mapOptions);
}

function loadScript() {
  var script = document.createElement("script");
  script.type = "text/javascript";
  script.src = "http://maps.googleapis.com/maps/api/js?key=AIzaSyDI0e3hMs_Ui2BPu-K9mRRfCHX9LQaUhFc&sensor=true&callback=initialize";
  document.head.appendChild(script);
}

function loadMap(placesData, lat, long, zoomLevel) {
  console.log("in loadMap");
  console.log(placesData);
  
  var mapOptions = {
    //zoom: parseInt(zoomLevel),
    zoom: 14,
    center: new google.maps.LatLng(lat, long),
    mapTypeId: google.maps.MapTypeId.ROADMAP
  }
  var map = new google.maps.Map(document.getElementById("map_canvas"), mapOptions);
  
  // creating markers
  jQuery.each(placesData, function(index) {
    createMarker(placesData[index], map);
  });
}

var infoWindows = [];
var markerArray = [];

function closeAllInfoWindows() {
  jQuery.each(infoWindows, function(index, value) {
    infoWindows[index].close();
  });
}

function clearAllMarkers() {
  jQuery.each(markerArray, function(index, value) {
    markerArray[index].setMap(null);
  });
}

function createMarker(placeData, map) {
  var address = placeData.address;
  var placeName = placeData.name;
  var phone = placeData.phone;
  
  var contentString = '<div id="content">'+
      '<div id="siteNotice">'+
      '</div>'+
      '<h2 id="firstHeading" class="firstHeading">' + placeName + '</h2>'+
      '<div id="bodyContent">'+
      '<p>' + address + '</p>'+
      '<p> Phone: ' + phone+ '</p>'+
      '</div>'+
      '</div>';

  var infowindow = new google.maps.InfoWindow({
      content: contentString
  });
  // add to the info window array
  infoWindows.push(infowindow);

  // get place's lat and lng
  jQuery.ajax({
    method: "get",
    url: "http://maps.googleapis.com/maps/api/geocode/json?address=" + address + "&sensor=true",
    success: function(data) {
      if (typeof data.results[0] === "undefined") {
        console.log("failed retrieving address:");
        console.log(data.results);
        return;
      }
      
      var lat = data.results[0].geometry.location.lat;
      var lng = data.results[0].geometry.location.lng;
      placePos = new google.maps.LatLng(lat,lng);
      var marker = new google.maps.Marker({
          position: placePos,
          map: map,
          draggable: true,
          title: address,
          type: 'point'
      });
      // add to the marker array
      markerArray.push(marker);
      
      google.maps.event.addListener(marker, 'click', function() {
        // close all the opened info windows
        closeAllInfoWindows();
        infowindow.open(map,marker);
      }); 
    }
  });
}