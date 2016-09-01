class Commits < OpenStruct

  def self.service(user)
    @@service ||= GithubService.new(user)
  end

  def self.all(user)
    commits = service(user).commits
    commits.map { |commit| Commits.new(commit) }
  end

  def self.following(user)
    follows = service(user).following_commits
    follows.map { |commit| Commits.new(commit)}
  end
end
