require 'spec_helper'

describe Trip do
  it "is valid with a title and user" do
    user = User.create(first_name: "Kenneth",
                        last_name: "Uy",
                        email: "missingno15@gmail.com",
                        password: "123456")
    trip = Trip.new(title: "A Brand New Adventure",
                    user: user)
    expect(trip.save).to equal(true)
  end

  it "is invalid without a title" do
    user = User.create(first_name: "Kenneth",
                        last_name: "Uy",
                        email: "missingno15@gmail.com",
                        password: "123456")
    trip = Trip.new(user: user)
    expect(trip.save).to equal(false)
  end

  it "is invalid without an associated user" do
    trip = Trip.new(title: "My Summer Vacation")
    expect(trip.save).to equal(false)
  end
end
