require 'spec_helper'

describe LocationPin do
  it "is valid with a trip and location" do
    expect(build(:location_pin)).to be_valid
  end

  it "is invalid without a location association" do
    expect(build(:location_pin, location_id: nil)).to_not be_valid
  end

  it "is invalid without a trip assocation" do
    expect(build(:location_pin, trip_id: nil)).to_not be_valid
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
