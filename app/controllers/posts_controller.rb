class PostsController < ApplicationController
  def index
    @posts = Trip.find(params[:trip_id]).posts
  end

  def new
  end

  def create

  end

  def show
    @post = Post.find(params[:post_id])
  end

  def edit
  end

  def update
  end

  def destroy
  end
end