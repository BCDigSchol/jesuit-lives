module BlacklightConfiguration
  module NavActions
    def self.configure(config)
      #config.add_nav_action(:bookmark, partial: 'blacklight/nav/bookmark', if: :render_bookmarks_control?)
      config.add_nav_action(:search_history, partial: 'blacklight/nav/search_history')
    end
  end
end