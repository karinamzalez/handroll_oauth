require 'rails_helper'

describe GithubService do

  before(:each) do
    user = User.create(uid: 1, name: "Karina Munoz Gonzalez", screen_name: "karinamzalez", oauth_token: "bb2f73e8338f32b9067bc258eeddc44a50d43c79", image: "apple", email: "karinamzalez@gmail.com", github: "https://github.com/karinamzalez")
    @service = GithubService.new(user)
  end

  context "#followers" do
    it "returns a list of followers" do
      VCR.use_cassette("followers") do
        followers = @service.followers

        expect(followers.count).to eq(3)
      end
    end
  end

  context "#following" do
    it "returns list of following" do
      VCR.use_cassette("following") do
        following = @service.following

        expect(following.count).to eq(6)
      end
    end
  end

  context "#starred" do
    it "returns list of starred" do
      VCR.use_cassette("starred") do
        starred = @service.starred

        expect(starred.count).to eq(3)
      end
    end
  end

  context "#all_repositories" do
    it "returns list of all repositories" do
      VCR.use_cassette("repositories") do
        repositories = @service.all_repositories

        expect(repositories.count).to eq(30)
      end
    end
  end

  context "#organizations" do
    it "returns list of all organizations" do
      VCR.use_cassette("organizations") do
        organizations = @service.organizations

        expect(organizations.count).to eq(0)
      end
    end
  end

  context "#commits" do
    it "returns list of all commits" do
      VCR.use_cassette("commits") do
        commits = @service.commits

        expect(commits.count).to eq(30)
      end
    end
  end

  context "#following_commits" do
    it "returns list of all following_commits" do
      VCR.use_cassette("following_commits") do
        following_commits = @service.following_commits

        expect(following_commits.count).to eq(180)
      end
    end
  end

end
