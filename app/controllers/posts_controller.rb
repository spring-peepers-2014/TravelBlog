class PostsController < ApplicationController

  # get '/trips/:trip_id/posts(.:format)' => posts#index
  def index
    @posts = Trip.find(params[:trip_id]).posts
  end

  # get '/trips/:trip_id/posts/new(.:format)' => posts#new
  def new
    @trip = Trip.find params[:trip_id]
    @post = Post.new
  end

  # post '/trips/:trip_id/posts(.:format)' => posts#create
  def create
    @trip = Trip.find params[:trip_id]
    @post = Post.new params[:post]
    if @post.save
      redirect_to trip_posts
    else
      render :"posts/new"
  end

  # get '/posts/:id(.:format)' => posts#show
  def show
    @post = Post.find params[:post_id]
  end

  # get '/posts/:id/edit(.:format)' => posts#edit
  def edit
    @post = Post.find params[:id]
  end

  # put '/posts/:id(.:format)'  => posts#update
  def update
  end

  # delete '/posts/:id(.:format)' => posts#destroy
  def destroy
    post = Post.find params[:id]
    post.destroy
    redirect_to trip_posts
  end
end

# trip_posts
# get '/trips/:trip_id/posts(.:format)' => posts#index

# no_path_name
# post '/trips/:trip_id/posts(.:format)' => posts#create

# new_trip_post
# get '/trips/:trip_id/posts/new(.:format)' => posts#new

# edit_post
# get '/posts/:id/edit(.:format)' => posts#edit

# post
# get '/posts/:id(.:format)' => posts#show

# no_path_name
# put '/posts/:id(.:format)'  => posts#update

# no_path_name
# delete '/posts/:id(.:format)' => posts#destroy