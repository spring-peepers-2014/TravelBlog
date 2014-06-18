require 'spec_helper'

describe TripsController, type: :controller do
	before :each do 
		user = create(:user)
		request.session[:user_id] = user.id
	end

	describe "GET #index" do
		it "renders the index template" do
			get :index
			expect(response).to render_template("index")
		end
	end

  describe "GET #show" do
	  it "assigns the requested trip to @trip" do
	  	trip = create(:trip)
	  	get :show, id: trip
	  	expect(assigns(:trip)).to eq(trip)
	  end

    it "renders the :show template" do
      trip = create(:trip)
      get :show, id: trip
      expect(response).to render_template :show
    end
	end

  describe "GET #new" do
    it "assigns a new Trip to @trip" do
      get :new
      expect(assigns(:trip)).to be_a_new(Trip)
    end

    it "renders the :new template" do
      get :new
      expect(response).to render_template :new
    end
  end
end
