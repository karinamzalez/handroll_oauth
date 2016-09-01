class Repository < OpenStruct

  def self.service(user)
    @@service ||= GithubService.new(user)
  end

  def self.starred(user)
    starred = service(user).starred
    starred.map { |repository| Repository.new(repository) }
  end

  def self.all_repositories(user)
    all = service(user).all_repositories
    all.map { |repository| Repository.new(repository) }
  end

end
