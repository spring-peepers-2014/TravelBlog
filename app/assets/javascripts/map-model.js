Map = {
  init: function(selector, options) {
    this.allPins = [];
    this.gMap = google.maps
    this.mapDisplay = new google.maps.Map(selector, options)
  },
  getPosition: function(lat, lon) {
    return new this.gMap.LatLng(parseFloat(lat),parseFloat(lon));
},
  _createPin: function(position, name) {
    var newPin = new this.gMap.Marker({
      position: position,
      map: this.mapDisplay,
      draggable: false
    });
    newPin.name = name;

    var ibOptions = this.infoBoxOptions();
    var ib = new InfoBox(ibOptions);

    newPin.infoBox = ib;
    ib.open(this.mapDisplay, newPin);

    google.maps.event.addListener(newPin, 'mouseover', function() {
       newPin.infoBox.setVisible(1);
    });

    google.maps.event.addListener(newPin, 'mouseout', function() {
       newPin.infoBox.setVisible(0);
    });

    this.allPins.push(newPin);
    return newPin;
  },
  addPin: function(latlongobject, name) {
    var pin = this._createPin(latlongobject, name);
  },
  getAjaxData: function(url, type, data) {
    var xhr = $.ajax({
      url: url,
      type: type,
      data: data,
      dataType: "json"
    })
    return xhr;
  },
  loadTripPins: function(tripid){
    var url = '/trips/' + tripid + '/markers';
    var type = "get";
    (this.getAjaxData(url, type)).done( function(resp) {
      for (var i = 0; i < resp.lpins.length; i++) {
        Map.addPin( Map.getPosition(resp.lpins[i].coords[0], resp.lpins[i].coords[1]), resp.lpins[i].name );
      }
    });
  },
  _nameMapPins: function(){
    var pin_names =[];
    for (var i = 0; i < Map.allPins.length; i++) {
      pin_names.push(Map.allPins[i].name);
    }
    return pin_names;
  },
  infoBoxOptions: function(title, body){
    var boxTitle = title || "Title";
    var boxBody = body || "Body";

    var boxText = "<div class='panel-heading'>"+ boxTitle + "</div>" +
                  "<div class='panel-body'>" + boxBody + "</div>";

    var options = {
        content: boxText,
        disableAutoPan: false,
        maxWidth: 0,
        pixelOffset: new this.gMap.Size(-100, 0),
        zIndex: null,
        boxStyle: {
          background: "#fffff",
          opacity: 0.9,
          width: "200px",
         },
        boxClass: 'panel panel-warning',
        closeBoxMargin: "10px 2px 2px 2px",
        closeBoxURL: "http://www.google.com/intl/en_us/mapfiles/close.gif",
        infoBoxClearance: new this.gMap.Size(1, 1),
        isHidden: true,
        pane: "floatPane",
        enableEventPropagation: false,
    };
    return options;
  }

};
