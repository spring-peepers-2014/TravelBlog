class TripsController < ApplicationController
  include ApplicationHelper

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

    @location_pin = LocationPin.create(location_name: location, latitude: @coords[0], longitude: @coords[1], trip: @trip, map_id: 1)

    render json: { location: @coords, trip_title: location, trip_id: @trip.id }.to_json
  end

  def show
    @coords = []

    @trip = Trip.find(params[:id])
    @locations = @trip.location_pins

    @locations.each do |location|
      @coords << { lat: location.latitude, lon: location.longitude }
    end
  end

  def show_markers
    marker = []
    locations = Trip.find(params[:id]).location_pins

    locations.each_with_index do |location, i|
      marker << { coords: { lat: location.latitude, lon: location.longitude }}

      location.posts.each do |post|
        marker[i][:posts] = { title: post.title, body: post.body }
      end 

    end
    render json: { marker: marker }.to_json
  end
  
  private 
  
  def trip_params
    @trip.require(:trip).permit(:title, :user)
  end


end
