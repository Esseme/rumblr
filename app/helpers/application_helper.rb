module ApplicationHelper
  def field_with_errors(object, field)
    if object.errors[field].any?
      error_messages = object.errors.full_messages_for(field).join(", ")
      content_tag :div, error_messages, class: "form_error"
    end
  end
end
