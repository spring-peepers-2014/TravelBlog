
class TripsController < ApplicationController

  def index
    @trips = Trip.all
  end

  def new
    @trip = Trip.new
  end

  def create
    @trip = Trip.create(title: params[:trip][:title], user_id: 1)
    @coords =  Geocoder.coordinates(params[:trip][:title])
    @location_pin = LocationPin.create(location_name: params[:trip][:title], latitude: @coords[0], longitude: @coords[1], trip_id: 1, map_id: 1)
    redirect_to root_path
  end
end
