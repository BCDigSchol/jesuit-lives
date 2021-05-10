module ApplicationHelper
  def link_to_year_search(options={})
    date_range_field = options[:field].to_s[/(.*)_display/, 1]
    year = options[:value].to_s[/(\d\d\d\d)/, 1]
    begin_key = "range[#{date_range_field}_iti][begin]"
    end_key = "range[#{date_range_field}_iti][end]"

    link_to options[:value][0], blacklight_path(begin_key => year, end_key => year)
  end
end