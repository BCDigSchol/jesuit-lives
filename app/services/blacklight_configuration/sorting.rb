module BlacklightConfiguration
  module Sorting
    def self.configure(config)

      # "sort results by" select (pulldown)
      # label in pulldown is followed by the name of the Solr field to sort by and
      # whether the sort is ascending or descending (it must be asc or desc
      # except in the relevancy case). Add the sort: option to configure a
      # custom Blacklight url parameter value separate from the Solr sort fields.
      config.add_sort_field 'relevance', sort: 'score desc, pub_date_si desc, title_si asc', label: 'Relevance'
      config.add_sort_field 'name', sort: "#{SolrIndexer::Fields::LAST_NAME} asc, #{SolrIndexer::Fields::FIRST_NAME} asc", label: 'Name'
      config.add_sort_field 'birth_asc', sort: "#{SolrIndexer::Fields::BIRTH_DATE_YEAR} asc", label: 'Year of birth (ascending)'
      config.add_sort_field 'birth_desc', sort: "#{SolrIndexer::Fields::BIRTH_DATE_YEAR} desc", label: 'Year of birth (descending)'
    end
  end
end