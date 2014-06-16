/* Wait, so for a largely front-end app, this is your solution
 * for testability?  Where's the Jasmine?
*
*
*  Come to think of it, this code lives in the javascript directory
*  so that means eery time your app runs you're delivering this
*  to the client?  Do you want them to always get this?  Can 
*  this be removed?  
*
* */
var rendererOptions = {
    draggable: true
};
var directionsDisplay = new google.maps.DirectionsRenderer(rendererOptions);
var directionsService = new google.maps.DirectionsService();
var waypoint_array = [];

var mapOptions;
var theMap;

$( document ).ready( function() {
    mapOptions = {
        center: new google.maps.LatLng(40.7127837, -74.0059413),
        zoom: 7,
        styles: [{
            "featureType": "water",
            "stylers": [{
                "visibility": "on"
            }, {
                "color": "#b5cbe4"
            }]
        }, {
            "featureType": "landscape",
            "stylers": [{
                "color": "#efefef"
            }]
        }, {
            "featureType": "road.highway",
            "elementType": "geometry",
            "stylers": [{
                "color": "#83a5b0"
            }]
        }, {
            "featureType": "road.arterial",
            "elementType": "geometry",
            "stylers": [{
                "color": "#bdcdd3"
            }]
        }, {
            "featureType": "road.local",
            "elementType": "geometry",
            "stylers": [{
                "color": "#ffffff"
            }]
        }, {
            "featureType": "poi.park",
            "elementType": "geometry",
            "stylers": [{
                "color": "#e3eed3"
            }]
        }, {
            "featureType": "administrative",
            "stylers": [{
                "visibility": "on"
            }, {
                "lightness": 33
            }]
        }, {
            "featureType": "road"
        }, {
            "featureType": "poi.park",
            "elementType": "labels",
            "stylers": [{
                "visibility": "on"
            }, {
                "lightness": 20
            }]
        }, {}, {
            "featureType": "road",
            "stylers": [{
                "lightness": 20
            }]
        }]
    };

    theMap = new google.maps.Map(document.getElementById("map-canvas"), // map elememt ID
        mapOptions);

    google.maps.event.addDomListener(window, 'load', initialize(theMap));

    $('#draw-route').on('click', function(e) {
        e.preventDefault();
        calcRoute();
    });
});

function initialize(map) {

    directionsDisplay.setMap(map);

    google.maps.event.addListener(map, 'click', function(e) {
        console.log("e.latLng: " + e.latLng);
        placeWayPoint(e.latLng, map); // WAYPOINTS
        placeMarker(e.latLng, map, e.lat, e.lon); // MARKERS WITH INFOBOXS
    });

    google.maps.event.addListener(map, "zoom_changed", function() {
        var newZoom = map.getZoom();
        if (newZoom > 7) {
            map.setZoom(7);
        }

    });
}

function placeMarker(position, map, title, body) {
    var marker = new google.maps.Marker({
        position: position,
        map: map,
        draggable: true
    });

    var t = title || "The Greatest Title";
    var b = body || "A somewhat great body";


    var boxText = "<div class='panel-heading'>"+ t + "</div>" +
                  "<div class='panel-body'>" + b + "</div>";
    // Store information in here from server posts/photos ^

    var myOptions = {
        content: boxText,
        disableAutoPan: false,
        maxWidth: 0,
        pixelOffset: new google.maps.Size(-100, 0),
        zIndex: null,
        boxStyle: {
            opacity: 1,
            width: "200px"
        },
        boxClass: "panel panel-warning",
        closeBoxMargin: "2px 2px 2px 2px",
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
    // map.panTo(position);
}

function wayPointCreator(position) {
    // Converted to object and then parsed as string
    // Original position has parenthesis
    var pos = new Object(position);
    pos = pos.k + "," + pos.A; // -49.938938,89.2748487
    return pos;
}

function wayPointPusher(position) {
    // Keeps waypoints stored in array
    waypoint_array.push({
        location: position
    });
}

function calcRoute() {
    var origin = waypoint_array[0].location;
    var destination_marker = waypoint_array[waypoint_array.length - 1].location;
    var middle_waypoints = waypoint_array;
        middle_waypoints.shift();
        middle_waypoints.pop();

    var request = {
        origin: origin,
        waypoints: middle_waypoints,
        destination: destination_marker,
        travelMode: google.maps.TravelMode.DRIVING
    };
    
    directionsService.route(request, function(response, status) {
        if (status == google.maps.DirectionsStatus.OK) {
            directionsDisplay.setDirections(response);
        }
    });
}


