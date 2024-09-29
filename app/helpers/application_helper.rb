module ApplicationHelper
  def flash_classes(type)
    case type
    when 'notice'
      'notice'
    when 'alert'
      'alert'
    end
  end
end
