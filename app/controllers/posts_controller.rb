class PostsController < ApplicationController
  include PostHelper

  def index
    # What?  Why?  That feels like a #show action.  RESTfulness dictates that
    # we look through a collection on the index.  This route means to me:
    #
    # "Show me a list of posts" but to do so you need to know about a Trip.
    # Why?  Shouldn't you be doing @posts = Post.all?  
    @trip = Trip.find params[:trip_id]
    @locations = @trip.location_pins
  end

  def new
    # Why do i have to find a trip when I create a new Post.
    #
    # I'm thinking you should be using nested routes. In your logic it NEVER,
    # it appears, makes sense to discuss a POST without a Trip.  Is that right?
    @trip = Trip.find params[:trip_id]
    @post = Post.new
  end

  def create
    # Per above, the fact that you're writing these weird private methods
    # (which I'm glad you at least made weird and private) shows something is
    # wrong with the design.  Specifically, you should have nested these.
    trip = Trip.find params[:trip_id]
    location = Location.find_or_create_by location_params
    location_pin = trip.location_pins.find_or_create_by(location: location)

    @post = location_pin.posts.build post_params

    if @post.save
      redirect_to trip_posts_path
    else
      render :"posts/new"
    end
  end

  def show
    @post = Post.find params[:id]
    @trip = @post.trip
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
