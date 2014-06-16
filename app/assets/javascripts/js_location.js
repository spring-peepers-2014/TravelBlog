$(document).ready(function() {

    $("#add-location").on("click", function(e) {
        e.preventDefault();
        var trip_id = $('#auto_load_pins').data('trip-id');
        var form =  "<br><form class='input-group' action='/trips/"+ trip_id +"/locations' method='post' id='location-create'>" +
                          "<input type='text' class='form-control' placeholder='San Francisco, CA'>" +
                          "<span class='input-group-btn'>" +
                          "<input type='submit' class='btn btn-default' value='Go'></span>" +
                          "</form><br>";

        $("#add-location-btn").css('visibility', 'hidden');

        $("#sidebar-new-trip").html(form);

        $("#location-create").on("submit", function(e) {
            e.preventDefault();

            var data = {
                location: $("input[type='text']").val()
            };

            $.ajax({
                url: '/trips/'+ trip_id +'/locations',
                type: "post",
                data: data,
                dataType: "json"
            }).done(function(resp) {
                console.log(resp);
                $("#trip-show-container").append("<div class='list-group'><div class='list-group-item'><h3 class='location-names list-group-item-heading'><a href='/locations/"+resp.trip.local.id+"'>"+resp.trip.name+"</a></h3></div></div>");
                $("#sidebar-new-trip").empty();
                $("#add-location-btn").css('visibility', 'visible');
            });
        });
    });
});

