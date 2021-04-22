module BlacklightConfiguration
  module BriefRecordView
    def self.configure(config)
      # solr fields to be displayed in the index (search results) view
      #   The ordering of the field names is the order of the display
      config.add_index_field 'other', label: 'Combined', accessor: 'tombstone'
      config.add_index_field SolrIndexer::Fields::BIRTH_DATE_DISPLAY, label: 'Date of Birth'
      config.add_index_field SolrIndexer::Fields::PLACE_OF_BIRTH, label: 'Place of Birth'
      config.add_index_field SolrIndexer::Fields::DEATH_DATE_DISPLAY, label: 'Date of Death'
      config.add_index_field SolrIndexer::Fields::PLACE_OF_DEATH, label: 'Place of Death'

    end
  end
end