module BlacklightConfiguration
  module ResultsTools
    def self.configure(config)
      #config.add_results_document_tool(:bookmark, partial: 'bookmark_control', if: :render_bookmarks_control?)

      config.add_results_collection_tool(:sort_widget)
      config.add_results_collection_tool(:per_page_widget)
      config.add_results_collection_tool(:view_type_group)
    end
  end
end