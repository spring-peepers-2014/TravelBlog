class TripsController < ApplicationController

  def index
    @trips = Trip.all
    @trip = Trip.new
  end

  def new
    @trip = Trip.new
  end

  def create
    location = params[:location]

    @trip = Trip.create(title: location, user: User.first )

    @coords = Geocoder.coordinates(location)

    @location_pin = LocationPin.create(location_name: location, latitude: @coords[0], longitude: @coords[1], trip: @trip, map: Map.last)

    render json: { location: @coords, trip_title: location, trip_id: @trip.id }.to_json
  end

  def show
    puts "PARAMS: #{params}"
    @location_pin = LocationPin.find(params[:id])
    lat = @location_pin.latitude
    lon = @location_pin.longitude
    render json: { lat: lat , lon: lon }.to_json
  end

  def trip_params
    @trip.require(:trip).permit(:title, :user)
  end
end
