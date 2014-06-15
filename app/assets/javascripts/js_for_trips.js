$( document ).ready( function() {

  $("#side a:first").on("click", function(e) {
    e.preventDefault();

    var title_html = "<form action='/trips' method='post' id='tt'>Title: <input type='text' id='titletext'><input type='submit' value='Submit'></form>"

    $("#side a:first").css('visibility', 'hidden');

    $('.list-group').before("<div id='sidebar-new-trip'></div>");

    $("#sidebar-new-trip").html(title_html);

    $("#tt").on("submit", function(e) {
      e.preventDefault();

      var data = {location: $("input:text").val()};
// This does correctly append the link of the trip, but not
// immediately. I.e., you must refresh before it has the
// correct href....not sure why
      $.ajax({
        url: '/trips',
        type: "post",
        data: data,
        dataType: "json"
      }).done( function(resp) {
        console.log("resp.trip_id: " + resp.trip_id);
          $("li:last").after("<li class='list-group-item'><a href='/trips/'" + resp.trip_id + "'>" + resp.trip_title + "</a></li>");
          $("#sidebar-new-trip").empty();
          $("#side a:first").css('visibility', 'visible');

          myLatlng = new google.maps.LatLng(parseFloat(resp.location[0]),parseFloat(resp.location[1]));
          placeMarker(myLatlng, theMap);
        });
    });
  });
});



















