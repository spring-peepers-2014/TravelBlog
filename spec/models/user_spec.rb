require 'spec_helper'

describe User do
  it "is valid with all these first, last name, email, and password" do
    user = User.new(first_name: "Kenneth",
                    last_name: "Uy",
                    email: "missingno15@gmail.com",
                    password: "123456")
    expect(user.save).to equal(true)
  end

  it "is invalid without a first_name" do
    user = User.new(last_name: "Uy",
                    email: "missingno15@gmail.com",
                    password: "123456")
    expect{ user.save }.to raise_error
  end

  it "is invalid without a last_name" do
    user = User.new(first_name: "Kenneth",
                    email: "missingno15@gmail.com",
                    password: "123456")
    expect{ user.save }.to raise_error
  end

  it "is invalid without an email" do
    user = User.new(first_name: "Kenneth",
                    last_name: "Uy",
                    password: "123456")
    expect(user.save).to equal(false)
  end

  it "is invalid without a password" do
    user = User.new(first_name: "Kenneth",
                    last_name: "Uy",
                    email: "missingno15@gmail.com")
    expect{user.save}.to raise_error
  end

  it "does not accept duplicate emails" do
    original = User.create(first_name: "Kenneth",
                    last_name: "Uy",
                    email: "missingno15@gmail.com",
                    password: "123456")

    duplicate = User.new(first_name: "Kenneth",
                    last_name: "Uy",
                    email: "missingno15@gmail.com",
                    password: "123456")
    expect(duplicate.save).to equal(false)
  end
end
