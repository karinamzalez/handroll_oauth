require 'rails_helper'

RSpec.describe Repository, type: :model do
  it "returns starred repositories" do
    VCR.use_cassette 'repository#starred' do
      user = User.create(uid: 1, name: "Karina Munoz Gonzalez", screen_name: "karinamzalez", oauth_token: ENV["TOKEN"], image: "apple", email: "karinamzalez@gmail.com", github: "https://github.com/karinamzalez")
      repositories = Repository.starred(user)
      repository = repositories.last

      expect(repositories.count).to eq(2)
    end
  end

  it "returns all repositories" do
    VCR.use_cassette 'repositories' do
      user = User.create(uid: 1, name: "Karina Munoz Gonzalez", screen_name: "karinamzalez", oauth_token: ENV["TOKEN"], image: "apple", email: "karinamzalez@gmail.com", github: "https://github.com/karinamzalez")
      repositories = Repository.all_repositories(user)
      repository = repositories.last

      expect(repositories.count).to eq(30)
      expect(repository.name).to eq("web-guesser")
    end
  end
end
