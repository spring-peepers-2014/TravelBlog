Trip.Controller = {
    addLocation: function(tripid, location_name) {
        $.ajax({
            url: '/trips/' + tripid + '/locations',
            type: "POST",
            data: location_name,
            dataType: "JSON"
        })
            .done(function(location) {
                var pin_names = Map._nameMapPins();

                if ($.inArray(location.name, pin_names) < 0) {
                    Map._addPin(Map._getPosition(location.coords.lat, location.coords.lon), location.name);
                    var trip = new Trip.Presenter(location.name, location.id, "h3").presentLocation();
                    $('#trip-show-container').prepend(trip);
                }
            });
    },
    addTrip: function(trip_name) {
        $.ajax({
            url: '/trips',
            type: "post",
            data: trip_name,
            dataType: 'JSON'
        })
            .done(function(resp) {
                console.log(resp);
                if (resp.trip_id !== null) {
                    var trip = new Trip.Presenter(resp.trip_title, resp.trip_id).presentTrip();
                    $(".list-group").prepend(trip);
                }
            });
    },
};