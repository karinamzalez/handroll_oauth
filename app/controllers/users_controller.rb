class UsersController < ApplicationController
  def index
    @followers = Follows.followers(current_user)
    @following = Follows.following(current_user)
    @starred = Repository.starred(current_user)
    @repositories = Repository.all_repositories(current_user)
    @organizations = Organization.all(current_user)
    @commits = Commits.all(current_user)
    @friend_commits = Commits.following(current_user)
  end

  def show
  end
end
