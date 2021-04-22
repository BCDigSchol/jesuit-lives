module BlacklightConfiguration
  module ShowViews
    def self.configure(config)
      # solr field configuration for document/show views
      config.show.title_field = SolrIndexer::Fields::FULL_NAME
      config.show.heading = SolrIndexer::Fields::FULL_NAME

      #config.show.display_type_field = 'format'
      #config.show.thumbnail_field = 'thumbnail_path_ss'
    end
  end
end