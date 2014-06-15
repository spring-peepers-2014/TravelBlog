$( document ).ready( function() {
  $('body').delegate('.list-group-item > a.marker_load', 'click', function(e) {
    e.preventDefault();

    var data = $(this).data("trip-id");

    $.ajax({
        url: '/trips/' + data + '/markers',
        type: "get",
        data: data,
        dataType: "json"
      }).done( function(resp) {
        console.log(resp);
        for (var i = 0; i < resp.marker.length; i++) {
          myLatlng = new google.maps.LatLng(resp.marker[i].coords.lat, resp.marker[i].coords.lon);
          title = resp.marker[i].posts.title;
          body = resp.marker[i].posts.body;
          console.log(title + body);
          placeMarker(myLatlng, theMap, title, body);
        } // Only works for one post per location pin
      });
  });
});


  // Click the link for a trip
  // Prevent the default action
  // Drop the correct pin and pan to that location
