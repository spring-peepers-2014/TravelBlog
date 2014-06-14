require 'spec_helper'

describe PostsController do
  describe 'GET #index' do
    it "populates an array of posts associated with @trip" do
    end
    it "renders the :posts/index template" do
      get :index, :trip_id => 1
    end
  end

  trips/:trip_id/posts

  describe 'GET #show' do
    it "assigns the requested post to @post" do
      post = create(:post)
      get :show, id: post
      expect(assigns(:post)).to eq post
    end
    it "renders the :posts/show template" do
      post = create(:post)
      get :show, id: contact
      expect(response).to render_template :"posts/show"
    end
  end

  describe 'GET #new' do
    it "assigns a new Post to @post" do
    end
    it "renders the :posts/new template" do
    end
  end

  describe 'GET #edit' do
    it "assigns the requested post to @post" do
    end
    it "renders the :posts/edit template" do
    end
  end

  describe 'POST #create' do
    context "with valid attributes" do
    end

    context "with invalid attributes" do
    end
  end

  describe 'PUT #update' do
    context "with valid attributes" do
    end

    context "with invalid attributes" do
    end
  end

  describe 'DELETE #destroy' do
    it "deletes the post from the database" do
    end
    it "redirects to the posts#index" do
    end
  end
end