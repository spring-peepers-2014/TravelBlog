require 'spec_helper'

describe Trip do
  it "is valid with a title and a user" do
    expect(build(:trip)).to be_valid
  end

  it "is invalid without a title" do
    expect(build(:trip, title: nil)).to_not be_valid
  end

  it "is invalid without an associated user" do
    expect(build(:trip, user_id: nil)).to_not be_valid
  end
end
