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
end