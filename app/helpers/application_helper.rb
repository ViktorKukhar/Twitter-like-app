module ApplicationHelper
  def flash_classes(type)
    case type
    when 'notice'
      'notice'
    when 'alert'
      'alert'
    else
      'tweet-error'
    end
  end

  def page(current_page)
    case current_page
    when root_path
      content_tag(:h2, 'For you')
    when new_user_session_path
      content_tag(:h2, 'Log in')
    when new_user_registration_path
      content_tag(:h2, 'Sign up')
    when tweet_path(:id)
      content_tag(:h2, 'Tweet')
    when users_profile_path
      safe_join([
                  content_tag(:h3, "#{@user.username}"),
                  content_tag(:p, "#{@user.tweets.count} tweets")
                ])
    else
      content_tag(:h2, 'Twitter')
    end
  end
end
