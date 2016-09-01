class Organization < OpenStruct

  def self.service(user)
    @@service ||= GithubService.new(user)
  end

  def self.all(user)
    organizations = service(user).organizations
    organizations.map { |org| Organization.new(org) }
  end
end
