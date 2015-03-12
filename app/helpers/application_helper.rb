module ApplicationHelper
  def page_class
    "#{params[:controller]} action_#{params[:action]}"
  end

  def site_categories
    Rails.cache.fetch('site.categories') do
      Category.all
    end
  end
end
