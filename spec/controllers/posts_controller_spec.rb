require 'spec_helper'

describe PostsController, type: :controller do 
  describe "#show" do
    it "assigns requested post to @post" do
      post = create(:post)
      get :show, id: post
      expect(assigns(:post)).to eq post
    end

    it "assigns associated trip from @post through a location pin " do
      post = create(:post)
      get :show, id: post
      expect(assigns(:trip)).to eq post.location_pin.trip
    end

    it "renders the post :show template" do
      post = create(:post)
      get :show, id: post 
      expect(response).to render_template :show
    end
  end
end
