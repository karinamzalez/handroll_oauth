require 'rails_helper'

RSpec.describe Commits, type: :model do
  it "returns all commits" do
    VCR.use_cassette 'commits#commits' do
      user = User.create(uid: 1, name: "Karina Munoz Gonzalez", screen_name: "karinamzalez", oauth_token: "bb2f73e8338f32b9067bc258eeddc44a50d43c79", image: "apple", email: "karinamzalez@gmail.com", github: "https://github.com/karinamzalez")
      commits = Commits.all(user)
      commit = commits.first

      expect(commits.count).to eq(30)
    end
  end

  it "returns all following commits" do
    VCR.use_cassette 'commits#following' do
      user = User.create(uid: 1, name: "Karina Munoz Gonzalez", screen_name: "karinamzalez", oauth_token: "1b39a4941118469ed2d2967264037f8859864c24", image: "apple", email: "karinamzalez@gmail.com", github: "https://github.com/karinamzalez")
      following_commits = Commits.following(user)
      following_commit = following_commits.first

      expect(following_commits.count).to eq(180)
    end
  end
end
