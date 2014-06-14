var rendererOptions = {
  draggable: true
};
var directionsDisplay = new google.maps.DirectionsRenderer(rendererOptions);
var directionsService = new google.maps.DirectionsService();
var waypoint_array = [];

function initialize() {
  var mapOptions = {
    center: new google.maps.LatLng(40.7127837, -74.0059413),
    zoom: 7,
    styles: [{"featureType":"water","stylers":[{"visibility":"on"},{"color":"#b5cbe4"}]},{"featureType":"landscape","stylers":[{"color":"#efefef"}]},{"featureType":"road.highway","elementType":"geometry","stylers":[{"color":"#83a5b0"}]},{"featureType":"road.arterial","elementType":"geometry","stylers":[{"color":"#bdcdd3"}]},{"featureType":"road.local","elementType":"geometry","stylers":[{"color":"#ffffff"}]},{"featureType":"poi.park","elementType":"geometry","stylers":[{"color":"#e3eed3"}]},{"featureType":"administrative","stylers":[{"visibility":"on"},{"lightness":33}]},{"featureType":"road"},{"featureType":"poi.park","elementType":"labels","stylers":[{"visibility":"on"},{"lightness":20}]},{},{"featureType":"road","stylers":[{"lightness":20}]}]
  };
  var map = new google.maps.Map(document.getElementById("map-canvas"), // map elememt ID
      mapOptions);
  directionsDisplay.setMap(map);

  google.maps.event.addListener(map, 'click', function(e) {
    placeWayPoint(e.latLng, map); // WAYPOINTS
    placeMarker(e.latLng, map); // MARKERS WITH INFOBOXS
  });

  google.maps.event.addListener(map, "zoom_changed", function() {
   var newZoom = map.getZoom();
   if (newZoom > 7){
    map.setZoom(7);
   }
   
  });
}

function placeMarker(position, map){

  var marker = new google.maps.Marker({
    position: position,
    map: map,
    draggable: true
  });

   google.maps.event.addListener(marker,'drag',function(event) {
      document.getElementById('lat').value = event.latLng.lat();
      document.getElementById('lng').value = event.latLng.lng();
  });

  google.maps.event.addListener(marker,'dragend',function(event) {
      document.getElementById('lat').value = event.latLng.lat();
      document.getElementById('lng').value = event.latLng.lng();
  });

  var boxText = document.createElement("div");
      boxText.style.cssText = "border: 1px solid black; margin-top: 8px; background: white; padding: 5px; border-radius: 10px; font-weight:bold;";
      boxText.innerHTML = "City Hall, Sechelt<br>British Columbia<br>Canada";
      // Store information in here from server posts/photos ^

  var myOptions = {
    content: boxText,
    disableAutoPan: false,
    maxWidth: 0,
    pixelOffset: new google.maps.Size(-140, 0),
    zIndex: null,
    boxStyle: {
      background: "url('tipbox.gif') no-repeat",
      opacity: 0.75,
      width: "280px"
     },
    closeBoxMargin: "10px 2px 2px 2px",
    closeBoxURL: "http://www.google.com/intl/en_us/mapfiles/close.gif",
    infoBoxClearance: new google.maps.Size(1, 1),
    isHidden: false,
    pane: "floatPane",
    enableEventPropagation: false,
  };

  var ib = new InfoBox(myOptions);
  ib.open(map, marker);
}

function placeWayPoint(position, map) {
  var current_waypoint = wayPointCreator(position);
  wayPointPusher(current_waypoint);
  calcRoute(current_waypoint);
  // map.panTo(position);
}

function wayPointCreator(position) {
  // Converted to object and then parsed as string
  // Original position has parenthesis
  var pos = new Object(position);
  pos = pos.k +","+ pos.A; // -49.938938,89.2748487
  return pos;
}

function wayPointPusher(position) {
  // Keeps waypoints stored in array
  waypoint_array.push({location: position});
}

function calcRoute(waypoint) {
  console.log("calcroute waypoint: " + waypoint);
  console.log("waypoint array: " + waypoint_array);

  var destination_marker = waypoint_array[waypoint_array.length - 1].location;
  // Stores three waypoints on initial click - needs fix
  var request = {
    origin: waypoint_array[0].location,
    destination: destination_marker,
    waypoints: waypoint_array,
    travelMode: google.maps.TravelMode.DRIVING
  };
  directionsService.route(request, function(response, status) {
    if (status == google.maps.DirectionsStatus.OK) {
      directionsDisplay.setDirections(response);
    }
  });
}

google.maps.event.addDomListener(window, 'load', initialize);