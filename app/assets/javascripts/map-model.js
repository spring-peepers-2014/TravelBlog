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
  }

};
