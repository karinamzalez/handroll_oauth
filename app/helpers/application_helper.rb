module ApplicationHelper

  def present(object, klass=nil)
    klass ||= "#{object.class}Presenter".constantize
    presenter = klass.new(object, self)
    yield presenter if block_given?
    presenter
  end

  def info_header(info_type)
    case info_type
    when @repositories
      heading = "All Repositories"
    when @organizations
      heading = "Organizations"
    when @commits
      heading = "Commits"
    when @friend_commits
      heading = "Friend's Commits"
    end
  end

  def info_list_item(inf)
    if  inf.class.to_s == "Repository"
      list_item = link_to inf.name, inf.html_url
    elsif inf.class.to_s == "Commits"
      if inf.payload[:commits]
        "Commit sha key: #{inf.payload[:commits].first[:sha]}"
      else
        "Commit id: #{inf.id}"
      end
    else
      inf.name
    end
  end

end
