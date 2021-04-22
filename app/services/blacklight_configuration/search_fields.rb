module BlacklightConfiguration
  module SearchFields
    def self.configure(config)
      # "fielded" search configuration. Used by pulldown among other places.
      # For supported keys in hash, see rdoc for Blacklight::SearchFields
      #
      # Search fields will inherit the :qt solr request handler from
      # config[:default_solr_parameters], OR can specify a different one
      # with a :qt key/value. Below examples inherit, except for subject
      # that specifies the same :qt as default for our own internal
      # testing purposes.
      #
      # The :key is what will be used to identify this BL search field internally,
      # as well as in URLs -- so changing it after deployment may break bookmarked
      # urls.  A display label will be automatically calculated from the :key,
      # or can be specified manually to be different.

      # This one uses all the defaults set by the solr request handler. Which
      # solr request handler? The one set in config[:default_solr_parameters][:qt],
      # since we aren't specifying it otherwise.

      config.add_search_field 'all_fields', label: 'All Fields'

      # Now we see how to over-ride Solr request handler defaults, in this
      # case for a BL "search field", which is really a dismax aggregate
      # of Solr search fields.

      config.add_search_field('name') do |field|
        # solr_parameters hash are sent to Solr as ordinary url query params.
        field.solr_parameters = {
          #'spellcheck.dictionary': 'name',
          qf: '${name_qf}',
          pf: '${name_pf}'
        }
      end

      config.add_search_field('place') do |field|
        # solr_parameters hash are sent to Solr as ordinary url query params.
        field.solr_parameters = {
          #'spellcheck.dictionary': 'place',
          qf: '${place_qf}',
          pf: '${place_pf}'
        }
      end

=begin
    config.add_search_field('title') do |field|
      # solr_parameters hash are sent to Solr as ordinary url query params.
      field.solr_parameters = {
        'spellcheck.dictionary': 'title',
        qf: '${title_qf}',
        pf: '${title_pf}'
      }
    end

    config.add_search_field('author') do |field|
      field.solr_parameters = {
        'spellcheck.dictionary': 'author',
        qf: '${author_qf}',
        pf: '${author_pf}'
      }
    end

    # Specifying a :qt only to show it's possible, and so our internal automated
    # tests can test it. In this case it's the same as
    # config[:default_solr_parameters][:qt], so isn't actually neccesary.
    config.add_search_field('subject') do |field|
      field.qt = 'search'
      field.solr_parameters = {
        'spellcheck.dictionary': 'subject',
        qf: '${subject_qf}',
        pf: '${subject_pf}'
      }
    end
=end
    end
  end
end