class UserPresenter
  attr_reader :user
  
  def initialize(user, template)
    @user  = user
    @template = template
  end

  def followers
    Follows.followers(user)
  end

  def following
    Follows.following(user)
  end

  def starred
    Repository.starred(user)
  end

  def repositories
    Repository.all_repositories(user)
  end

  def organizations
    Organization.all(user)
  end

  def commits
    Commits.all(user)
  end

  def friend_commits
    Commits.following(user)
  end
end
