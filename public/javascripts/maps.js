var districts = {
  "1": "10.775659,106.700424,15",
  "2": "10.796795,106.758849,14",
  "3": "10.781808,106.685136,15",
  "4": "10.759054,106.702824,15",
  "5": "10.755555,106.667448,15",
  "6": "10.74372,106.635025,15",
  "7": "10.738544,106.729361,15",
  "8": "10.729948,106.637972,15",
  "9": "10.84284,106.828685,14",
  "10": "10.77189,106.667448,15",
  "11": "10.76197,106.649762,15",
  "12": "10.87318,106.658605,13",
  "phu-nhuan": "",
  "binh-thanh": "",
  "tan-binh": "",
  "go-vap": "",
  "tan-phu": "",
  "thu-duc": "",
  "binh-tan": "",
}

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
  document.body.appendChild(script);
}

function loadMap(lat, long, zoomLevel) {
  var mapOptions = {
    zoom: parseInt(zoomLevel),
    center: new google.maps.LatLng(lat, long),
    mapTypeId: google.maps.MapTypeId.ROADMAP
  }
  var map = new google.maps.Map(document.getElementById("map_canvas"), mapOptions);
}

function loadPosition(value) {
  var latLongString = districts[value].toString();
  var latLongArray = latLongString.split(",");
  var lat = latLongArray[0];
  var lng = latLongArray[1];
  var zoom = latLongArray[2];
  loadMap(lat, lng, zoom);
}
