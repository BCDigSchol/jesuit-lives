module BlacklightConfiguration
  module FullRecordView
    def self.configure(config)

      # solr fields to be displayed in the show (single result) view
      #   The ordering of the field names is the order of the display
      config.add_show_field SolrIndexer::Fields::JESUIT_LIVES_ID, label: 'ID'
      config.add_show_field SolrIndexer::Fields::TITLE, label: 'Title', link_to_facet: :title_facet
      config.add_show_field SolrIndexer::Fields::STATUS, label: 'Status', link_to_facet: :status_facet

      config.add_show_field SolrIndexer::Fields::BIRTH_DATE_DISPLAY, label: 'Date of Birth'
      config.add_show_field SolrIndexer::Fields::ADD_BIRTH_DATE_INFO, label: 'Additional information about date of birth'
      config.add_show_field SolrIndexer::Fields::ALT_BIRTH_DATE_DISPLAY, label: 'Alternate date of birth'
      config.add_show_field SolrIndexer::Fields::PLACE_OF_BIRTH, label: 'Place of Birth', link_to_facet: :place_of_birth_facet

      config.add_show_field SolrIndexer::Fields::ENTRANCE_DATE_DISPLAY, label: 'Date of Entry'
      config.add_show_field SolrIndexer::Fields::ENTRANCE_DATE_2_DISPLAY, label: 'Second date of entry'
      config.add_show_field SolrIndexer::Fields::ALT_ENTRANCE_DATE_I1, label: 'Alternate date of entry'
      config.add_show_field SolrIndexer::Fields::ALT_ENTRANCE_DATE_I2, label: 'Alternate date of entry'

      config.add_show_field SolrIndexer::Fields::ENTRANCE_PROVINCE, label: 'Place of Entry', link_to_facet: :entrance_province_facet

      config.add_show_field SolrIndexer::Fields::DEATH_DATE_DISPLAY, label: 'Date of Death'
      config.add_show_field SolrIndexer::Fields::ALT_DEATH_DATE_DISPLAY, label: 'Alternate date of death'
      config.add_show_field SolrIndexer::Fields::ADD_DEATH_DATE_INFO, label: 'Additional information about date of death'
      config.add_show_field SolrIndexer::Fields::PLACE_OF_DEATH, label: 'Place of Death', link_to_facet: :place_of_death_facet

    end
  end
end