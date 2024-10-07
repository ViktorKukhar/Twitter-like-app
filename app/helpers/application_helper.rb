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
      content_tag(:p, 'For you')
    when new_user_session_path
      content_tag(:p, 'Log in')
    when new_user_registration_path
      content_tag(:p, 'Sign up')
    when tweet_path
      content_tag(:p, 'Tweet')
    else
      content_tag(:p, 'Twitter')
    end
  end
end
