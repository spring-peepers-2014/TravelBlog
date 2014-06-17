function LocationPin(name, coords) {
    this.name = name;
    this.coords = coords;
}

LocationPin.getByTrip = function(id) {
    $.ajax({
        url: '/trips/' + id + '/locations'
    })
        .done(function(trips) {
            return trips;
        })
        .fail(console.log("Failed"));
};