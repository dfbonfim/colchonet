module ApplicationHelper

  def error_tag(model, attribute)
    if model.errors.has_key? attribute
      content_tag :div, model.errors[attribute].first,
                  :class => 'error_message'
    end
  end

  def check_form_errors(model)
    if model.errors.any?
      content_tag :div, t('general.form_error'),
                  :id => 'error_explanation'
    end
  end
end
