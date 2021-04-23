module BlacklightConfiguration
  module BriefRecordView
    def self.configure(config)
      # solr fields to be displayed in the index (search results) view
      #   The ordering of the field names is the order of the display
      config.add_index_field 'other', label: '', accessor: 'tombstone', separator_options: { words_connector: '; ' }
    end
  end
end