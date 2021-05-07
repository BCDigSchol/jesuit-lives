module JesuitLives
  class ShowPresenter < Blacklight::ShowPresenter

    # Return field presenters as a hash keyed by Solr field
    def field_presenter_hash
      fields_enum = to_enum(:field_presenters)
      Hash[fields_enum.collect { |field| [field.field_config.key, field] }]
    end

  end
end