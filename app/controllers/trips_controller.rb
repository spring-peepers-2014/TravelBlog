
class TripsController < ApplicationController

  def index
  end

  def new
    @trip = Trip.new
  end

  def create

    # if (Map.all).nil?
    #   @map = Map.create(name: "USA")
    # end

    @trip = Trip.create(title: params[:trip][:title])
    @coords =  Geocoder.coordinates(params[:trip][:title])
    @location_pin = LocationPin.create(location_name: params[:trip][:title], latitude: @coords[0], longitude: @coords[1])

  end
end
