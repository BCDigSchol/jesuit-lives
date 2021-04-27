module BlacklightConfiguration
  module IndexViews
    def self.configure(config)
      # solr field configuration for search results/index views
      config.index.title_field = SolrIndexer::Fields::FULL_NAME
      config.index.document_component = JesuitLives::DocumentComponent
      #config.index.display_type_field = 'format'
      #config.index.thumbnail_field = 'thumbnail_path_ss'
    end
  end
end