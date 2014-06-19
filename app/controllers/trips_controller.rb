class TripsController < ApplicationController
  before_action :validate_user

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
    @trip = Trip.find(params[:id])
    @location_pins = @trip.location_pins
  end

  private

  def trip_params
    @trip.require(:trip).permit(:title)
  end


end
