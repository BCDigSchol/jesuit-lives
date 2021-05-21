module BlacklightConfiguration
  module FullRecordView
    def self.configure(config)

      # solr fields to be displayed in the show (single result) view
      #   The ordering of the field names is the order of the display
      config.add_show_field SolrIndexer::Fields::JESUIT_LIVES_ID, label: 'ID'

      config.add_show_field SolrIndexer::Fields::ALT_LAST_NAME, label: 'Alternate last name'
      config.add_show_field SolrIndexer::Fields::ALT_FIRST_NAME, label: 'Alternate first name'
      config.add_show_field SolrIndexer::Fields::ADD_LAST_NAME_INFO, label: 'Additional information about last name'
      config.add_show_field SolrIndexer::Fields::ADD_FIRST_NAME_INFO, label: 'Additional information about first name'

      config.add_show_field SolrIndexer::Fields::TITLE, label: 'Title', link_to_facet: :title_facet

      config.add_show_field SolrIndexer::Fields::STATUS, label: 'Status at death', link_to_facet: :status_facet
      config.add_show_field SolrIndexer::Fields::ADD_STATUS_INFO, label: 'Additional information about status'

      config.add_show_field SolrIndexer::Fields::BIRTH_DATE_DISPLAY, label: 'Date of birth', helper_method: 'link_to_year_search'
      config.add_show_field SolrIndexer::Fields::ADD_BIRTH_DATE_INFO, label: 'Additional information about date of birth'
      config.add_show_field SolrIndexer::Fields::ALT_BIRTH_DATE_DISPLAY, label: 'Alternate date of birth'

      config.add_show_field SolrIndexer::Fields::PLACE_OF_BIRTH, label: 'Place of birth', link_to_facet: :place_of_birth_facet
      config.add_show_field SolrIndexer::Fields::ALT_PLACE_OF_BIRTH, label: 'Alternate place of birth', link_to_facet: :place_of_birth_facet
      config.add_show_field SolrIndexer::Fields::ADD_PLACE_OF_BIRTH_INFO, label: 'Additional information about place of birth'

      config.add_show_field SolrIndexer::Fields::ENTRANCE_DATE_DISPLAY, label: 'Date of entry', helper_method: 'link_to_year_search'
      config.add_show_field SolrIndexer::Fields::ENTRANCE_DATE_2_DISPLAY, label: 'Second date of entry'
      config.add_show_field SolrIndexer::Fields::ALT_ENTRANCE_DATE_I1_DISPLAY, label: 'Alternate date of entry'
      config.add_show_field SolrIndexer::Fields::ADD_ENTRANCE_DATE_I1_INFO, label: 'Additional information about alternate date of entry'
      config.add_show_field SolrIndexer::Fields::ALT_ENTRANCE_DATE_I2_DISPLAY, label: 'Alternate date of entry'
      config.add_show_field SolrIndexer::Fields::ADD_ENTRANCE_DATE_I2_INFO, label: 'Additional information about alternate date of entry'

      config.add_show_field SolrIndexer::Fields::ENTRANCE_PROVINCE, label: 'Entrance province', link_to_facet: :entrance_province_facet
      config.add_show_field SolrIndexer::Fields::ADD_ENTRANCE_PLACE_INFO_I1, label: 'Additional information about place of entry'
      config.add_show_field SolrIndexer::Fields::ENTRANCE_PROVINCE_2, label: 'Second place of entry', link_to_facet: :entrance_province_facet
      config.add_show_field SolrIndexer::Fields::ADD_ENTRANCE_PLACE_INFO_I2, label: 'Additional information about place of entry'

      config.add_show_field SolrIndexer::Fields::ORDINATION_DATE_DISPLAY, label: 'Date of ordination', helper_method: 'link_to_year_search'

      config.add_show_field SolrIndexer::Fields::VOW_DATE_DISPLAY, label: 'Date of final vow', helper_method: 'link_to_year_search'
      config.add_show_field SolrIndexer::Fields::ALT_VOW_DATE_DISPLAY, label: 'Alternate date of final vow'
      config.add_show_field SolrIndexer::Fields::ADD_VOW_DATE_INFO, label: 'Additional information about date of final vow'

      config.add_show_field SolrIndexer::Fields::DEATH_DATE_DISPLAY, label: 'Date of death', helper_method: 'link_to_year_search'
      config.add_show_field SolrIndexer::Fields::ALT_DEATH_DATE_DISPLAY, label: 'Alternate date of death'
      config.add_show_field SolrIndexer::Fields::ADD_DEATH_DATE_INFO, label: 'Additional information about date of death'

      config.add_show_field SolrIndexer::Fields::PLACE_OF_DEATH, label: 'Place of death', link_to_facet: :place_of_death_facet
      config.add_show_field SolrIndexer::Fields::ALT_PLACE_OF_DEATH, label: 'Alternate place of death', link_to_facet: :place_of_death_facet
      config.add_show_field SolrIndexer::Fields::ADD_PLACE_OF_DEATH_INFO, label: 'Additional information about place of death'

      config.add_show_field SolrIndexer::Fields::PORTAL_URL, label: 'The portal URL is'
      config.add_show_field SolrIndexer::Fields::GEORGETOWN_URL, label: 'The Georgetown URL is'
      config.add_show_field SolrIndexer::Fields::WEB_RESOURCES, label: 'Other stuff'

    end
  end
end