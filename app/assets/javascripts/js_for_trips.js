$( document ).ready( function() {

  $("#new-trip").on("click", function(e) {
    e.preventDefault();

    var title_html = "<br><form class='input-group' action='/trips' method='post' id='tt'>" +
                        "<input type='text' class='form-control' id='titletext'>" +
                        "<span class='input-group-btn'>" +
                        "<input type='submit' class='btn btn-default' value='Go'></span>" +
                      "</form><br>";

    $("#new-trip").css('visibility', 'hidden');

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
          $("#new-trip").css('visibility', 'visible');
        });
    });
  });
});



















