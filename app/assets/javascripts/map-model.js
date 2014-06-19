Map = {
    init: function(selector, options) {
        this.allPins = [];
        this.gMap = google.maps;
        this.mapDisplay = new google.maps.Map(selector, options);
    },
    _getPosition: function(lat, lon) {
        return new this.gMap.LatLng(parseFloat(lat), parseFloat(lon));
    },
    _nameMapPins: function() {
        var pin_names = [];
        for (var i = 0; i < Map.allPins.length; i++) {
            pin_names.push(Map.allPins[i].name);
        }
        return pin_names;
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
                var tripPins = pins;
                for (var i = 0; i < tripPins.length; i++) {
                    var position = Map._getPosition(tripPins[i].coords.lat, tripPins[i].coords.lon);
                    Map._addPin(position, tripPins[i].name);
                    //
                }
            });
    }
};