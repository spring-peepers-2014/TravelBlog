Map = {
  init: function(selector, options) {
    this.gMap = google.maps
    this.mapDisplay = new google.maps.Map(selector, options)
  },
  getPosition: function(lat, lon) {
    return new this.gMap.LatLng(parseFloat(lat),parseFloat(lon));
},
  _createPin: function(position) {
    return new this.gMap.Marker({
      position: position,
      map: this.mapDisplay,
      draggable: false
    });
  },
  addPin: function(latlongobject) {
    var pin = this._createPin(latlongobject);
    console.log(pin);
  },
  getAjaxData: function(url, type, done_function) {
    var xhr = $.ajax({
      url: url,
      type: type,
      dataType: "json"
    })
    return xhr;
  },
  loadTripPins: function(tripid){
    var url = '/trips/' + tripid + '/markers';
    var type = "get";
    (this.getAjaxData(url, type)).done( function(resp) {
      for (var i = 0; i < resp.lpins.length; i++) {
        Map.addPin(Map.getPosition(resp.lpins[i].coords.lat, resp.lpins[i].coords.lon))
      }
    });
  },
};
