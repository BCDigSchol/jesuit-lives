module BlacklightConfiguration
  module Faceting
    def self.configure(config)
      # solr fields that will be treated as facets by the blacklight application
      #   The ordering of the field names is the order of the display
      #
      # Setting a limit will trigger Blacklight's 'more' facet values link.
      # * If left unset, then all facet values returned by solr will be displayed.
      # * If set to an integer, then "f.somefield.facet.limit" will be added to
      # solr request, with actual solr request being +1 your configured limit --
      # you configure the number of items you actually want _displayed_ in a page.
      # * If set to 'true', then no additional parameters will be sent to solr,
      # but any 'sniffed' request limit parameters will be used for paging, with
      # paging at requested limit -1. Can sniff from facet.limit or
      # f.specific_field.facet.limit solr request params. This 'true' config
      # can be used if you set limits in :default_solr_params, or as defaults
      # on the solr side in the request handler itself. Request handler defaults
      # sniffing requires solr requests to be made with "echoParams=all", for
      # app code to actually have it echo'd back to see it.
      #
      # :show may be set to false if you don't want the facet to be drawn in the
      # facet bar
      #
      # set :index_range to true if you want the facet pagination view to have facet prefix-based navigation
      #  (useful when user clicks "more" on a large facet and wants to navigate alphabetically across a large set of results)
      # :index_range can be an array or range of prefixes that will be used to create the navigation (note: It is case sensitive when searching values)

      config.add_facet_field SolrIndexer::Fields::PLACE_OF_BIRTH_FACET, label: 'Place of Birth', limit: 20, index_range: 'A'..'Z'
      config.add_facet_field SolrIndexer::Fields::ENTRANCE_PROVINCE_FACET, label: 'Entrance Province', limit: 20, index_range: 'A'..'Z'
      config.add_facet_field SolrIndexer::Fields::PLACE_OF_DEATH_FACET, label: 'Place of Death', limit: 20, index_range: 'A'..'Z'

      config.add_facet_field SolrIndexer::Fields::TITLE_FACET, label: 'Title', limit: 20, index_range: 'A'..'Z'
      config.add_facet_field SolrIndexer::Fields::STATUS_FACET, label: 'Status', limit: 20, index_range: 'A'..'Z'

      config.add_facet_field SolrIndexer::Fields::BIRTH_DATE_YEAR, label: 'Year of Birth', range: true
      config.add_facet_field SolrIndexer::Fields::DEATH_DATE_YEAR, label: 'Year of Death', range: true
      config.add_facet_field SolrIndexer::Fields::VOW_DATE_YEAR, label: 'Year of Vow Taken', range: true
      config.add_facet_field SolrIndexer::Fields::ENTRANCE_DATE_YEAR, label: 'Year of Entrance', range: true


      # Have BL send all facet field names to Solr, which has been the default
      # previously. Simply remove these lines if you'd rather use Solr request
      # handler defaults, or have no facets.
      config.add_facet_fields_to_solr_request!
    end
  end
end