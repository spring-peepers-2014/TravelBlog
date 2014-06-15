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
    coords = []

    locations = Trip.find(params[:id]).location_pins

    locations.each do |location|
      coords << { lat: location.latitude, lon: location.longitude }
    end
    render json: { coords: coords }.to_json
  end

  def trip_params
    @trip.require(:trip).permit(:title, :user)
  end
end
