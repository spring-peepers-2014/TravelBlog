$( document ).ready( function() {

  $("#side a:first").on("click", function(e) {
    e.preventDefault();

    var title_html = "<form action='/trips' method='post' id='tt'>Title: <input type='text' id='titletext'><input type='submit' value='Submit'></form>";

    $("#side a:first").css('visibility', 'hidden');

    $("#sidebar-new-trip").html(title_html);

    $("#tt").on("submit", function(e) {
      e.preventDefault();

      var data = {location: $("input:text").val()};

      $.ajax({
        url: '/trips',
        type: "post",
        data: data,
        dataType: "json"
      }).done( function(resp) {
        console.log("resp.trip_id: " + resp.trip_id);
          $("ul.list-group").append("<li class='list-group-item'><a href='/trips/" + resp.trip_id + "'>" + resp.trip_title + "</a></li>");
          $("#sidebar-new-trip").empty();
          $("#side a:first").css('visibility', 'visible');

          myLatlng = new google.maps.LatLng(parseFloat(resp.location[0]),parseFloat(resp.location[1]));
          placeMarker(myLatlng, theMap);
        });
    });
  });
});



















