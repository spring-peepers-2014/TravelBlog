Trip.Presenter = function(trip_name, trip_id, root, second, third){
  this.trip_name = trip_name;
  this.trip_id = trip_id;
  this.rootNodeType = root || "li";
  this.secondNodeType = second || "a";
  this.thirdNodeType = third || "div";
};

Trip.Presenter.prototype = {
  presentTrip: function() {
    var rootNode = document.createElement(this.rootNodeType),
        secondNode = document.createElement(this.secondNodeType);

      rootNode.className = "list-group-item";

      secondNode.setAttribute('href', '/trips/' + this.trip_id);
      secondNode.textContent = this.trip_name;

      rootNode.appendChild(secondNode);

      return rootNode;
  },
  presentLocation: function() {
  var h3_tag = document.createElement(this.rootNodeType),
      a_tag = document.createElement(this.secondNodeType),
      panel_default = document.createElement(this.thirdNodeType),
      panel_heading = document.createElement(this.thirdNodeType),
      new_form = document.createElement("form"),
      input_submit = document.createElement("input");

    panel_default.className = "panel panel-default panel-relative";
    panel_heading.className = "panel-heading";
    h3_tag.className = "h3-location";
    new_form.className = "label label-info add-post-label";
    input_submit.setAttribute('type','submit');
    input_submit.value = '+';

    a_tag.setAttribute('href', '/locations/' + this.trip_id);
    a_tag.textContent = this.trip_name;

    panel_default.appendChild(panel_heading);
    panel_heading.appendChild(h3_tag);
    h3_tag.appendChild(a_tag);
    panel_default.appendChild(new_form);
    new_form.appendChild(input_submit);

    return panel_default;
  }
};
