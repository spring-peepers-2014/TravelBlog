var rendererOptions = {
  draggable: true
};
var directionsDisplay = new google.maps.DirectionsRenderer(rendererOptions);
var directionsService = new google.maps.DirectionsService();
var waypoint_array = [];

function initialize() {
  var mapOptions = {
    center: new google.maps.LatLng(40.7127837, -74.0059413),
    zoom: 13,
    styles: [{"featureType":"water","stylers":[{"visibility":"on"},{"color":"#b5cbe4"}]},{"featureType":"landscape","stylers":[{"color":"#efefef"}]},{"featureType":"road.highway","elementType":"geometry","stylers":[{"color":"#83a5b0"}]},{"featureType":"road.arterial","elementType":"geometry","stylers":[{"color":"#bdcdd3"}]},{"featureType":"road.local","elementType":"geometry","stylers":[{"color":"#ffffff"}]},{"featureType":"poi.park","elementType":"geometry","stylers":[{"color":"#e3eed3"}]},{"featureType":"administrative","stylers":[{"visibility":"on"},{"lightness":33}]},{"featureType":"road"},{"featureType":"poi.park","elementType":"labels","stylers":[{"visibility":"on"},{"lightness":20}]},{},{"featureType":"road","stylers":[{"lightness":20}]}]
  };
  var map = new google.maps.Map(document.getElementById("map-canvas"), // map elememt ID
      mapOptions);
  directionsDisplay.setMap(map);

  google.maps.event.addListener(map, 'click', function(e) {
    placeWayPoint(e.latLng, map);
  });
}

function placeWayPoint(position, map) {
  // Old code for placing markers rather than making routes -

  // var marker = new google.maps.Marker({
  //   position: position,
  //   map: map
  // });
  // console.log(position);

  var current_waypoint = wayPointCreator(position);
  wayPointPusher(current_waypoint);
  calcRoute(position, current_waypoint);
  // map.panTo(position);
}

function wayPointCreator(position) {
  // Converted to object and then parsed as string
  // Original position has parenthesis
  var pos = new Object(position);
  pos = pos.k +","+ pos.A;
  return pos;
}

function wayPointPusher(pos) {
  waypoint_array.push({location: pos});
}

function calcRoute(position, waypoint) {
  console.log("calcroute waypoint: " + waypoint);
  console.log("waypoint array: " + waypoint_array);

  var destination_marker = waypoint_array[waypoint_array.length - 1].location;

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