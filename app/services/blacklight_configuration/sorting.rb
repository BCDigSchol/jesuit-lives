module BlacklightConfiguration
  module Sorting
    def self.configure(config)

      # "sort results by" select (pulldown)
      # label in pulldown is followed by the name of the Solr field to sort by and
      # whether the sort is ascending or descending (it must be asc or desc
      # except in the relevancy case). Add the sort: option to configure a
      # custom Blacklight url parameter value separate from the Solr sort fields.
      config.add_sort_field 'relevance', sort: 'score desc, pub_date_si desc, title_si asc', label: 'relevance'
      config.add_sort_field 'name', sort: "#{SolrIndexer::Fields::LAST_NAME} asc, #{SolrIndexer::Fields::FIRST_NAME} asc", label: 'name'
      config.add_sort_field 'birth', sort: "#{SolrIndexer::Fields::BIRTH_DATE_YEAR} asc", label: 'year of birth'
    end
  end
end