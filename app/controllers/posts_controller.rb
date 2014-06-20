class PostsController < ApplicationController
  before_action :validate_user
  include PostHelper

  def index
    @trip = Trip.find params[:trip_id]
    @locations = @trip.location_pins
  end

  def new
    @trip = Trip.find params[:trip_id]
    @post = Post.new
  end

  def create
    trip = Trip.find params[:trip_id]
    location = Location.find_or_create_by location_params
    location_pin = trip.location_pins.find_or_create_by(location: location)

    @post = location_pin.posts.build post_params

    if @post.save
      redirect_to trip_path(trip.id)
    else
      render :"posts/new"
    end
  end

  def show
    @post = Post.find params[:id]
    @trip = @post.trip
    @location_pins = @post.trip.location_pins
  end

  def edit
    @post = Post.find params[:id]
  end

  def update
    @post = Post.find params[:id]
  end

  def destroy
    post = Post.find params[:id]
    post.destroy
    redirect_to trip_posts
  end

  private

  def post_params
    params.require(:post).permit(:title, :body)
  end

  def location_params
    location = params[:post][:location_pin]
    geolocation = Geocoder.search(location).first
    coords = geolocation.coordinates
    name = "#{geolocation.city}, #{geolocation.state_code}"

    params = { name: name, latitude: coords[0], longitude: coords[1] }
  end
end
