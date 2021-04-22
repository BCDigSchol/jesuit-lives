module BlacklightConfiguration
  module Sorting
    def self.configure(config)

      # "sort results by" select (pulldown)
      # label in pulldown is followed by the name of the Solr field to sort by and
      # whether the sort is ascending or descending (it must be asc or desc
      # except in the relevancy case). Add the sort: option to configure a
      # custom Blacklight url parameter value separate from the Solr sort fields.
      config.add_sort_field 'relevance', sort: 'score desc, pub_date_si desc, title_si asc', label: 'relevance'
      config.add_sort_field 'year-desc', sort: 'pub_date_si desc, title_si asc', label: 'year'
      config.add_sort_field 'author', sort: 'author_si asc, title_si asc', label: 'author'
      config.add_sort_field 'title_si asc, pub_date_si desc', label: 'title'
    end
  end
end