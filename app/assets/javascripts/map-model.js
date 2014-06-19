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

        var ibOptions = this.infoBoxOptions(name);
        var ib = new InfoBox(ibOptions);

        newPin.infoBox = ib;
        ib.open(this.mapDisplay, newPin);

        google.maps.event.addListener(newPin, 'click', function() {
           if (newPin.infoBox.getVisible() === false){
            newPin.infoBox.setVisible(1);
           } else {
            newPin.infoBox.setVisible(0);
           }
        });

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
                    var position = Map._getPosition(tripPins[i].coords[0], tripPins[i].coords[1]);
                    Map._addPin(position, tripPins[i].name);
                }
            });
    },
    infoBoxOptions: function(location_name, post_object){
    var location = location_name || "Area 51";
    var boxText = "<div class='panel-heading'>"+ location + "</div>";

    var options = {
        content: boxText,
        disableAutoPan: true,
        maxWidth: 0,
        pixelOffset: new this.gMap.Size(-100, 0),
        zIndex: null,
        boxStyle: {
          background: "#fffff",
          width: "200px",
         },
        boxClass: 'panel panel-primary',
        closeBoxMargin: "10px 2px 2px 2px",
        closeBoxURL: "",
        infoBoxClearance: new this.gMap.Size(1, 1),
        isHidden: true,
        pane: "floatPane",
        enableEventPropagation: false,
    };
    return options;
  }
};