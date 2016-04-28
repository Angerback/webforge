module ApplicationHelper
  def bootstrap_class_for flash_type
    if flash_type == "success"
      return "alert-success"
    end
    if flash_type == "error"
      return "alert-danger"
    end
    if flash_type == "alert"
      return "alert-warning"
    end
    if flash_type == "notice"
      return "alert-info"
    end

  end

  def flash_messages(opts = {})
    flash.each do |msg_type, message|
      concat(content_tag(:div, message, class: "alert #{bootstrap_class_for(msg_type)}",role: "alert", style: "border-radius: 0 !important;") do
              concat content_tag(:button, 'x', class: "close", data: { dismiss: 'alert' })
              concat message
            end)
    end
    nil
  end
end

def check_if_true(item)
  if(item == 'true' or item == true or item == 1 or item == '1')
    return true
  else
    return false
  end
end
