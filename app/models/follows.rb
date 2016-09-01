class Follows < OpenStruct

  def self.service(user)
    @@service ||= GithubService.new(user)
  end

  def self.followers(user)
    followers = service(user).followers
    followers.map { |user| Follows.new(user) }
  end

  def self.following(user)
    following = service(user).following
    following.map { |user| Follows.new(user) }
  end

end
