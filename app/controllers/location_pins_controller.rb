class LocationPinsController < ApplicationController
  before_action :validate_user

  def create
    trip = Trip.find params[:trip_id]
    @location_search_term = params[:location]

    return nil if location_params.nil?

    location = Location.find_or_create_by(location_params)
    location_pin = trip.location_pins.find_or_create_by(location: location)

    render json: { id: location_pin.id, name: location.name, coords: { lat: location.latitude, lon: location.longitude } }.to_json
  end

  def index
    all_pins = []
    @trip = Trip.find params[:trip_id]
    location_pins = @trip.location_pins

    location_pins.each do |pin|
      posts = []
      pin.posts.each do |post|
        posts << { post_id: post.id, post_title: post.title }
      end
      all_pins <<  { location_name: pin.location.name, coords: pin.coords, posts: posts }
    end
    p all_pins
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
    geolocation = Geocoder.search(@location_search_term).first
    return nil if geolocation.nil? || geolocation.city.nil?
    coords = geolocation.coordinates
    full_location_name = geolocation.formatted_address.split(', ')
    city_state_name = "#{full_location_name[0]}, #{geolocation.state_code}"

    { name: city_state_name, latitude: coords[0], longitude: coords[1] }
  end
end
