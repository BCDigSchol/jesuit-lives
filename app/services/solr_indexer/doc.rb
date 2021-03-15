module SolrIndexer

  # A Doc for indexing into Solr.
  class Doc

    # @param [Jesuit] jesuit
    def initialize(jesuit)
      raise JesuitLacksIdError unless jesuit.jl_id.present?

      @doc = {}

      @doc[:id] = jesuit.jl_id

      @doc[:first_name] = jesuit.first_name
      @doc[:first_name_abbrev] = jesuit.first_name_abbrev
      @doc[:last_name] = jesuit.last_name
      @doc[:full_name] = jesuit.full_name

      unless jesuit.title.nil?
        @doc[:title] = jesuit.title.label
        @doc[:title_abbrev] = jesuit.title.abbreviation
        @doc[:title_unabridged] = jesuit.title.unabridged
        @doc[:title_facet] = jesuit.title.label
      end

      unless jesuit.status.nil?
        @doc[:status] = jesuit.status.label
        @doc[:status_abbrev] = jesuit.status.abbreviation
        @doc[:status_unabridged] = jesuit.status.unabridged
        @doc[:status_facet] = jesuit.status.label
      end

      unless date_is_empty?(jesuit.birth_date)
        @doc[:birth_date] = jesuit.birth_date.solr_date
        @doc[:birth_year_iti] = jesuit.birth_date.date.year
      end

      unless date_is_empty?(jesuit.death_date)
        @doc[:death_date] = jesuit.death_date.solr_date
        @doc[:death_year_iti] = jesuit.death_date.date.year
      end

      unless date_is_empty?(jesuit.vow_date)
        @doc[:vow_date] = jesuit.vow_date.solr_date
        @doc[:vow_year_iti] = jesuit.vow_date.date.year
      end

      unless date_is_empty?(jesuit.entrance_date)
        @doc[:entrance_date] = [jesuit.entrance_date.solr_date]
        @doc[:entrance_year_iti] = [jesuit.entrance_date.date.year]
      end

      unless date_is_empty?(jesuit.entrance_date_2)
        @doc[:entrance_date] ||= []
        @doc[:entrance_year_iti] ||= []
        @doc[:entrance_date]  << jesuit.entrance_date_2.solr_date
        @doc[:entrance_year_iti]  << jesuit.entrance_date_2.date.year
      end

      unless jesuit.place_of_birth.nil?
        add_place 'place_of_birth', jesuit.place_of_birth
        @doc[:place_of_birth_facet] = jesuit.place_of_birth.label
      end

      unless jesuit.place_of_death.nil?
        add_place 'place_of_death', jesuit.place_of_death
        @doc[:place_of_death_facet] = jesuit.place_of_death.label
      end

      unless jesuit.entrance_province.nil?
        @doc[:entrance_province] = jesuit.entrance_province.abbreviation
        @doc[:entrance_province_facet] = jesuit.entrance_province.abbreviation
      end

    end

    # Get the Doc as a hash for use in rsolr.
    def to_hash
      @doc
    end

    class JesuitLacksIdError < StandardError
      def message
        "Can't index Jesuit without an ID"
      end
    end

    private

    # @param [#label] place
    # @param [string] prefix
    def add_place(prefix, place)
      @doc[prefix] = place.label
      @doc[prefix + '_id'] = place.id
      @doc[prefix + '_lat'] = place.latitude
      @doc[prefix + '_lon'] = place.longitude
      @doc[prefix + '_desc'] = place.description
    end

    # Return true if the a real date isn't present
    #
    # @param [#date] date_point date point to test
    # @return [Boolean]
    def date_is_empty?(date_point)
      date_point.nil? || date_point.date.nil?
    end

  end
end