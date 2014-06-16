// jQuery Soup.
$(document).ready(function() {

    $("#new-trip").on("click", function(e) {
        e.preventDefault();

        $("#trip-create").toggleClass("hidden");

        // Wait so yo bind on this thing only after a click on #new-trip?  Huh?
        $("#trip-create").on("submit", function(e) {
            e.preventDefault();

            var data = {
                location: $("input[type='text']").val()
            };

            $.ajax({
                url: '/trips',
                type: "post",
                data: data,
                dataType: "json"
            }).done(function(resp) {
              // And then in the success call you append a bunch of noisy crap.
              // Not impressed.
                $("ul.list-group").append("<li class='list-group-item'><a href='/trips/" + resp.trip_id + "'>" + resp.trip_title + "</a></li>");
                $("#trip-create").hide();
            });
        });
    });
});
