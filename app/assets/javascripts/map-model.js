Map = {
    init: function(selector, options) {
        this.allPins = [];
        this.gMap = google.maps;
        this.mapDisplay = new google.maps.Map(selector, options);
    },
    _getPosition: function(lat, lon) {
        return new this.gMap.LatLng(parseFloat(lat), parseFloat(lon));
    },
    _addPin: function(position, name) {
        var _this = this;
        var newPin = new this.gMap.Marker({
            position: position,
            map: this.mapDisplay,
            draggable: false
        });
        newPin.name = name;
        this.allPins.push(newPin);
        return _this.newPin;
    },
    loadTripPins: function(tripid) {
        $.ajax({
            url: '/trips/' + tripid + '/locations',
            dataType: "JSON"
        })
            .done(function(pins) {
                for (var i = 0; i < pins.length; i++) {
                    var position = Map._getPosition(pins[i].coords[0], pins[i].coords[1]);
                    Map._addPin(position, pins[i].name);
                }
            });
    }
};