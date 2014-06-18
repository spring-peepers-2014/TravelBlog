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
      a_tag = document.createElement(this.secondNodeType);
      list_group = document.createElement(this.thirdNodeType);
      list_group_item = document.createElement(this.thirdNodeType);

    list_group.className = "list-group";
    list_group_item.className = "list-group-item";
    h3_tag.className = "location-names list-group-item-heading";

    a_tag.setAttribute('href', '/locations/' + this.trip_id);
    a_tag.textContent = this.trip_name;

    list_group.appendChild(list_group_item);
    list_group_item.appendChild(h3_tag);
    h3_tag.appendChild(a_tag);

    return list_group;
  }
};