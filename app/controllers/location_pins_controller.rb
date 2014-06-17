class LocationPinsController < ApplicationController
  before_action :validate_user

  def create
    trip = Trip.find params[:trip_id]
    location = Location.find_or_create_by location_params
    location_pin = trip.location_pins.find_or_create_by(location: location)

    render json: { trip: { id: location.id, name: location.name, lat: location.latitude, lon: location.longitude }}.to_json
  end

  def index
    @trip = Trip.find params[:trip_id]
    @pins = @trip.location_pins.map do |pin|
      { name: pin.name, coords: pin.coords }
    end
    if request.xhr?
      render json: @pins.to_json
    else
      render "trips/show"
    end
  end

  def show
    location_pin = LocationPin.find params[:id]
    @location = location_pin.location
    @posts = location_pin.posts
    @photos = location_pin.photos
    @trip = location_pin.trip
  end

  def destroy
    LocationPin.destroy params[:id]
  end

  private

  def location_params
    location_cache = params[:location]
    geolocation = Geocoder.search(location_cache).first
    coords = geolocation.coordinates
    name = "#{geolocation.city}, #{geolocation.state_code}"

    params = { name: name, latitude: coords[0], longitude: coords[1] }
  end
end
