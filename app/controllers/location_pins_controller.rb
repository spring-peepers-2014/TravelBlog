class LocationPinsController < ApplicationController
  # include LocationsHelper

  def create
      trip = Trip.find(params[:trip_id])
      geolocation = Geocoder.search(params[:location]).first
      coords = geolocation.coordinates
      name = "#{geolocation.city}, #{geolocation.state_code}"

      location = Location.find_or_create_by(name: name, latitude: coords[0], longitude: coords[1])
      trip.location_pins.find_or_create_by(location: location)

      redirect_to trip_locations_path
    end

    def index
    end

# /locations/:id
    def show
      @location = Location.find(params[:id])
      @posts = @location.location_pins[0].posts
      @trip_title = @location.location_pins[0].trip.title
    end

    def destroy
      LocationPin.destroy(params[:id])
    end

  end

 # trip_locations GET    /trips/:trip_id/locations(.:format) location_pins#index
 #               POST   /trips/:trip_id/locations(.:format) location_pins#create
 #      location GET    /locations/:id(.:format)            location_pins#show
 #               DELETE /locations/:id(.:format)            location_pins#destroy
