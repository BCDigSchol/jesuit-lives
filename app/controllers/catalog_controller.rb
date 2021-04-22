# frozen_string_literal: true
class CatalogController < ApplicationController

  include Blacklight::Catalog
  include BlacklightRangeLimit::ControllerOverride

  configure_blacklight do |config|

    # Configure index views
    BlacklightConfiguration::IndexViews::configure(config)

    # Add result tools (e.g. sorting widget, results per page widget)
    BlacklightConfiguration::ResultsTools::configure(config)

    # Configure navigation actions (e.g. bookmarking, search history)
    BlacklightConfiguration::NavActions::configure(config)

    # Configure document/show views
    BlacklightConfiguration::ShowViews::configure(config)

    # Define faceting.
    BlacklightConfiguration::Faceting::configure(config)

    # Define brief result view.
    BlacklightConfiguration::BriefRecordView::configure(config)

    # Define fields to show in full record
    BlacklightConfiguration::FullRecordView::configure(config)

    # Add tools in full record view.
    BlacklightConfiguration::ShowTools::configure(config)

    # Add search fields.
    BlacklightConfiguration::SearchFields::configure(config)

    # Configure sorting
    BlacklightConfiguration::Sorting::configure(config)

    # Configure autocomplete
    BlacklightConfiguration::Autocomplete::configure(config)

    ## General Configuration ##

    ## Default parameters to send to solr for all search-like requests. See also SearchBuilder#processed_parameters
    config.default_solr_params = {
      rows: 10
    }

    # If there are more than this many search results, no spelling ("did you
    # mean") suggestion is offered.
    config.spell_max = 5

    ## Class for sending and receiving requests from a search index
    # config.repository_class = Blacklight::Solr::Repository
    #
    ## Class for converting Blacklight's url parameters to into request parameters for the search index
    # config.search_builder_class = ::SearchBuilder
    #
    ## Model that maps search index responses to the blacklight response model
    # config.response_model = Blacklight::Solr::Response
    #
    ## Should the raw solr document endpoint (e.g. /catalog/:id/raw) be enabled
    # config.raw_endpoint.enabled = false

    # solr path which will be added to solr base url before the other solr params.
    #config.solr_path = 'select'
    #config.document_solr_path = 'get'

    # items to show per page, each number in the array represent another option to choose from.
    #config.per_page = [10,20,50,100]

  end
end
