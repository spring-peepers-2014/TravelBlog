require 'spec_helper'

describe Trip do
  it "is valid with a title and user" do
    user = User.create(first_name: "Kenneth",
                        last_name: "Uy",
                        email: "missingno15@gmail.com",
                        password: "123456")
    trip = Trip.new(title: "A Brand New Adventure",
                    user: user)
    expect(trip).to be_valid
    expect(trip.title).to eq "A Brand New Adventure"
    expect(trip.user.email).to eq "missingno15@gmail.com"
  end

  it "is invalid without a title" do
    user = User.create(first_name: "Kenneth",
                        last_name: "Uy",
                        email: "missingno15@gmail.com",
                        password: "123456")
    expect {Trip.create(user: user)}.to raise_error
  end

  it "is invalid without an associated user"
end
