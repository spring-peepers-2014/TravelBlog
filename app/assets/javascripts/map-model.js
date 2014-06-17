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
};
