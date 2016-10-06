module ApplicationHelper

  def bootstrap_class_for flash_type
    { success: "success", error: "danger", alert: "warning", notice: "info" }[flash_type] || flash_type.to_s
  end

  def flash_messages(opts = {})
    flash.each do |msg_type, message|
      concat(content_tag(:div, message, class: "alert alert-#{bootstrap_class_for(msg_type.to_sym)} fade in") do 
              concat content_tag(:button, 'x', class: "close", data: { dismiss: 'alert' })
              concat message 
            end)
    end
    nil
  end
end
