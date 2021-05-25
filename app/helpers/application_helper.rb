module ApplicationHelper
  def link_to_year_search(options = {})
    date_range_field = options[:field].to_s[/(.*)_date_display/, 1]
    year = options[:value].to_s[/(\d\d\d\d)/, 1]
    year_field = "range[#{date_range_field}_year_iti]"

    link_to options[:value][0], blacklight_path(
      "#{year_field}[begin]" => year,
      "#{year_field}[end]" => year,
      :search_field => 'all_fields'
    )
  end

  def allow_html_value(options ={})
    options[:value][0].html_safe
  end

  def icon(icon, options = {})
    icon_path = File.join(Rails.root, "node_modules/bootstrap-icons/icons/#{icon}.svg")
    file = File.read(icon_path)
    doc = Nokogiri::HTML::DocumentFragment.parse file
    svg = doc.at_css 'svg'
    if options[:class].present?
      svg['class'] += " " + options[:class]
    end
    doc.to_html.html_safe
  end
end