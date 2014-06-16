// I did teach you how to separate concerns, right?
$(document).ready(function() {

    $("#add-location").on("click", function(e) {
        e.preventDefault();
        var trip_id = $('#auto_load_pins').data('trip-id');

        $("#location-create").toggleClass("hidden");

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
                $("#trip-show-container").append("<div class='list-group'><div class='list-group-item'><h3 class='location-names list-group-item-heading'><a href='/locations/"+resp.trip.local.id+"'>"+resp.trip.name+"</a></h3></div></div>");
                $("#location-create").hide();
            });
        });
    });
});

