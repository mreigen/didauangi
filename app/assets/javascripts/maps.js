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
    zoom: 13,
    center: new google.maps.LatLng(lat, long),
    mapTypeId: google.maps.MapTypeId.ROADMAP
  }
  var map = new google.maps.Map(document.getElementById("map_canvas"), mapOptions);
  
  // creating markers
  // get place's lat and lng
  jQuery.ajax({
    method: "get",
    url: "http://maps.googleapis.com/maps/api/geocode/json?address=" + placesData[0].address + "&sensor=true",
    success: function(data) {
      var lat = data.results[0].geometry.location.lat;
      var lng = data.results[0].geometry.location.lng;
      placePos = new google.maps.LatLng(lat,lng);
      console.log(placePos);
      var marker = new google.maps.Marker({
          position: placePos,
          map: map,
          draggable: true,
          title: placesData[0].address,
          type: 'point'
      });
      
    }
  })
}