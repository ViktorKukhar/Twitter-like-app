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
end
