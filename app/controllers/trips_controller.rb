class TripsController < ApplicationController

  def index
    @trips = Trip.all
    @trip = Trip.new
  end

  def new
    @trip = Trip.new
  end

  def create
    trip_title = params[:location]

    @trip = Trip.create(title: trip_title, user: User.first )

    @coords = Geocoder.coordinates(trip_title)

    @location_pin = LocationPin.create(location_name: trip_title, latitude: @coords[0], longitude: @coords[1], trip: @trip, map: current_user.map)

    render json: { location: @coords, trip_title: trip_title, trip_id: @trip.id }.to_json
  end

  def trip_params
    @trip.require(:trip).permit(:title, :user)
  end
end
