require 'spec_helper'

describe Trip do
  it "is valid with a title and user" do
    user = User.create(first_name: "Kenneth",
                        last_name: "Uy",
                        email: "missingno15@gmail.com",
                        password: "123456")
    trip = Trip.new(title: "A Brand New Adventure",
                    user: user)
<<<<<<< HEAD
    expect(trip).to be_valid
    expect(trip.title).to eq "A Brand New Adventure"
    expect(trip.user.email).to eq "missingno15@gmail.com"
=======

    expect(trip.save).to equal(true)
>>>>>>> 661a3522d8ceda0f1e88289de8e825939a9e27f0
  end

  it "is invalid without a title" do
    user = User.create(first_name: "Kenneth",
                        last_name: "Uy",
                        email: "missingno15@gmail.com",
                        password: "123456")
<<<<<<< HEAD
    expect {Trip.create(user: user)}.to raise_error
  end

  it "is invalid without an associated user"
=======
    trip = Trip.new(user: user)
    expect(trip.save).to equal(false)
  end

  it "is invalid without an associated user" do
    trip = Trip.new(title: "My Summer Vacation")
    expect(trip.save).to equal(false)
  end
>>>>>>> 661a3522d8ceda0f1e88289de8e825939a9e27f0
end
