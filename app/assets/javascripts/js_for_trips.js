console.log("JS FOR TRIPS!");

  // google.maps.event.addListener(map, 'click', function(e) {
  //   placeWayPoint(e.latLng, map);
  // });

function initialize() {
  console.log("INIT in JS FOR Trips")
  $("#side").on("ajax:success", function(e, data, status, xhr) {
    e.preventDefault();

    $("#side").append("SUCCESS!");

    console.log("SUCCESS!");
    console.log("data: " + data);
  });
}


google.maps.event.addDomListener(window, 'load', initialize);



















