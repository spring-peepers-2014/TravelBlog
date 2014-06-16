class TripsController < ApplicationController

  def index
    @trips = Trip.all
    @trip = Trip.new
  end

  def new
    @trip = Trip.new
  end

  def create
    # 1. Inline this temp, not needed
    location = params[:location]

    @trip = current_user.trips.create(title: location)

    # Weird, you just updated a Trip to have a title, why 
    # don't you ask **it** for the title versus this temp variable?  Seems
    # weird.  Trust your database.

    render json: { trip_title: location, trip_id: @trip.id }.to_json
  end

  def show
    @coords = []

    @trip = Trip.find(params[:id])
    @locationpins = @trip.location_pins

  end

  def show_markers
    marker = []
    locationpins = Trip.find(params[:id]).location_pins

    locationpins.each do |locationpin|
      locationpin.posts.each do |post|
        marker << { coords: locationpin.coords, posts: {title: post.title, body: post.body} }
      end

    end
    render json: { marker: marker }.to_json
  end

  private

  def trip_params
    @trip.require(:trip).permit(:title)
  end


end
