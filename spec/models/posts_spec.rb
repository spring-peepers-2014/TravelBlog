require 'spec_helper'

describe Post do
  it "has a valid factory" do
    expect(build(:post)).to be_valid
  end
  it "is invalid without a location" do
    expect(build(:post, location_pin_id: nil)).to raise_errors
  end
  it "is invalid without a title" do
    expect(build(:post, title: nil)).to raise_errors
  end
  it "is invalid without a body" do
    expect(build(:post, body: nil)).to raise_errors
  end
end