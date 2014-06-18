$(document).ready(function() {

    $("#location-create").on("submit", function(e) {
        e.preventDefault();
        var trip_id = $('#map').data('trip-id');
        var data = {
            location: $("#location-create input[type='text']").val()
        };
        Trip.addLocation( trip_id, data )
    });

});
