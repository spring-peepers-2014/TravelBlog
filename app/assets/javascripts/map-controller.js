document.addEventListener('DOMContentLoaded', function(){
    var item_selector = document.getElementById("map-canvas");

    Map.init(item_selector, mapOptions);

   // var lp = new google.maps.LatLng(parseFloat(41.11246878918085),parseFloat(-76.728515625));
   var lp = Map.getPosition(41.11246878918085, -76.728515625)

    // google.maps.event.addListener(Map.gMap, 'click', function(e) {
        // Map.clickToPlaceMarker(e.latLng);
        Map.addPin(lp)
    // });
});

