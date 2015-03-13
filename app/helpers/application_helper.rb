module ApplicationHelper
  def page_class
    "#{params[:controller]} action_#{params[:action]}"
  end

  def site_categories
    Rails.cache.fetch('site.categories') do
      Category.all
    end
  end

  def render_nav_icon(title, icon, options={})
    options = { title: title }.merge(options)
    text = fa_icon(icon, text: content_tag(:span, title))
    link_to(text, 'javascript:;', options)
  end
end
