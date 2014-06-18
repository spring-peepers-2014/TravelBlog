require 'spec_helper'

describe PostsController, type: :controller do 
  before :each do
    @trip = create(:trip)
    user = create(:user)
    request.session[:user_id] = user.id
  end

  describe "#index" do
    it "renders the :index template" do
      get :index, trip_id: @trip
      expect(response).to render_template :index
    end
  end

  describe "#new" do
    it "assigns a new Post to @post" do
      get :new, trip_id: @trip
      expect(assigns(:post)).to be_a_new(Post)
    end

    it "renders the :new template" do
      get :new, trip_id: @trip
      expect(response).to render_template :new
    end
  end

  describe "#show" do
    it "assigns requested post to @post" do
      post = create(:post)
      get :show, id: post
      expect(assigns(:post)).to eq post
    end

    it "renders :show template" do
      post = create(:post)
      location_pin = create(:location_pin)
      location_pin.posts << post
      get :show, id: post
      expect(response).to render_template :show
    end
  end
end
