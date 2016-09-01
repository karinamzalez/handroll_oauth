require 'rails_helper'

RSpec.describe Repository, type: :model do
  it "returns starred repositories" do
    VCR.use_cassette 'repository#starred' do
      user = User.create(uid: 1, name: "Karina Munoz Gonzalez", screen_name: "karinamzalez", oauth_token: "bb2f73e8338f32b9067bc258eeddc44a50d43c79", image: "apple", email: "karinamzalez@gmail.com", github: "https://github.com/karinamzalez")
      repositories = Repository.starred(user)
      repository = repositories.last

      expect(repositories.count).to eq(3)
    end
  end

  it "returns all repositories" do
    VCR.use_cassette 'repositories' do
      user = User.create(uid: 1, name: "Karina Munoz Gonzalez", screen_name: "karinamzalez", oauth_token: "1b39a4941118469ed2d2967264037f8859864c24", image: "apple", email: "karinamzalez@gmail.com", github: "https://github.com/karinamzalez")
      repositories = Repository.all_repositories(user)
      repository = repositories.last

      expect(repositories.count).to eq(30)
      expect(repository.name).to eq("brin_posse")
    end
  end
end
