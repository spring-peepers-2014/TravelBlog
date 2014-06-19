document.addEventListener('DOMContentLoaded', function(){
  var item_selector = document.getElementById("map-canvas");
  Map.init(item_selector, mapOptions);

  var marker = new google.maps.Marker({
      map: Map.gMap
    });


  google.maps.event.addListener(marker, "click", function() {
    console.log("hello");
  });
});
