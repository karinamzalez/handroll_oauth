require 'rails_helper'

RSpec.describe Follows, type: :model do
  it "returns followers" do
    VCR.use_cassette 'follows#followers' do
      user = User.create(uid: 1, name: "Karina Munoz Gonzalez", screen_name: "karinamzalez", oauth_token: "bb2f73e8338f32b9067bc258eeddc44a50d43c79", image: "apple", email: "karinamzalez@gmail.com", github: "https://github.com/karinamzalez")
      followers = Follows.followers(user)
      follower = followers.last

      expect(followers.count).to eq(3)
      expect(follower.login).to eq("rod-lin")
    end
  end

  it "returns following" do
    VCR.use_cassette 'follows#following' do
      user = User.create(uid: 1, name: "Karina Munoz Gonzalez", screen_name: "karinamzalez", oauth_token: "1b39a4941118469ed2d2967264037f8859864c24", image: "apple", email: "karinamzalez@gmail.com", github: "https://github.com/karinamzalez")
      following = Follows.following(user)
      follow = following.last

      expect(following.count).to eq(6)
      expect(follow.login).to eq("AnnaCW")
    end
  end
end
