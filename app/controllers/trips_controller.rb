class TripsController < ApplicationController

  def index
    @trips = session[:user_id] ? Trip.all.where(user_id: session[:user_id]).order(created_at: :asc) : []
    @trip = Trip.new
  end

  def new
    @trip = Trip.new
  end

  def create
    location = params[:location]

    @trip = current_user.trips.create(title: location)

    render json: { trip_title: location, trip_id: @trip.id }.to_json
  end

  def show
    @coords = []

    @trip = Trip.find(params[:id])
    @locationpins = @trip.location_pins

  end

  def show_markers
    lpins = []
    locationpins = Trip.find(params[:id]).location_pins

    locationpins.each do |locationpin|
        lpins << { name: locationpin.location.name, coords: locationpin.coords, posts: {title: "title", body: "body"} }
    end
    render json: { lpins: lpins }.to_json
  end

  private

  def trip_params
    @trip.require(:trip).permit(:title)
  end


end
