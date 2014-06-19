function LocationPin(name, coords) {
    this.name = name;
    this.coords = coords;
}

LocationPin.getByTrip = function(tripId) {
    $.ajax({
        url: '/trips/' + tripid + '/locations',
        dataType: "JSON"
    }).done(function(pins) {
        allPins = [];
        pins.forEach(pin, allPins.push(new LocationPin(pin.name, pin.coords)));
        return allPins;
    }).fail(function() {
        console.log("Failed");
    });
};