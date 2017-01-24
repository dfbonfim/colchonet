module ApplicationHelper

  def error_tag(model, attribute)
    if model.errors.has_key? attribute
      content_tag :div, model.errors[attribute].first,
                  :class => 'error_message'
    end
  end

  def check_form_errors(model)
    if model.errors.any?
      content_tag :div, "Há erros no formulário, por favor verifique.",
                  :id => 'error_explanation'
    end
  end
end
