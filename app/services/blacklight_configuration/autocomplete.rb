module BlacklightConfiguration
  module Autocomplete
    def self.configure(config)
      # Configuration for autocomplete suggester
      config.autocomplete_enabled = true
      config.autocomplete_path = 'suggest'
      # if the name of the solr.SuggestComponent provided in your solrconfig.xml is not the
      # default 'mySuggester', uncomment and provide it below
      # config.autocomplete_suggester = 'mySuggester'
    end
  end
end