module ApplicationHelper
  def page_class
    "#{params[:controller]} action_#{params[:action]}"
  end
end
