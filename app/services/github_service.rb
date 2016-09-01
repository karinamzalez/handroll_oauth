class GithubService
  attr_reader :user

  def initialize(user)
    @user = user
    @_conn = Faraday.new(:url => "https://api.github.com")
    @_conn.headers['Authorization'] = "token #{user.oauth_token}"
  end

  def followers
    parse(conn.get("/user/followers"))
  end

  def following
    parse(conn.get("/user/following"))
  end

  def starred
    parse(conn.get("/user/starred"))
  end

  def all_repositories
    parse(conn.get("/user/repos"))
  end

  def organizations
   parse(conn.get("/users/#{user.screen_name}/orgs"))
 end

  def commits
   parse(conn.get("/users/#{user.screen_name}/events"))
 end

 def following_commits
  friends = parse(conn.get("/user/following"))
  friends.map do |friend|
    parse(conn.get("/users/#{friend[:login]}/events"))
  end.flatten
end

private

  def conn
    @_conn
  end

  def parse(response)
    JSON.parse(response.body, symbolize_names: true)
  end
end
