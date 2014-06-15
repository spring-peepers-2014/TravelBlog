require 'spec_helper'

describe LocationPin do
  it "is valid with a location_name, latitude, longitude, and associations" do
    expect(build(:location_pin)).to be_valid
  end
  
  it "is invalid without a location_name" do
    expect(build(:location_pin, location_name: nil)).to_not be_valid
  end

  it "is invalid without a latitude coordinate" do
    expect(build(:location_pin, latitude: nil)).to_not be_valid
  end

  it "is invalid without a longitude coordinate" do
    expect(build(:location_pin, longitude: nil)).to_not be_valid
  end

  it "is invalid without a map association" do
    expect(build(:location_pin, map_id: nil)).to_not be_valid
  end

  it "is invalid without a trip assocation" do 
    expect(build(:location_pin, trip_id: nil)).to_not be_valid
  end

  it "destroys associated photos when destroyed" do
    location_pin = create(:location_pin)
    location_pin.photos.create(
      url:"https://lh3.googleusercontent.com/-13M6tjYnqls/U5TXLnJ4yfI/AAAAAAAFNgE/naSGoGGY1Gs/s0/09+-+1"
    )
    location_pin.destroy
   
    expect(Photo.any?).to equal(false)
  end

  it "destroys associated post when destroyed" do
    location_pin = create(:location_pin)
    post_associated_trip = create(:trip)
    location_pin.posts.create(
      title: "I went to Akihabara",
      body: "I visited the 'holy land'"
    )
    location_pin.destroy  
   
    expect(Post.any?).to equal(false)
  end
end
