module ApplicationHelper
  def alert_level(level)
    case level
    when 'notice' then 'info'
    when 'alert'  then 'warning'
    when 'error'  then 'danger'
    else level
    end
  end

  def body_class
    "page_#{params[:controller].gsub('/', '_')} action_#{params[:action]}"
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
