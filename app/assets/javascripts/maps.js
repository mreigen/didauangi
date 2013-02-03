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