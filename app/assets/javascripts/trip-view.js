Trip = {
  addLocation: function(tripid, data){
    var url ='/trips/'+ tripid +'/locations';
    var type = "post";
    (Map.getAjaxData(url, type, data)).done( function(resp) {
      Map.addPin(Map.getPosition(resp.trip.lat, resp.trip.lon));
      Trip.appendToTripList(resp.trip.id, resp.trip.name);
    });
  },
  appendToTripList: function(tripid, name){
  $("#trip-show-container").append("<div class='list-group'><div class='list-group-item'><h3 class='location-names list-group-item-heading'><a href='/locations/"+tripid+"'>"+name+"</a></h3></div></div>");
  },
};



