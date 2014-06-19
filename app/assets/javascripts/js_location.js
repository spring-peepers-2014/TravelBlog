$(document).ready(function() {
  PasswordValidator.listenTo($("#user_password"), $("input[value='Create Account']"));

  $("#location-create").on("submit", function(e) {
      e.preventDefault();
      var trip_id = $('#map').data('trip-id');
      var location_name = {
          location: $("#location-create input[type='text']").val()
      };
      Trip.Controller.addLocation( trip_id, location_name );
      this.reset();
  });

  $("#trip-create").on("submit", function(e) {
      e.preventDefault();
      var trip_name = {
          location: $("#trip-create input[type='text']").val()
      };
      Trip.Controller.addTrip( trip_name );
      this.reset();
  });
});
