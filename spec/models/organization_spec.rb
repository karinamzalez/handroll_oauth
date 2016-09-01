require 'rails_helper'

RSpec.describe Organization, type: :model do
  it "returns all organizations" do
    VCR.use_cassette 'organization#all' do
      user = User.create(uid: 1, name: "Karina Munoz Gonzalez", screen_name: "karinamzalez", oauth_token: ENV["TOKEN"], image: "apple", email: "karinamzalez@gmail.com", github: "https://github.com/karinamzalez")
      organizations = Organization.all(user)

      expect(organizations.count).to eq(0)
    end
  end
end
