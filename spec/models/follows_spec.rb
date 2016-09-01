require 'rails_helper'

RSpec.describe Follows, type: :model do
  it "returns followers" do
    VCR.use_cassette 'follows#followers' do
      user = User.create(uid: 1, name: "Karina Munoz Gonzalez", screen_name: "karinamzalez", oauth_token: ENV["TOKEN"], image: "apple", email: "karinamzalez@gmail.com", github: "https://github.com/karinamzalez")
      followers = Follows.followers(user)
      follower = followers.last

      expect(followers.count).to eq(5)
      expect(follower.login).to eq("marcellawigg")
    end
  end

  it "returns following" do
    VCR.use_cassette 'follows#following' do
      user = User.create(uid: 1, name: "Karina Munoz Gonzalez", screen_name: "karinamzalez", oauth_token: ENV["TOKEN"], image: "apple", email: "karinamzalez@gmail.com", github: "https://github.com/karinamzalez")
      following = Follows.following(user)
      follow = following.last

      expect(following.count).to eq(13)
      expect(follow.login).to eq("AnnaCW")
    end
  end
end
