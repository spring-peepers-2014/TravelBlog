require 'spec_helper'

describe User do
  it "is valid with all these first, last name, email, and password" do
    expect(build(:user)).to be_valid
  end

  it "is invalid without a first_name" do
    expect(build(:user, first_name: nil)).to_not be_valid
  end

  it "is invalid without a last_name" do
    expect(build(:user, last_name: nil)).to_not be_valid
  end

  it "is invalid without an email" do
    expect(build(:user, email: nil)).to_not be_valid
  end

  it "is invalid without a password" do
    expect(build(:user, password: nil)).to_not be_valid
  end

  it "is invalid with a password less than 6 characters" do
    expect(build(:user, password: "god")).to_not be_valid
  end

  it "does not accept duplicate emails" do
    original = User.create(first_name: "Shmitty",
                    last_name: "Werberjaegarmanjensen",
                    email: "hewasnumberone@gmail.com",
                    password: "lovesexsecretgod")

    duplicate = User.new(first_name: "Shmitty",
                    last_name: "Werberjaegarmanjsen",
                    email: "hewasnumberone@gmail.com",
                    password: "lovesexsecretgod")
    expect(duplicate).to_not be_valid
  end
end
