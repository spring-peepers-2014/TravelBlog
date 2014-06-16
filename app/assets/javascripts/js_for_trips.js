$(document).ready(function() {

    $("#new-trip").on("click", function(e) {
        e.preventDefault();

        $("#trip-create").toggleClass("hidden");

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
                $("ul.list-group").append("<li class='list-group-item'><a href='/trips/" + resp.trip_id + "'>" + resp.trip_title + "</a></li>");
                $("#trip-create").hide();
            });
        });
    });
});
