class LocationPinsController < ApplicationController
  before_action :validate_user

  def create
    trip = Trip.find params[:trip_id]
    location = Location.find_or_create_by location_params
    location_pin = trip.location_pins.find_or_create_by(location: location)

    if LocationPin.exists? location_pin
      redirect_to trip_posts_path
    else
      render :"posts/new"
    end
  end

  def index
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
    location = params[:location]
    geolocation = Geocoder.search(location).first
    coords = geolocation.coordinates
    name = "#{geolocation.city}, #{geolocation.state_code}"

    params = { name: name, latitude: coords[0], longitude: coords[1] }
  end
end
