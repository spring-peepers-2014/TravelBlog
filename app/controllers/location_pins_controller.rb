class LocationPinsController < ApplicationController
  before_action :validate_user

  def create
    trip = Trip.find params[:trip_id]
    location = Location.find_by location_params

    if location
      flash[:location_exists] = "The location #{location} already exists for this trip. Please click the location with this name on the sidebar."
    else
      location = Location.create location_params
    end

    location_pin = trip.location_pins.find_or_create_by(location: location)
    render json: { id: location_pin.id, name: location.name, coords: { lat: location.latitude, lon: location.longitude } }.to_json
  end

  def index
    all_pins = []
    @trip = Trip.find params[:trip_id]
    location_pins = @trip.location_pins

    location_pins.each do |pin|
      all_pins << { name: pin.location.name, coords: pin.coords }
    end

    if request.xhr?
      render json: all_pins.to_json
    else
      @location_pins = location_pins
      render "trips/show"
    end
  end

  def show
    location_pin = LocationPin.find params[:id]
    @location = location_pin.location
    @posts = location_pin.posts
    @trip = location_pin.trip
  end

  def destroy
    LocationPin.destroy params[:id]
  end

  private

  def location_params
    location_cache = params[:location]
    geolocation = Geocoder.search(location_cache).first

    return nil if geolocation.nil? || geolocation.city.nil?

    coords = geolocation.coordinates
    city_state_name = "#{geolocation.city}, #{geolocation.state_code}"
    # city_state_name = geolocation.state_code if city_state_name.split(',').first.empty?

    { name: city_state_name, latitude: coords[0], longitude: coords[1] }
  end
end
