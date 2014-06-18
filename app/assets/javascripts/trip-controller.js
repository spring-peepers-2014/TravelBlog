Trip.Controller = {
  addLocation: function(tripid, location_name){
    $.ajax({
      url: '/trips/'+ tripid +'/locations',
      type: "POST",
      data: location_name,
      dataType: "JSON"
    })
    .done( function(location) {
      Map.addPin(Map.getPosition(location.coords.lat, location.coords.lon));
      var trip = new Trip.Presenter(location.name, location.id, "h3").presentLocation();
      var $prependLocation = this._findTheTripInsertionNode(location.name, trip);
    }.bind(this));
  },

  _findTheTripInsertionNode: function(soughtName, newNode) {
    var reduce = Array.prototype.reduce,
      nameCollection = [],
      existingNames = $(".location-names"),
      nameLookupTable = reduce.call(existingNames, function(prevValue, currValue){
        var name = $(currValue).find("a").text();
        prevValue[name] = $(currValue);
        nameCollection.push(name);
        return prevValue;
      }, {});

    if ( $.inArray(soughtName, nameCollection) < 1 ) {
      // TODO:  fix jQuery magic...
      $(".location-names:first").parents(".trip-show-container").append(newNode)
    } else {
      // TODO:  fix jQuery magic...
      $(nameLookupTable[soughtName]).append(newNode);
    }
  },

  addTrip: function(trip_name){
    $.ajax({
      url: '/trips',
      type: "post",
      data: trip_name,
      dataType: 'JSON'
    })
    .done( function(resp) {
      var trip = new Trip.Presenter(resp.trip_title, resp.trip_id).presentTrip();
      $(".list-group").prepend(trip);
    });
  },
};
