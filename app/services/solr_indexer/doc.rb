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

      add_date('birth_date', jesuit.birth_date)
      add_date('death_date', jesuit.death_date)
      add_date('vow_date', jesuit.vow_date)
      add_date('entrance_date', jesuit.entrance_date, multi_value: true)
      add_date('entrance_date', jesuit.entrance_date_2, multi_value: true)

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

    # Add all fields needed to represent a date
    #
    # @param [String] prefix
    # @param [#label] place
    def add_place(prefix, place)
      @doc[prefix] = place.label
      @doc[prefix + '_id'] = place.id
      @doc[prefix + '_lat'] = place.latitude
      @doc[prefix + '_lon'] = place.longitude
      @doc[prefix + '_desc'] = place.description
    end

    # Add all fields needed to represent a date
    #
    # @param [String] prefix
    # @param [#label] date_point
    def add_date(prefix, date_point, multi_value: false)

      # Return early if there is no date.
      return if date_point.nil? || date_point.date.nil?

      year_key = prefix.sub('_date', '_year')

      if multi_value
        @doc[prefix] ||= []
        @doc[prefix] << date_point.solr_date # e.g. entrance_date

        @doc[prefix + '_display'] ||= []
        @doc[prefix + '_display'] << date_point.text # e.g. entrance_date_display

        @doc[year_key + '_itim'] ||= []
        @doc[year_key + '_itim'] << date_point.date.year # e.g. entrance_year_itim
      else
        @doc[prefix] = date_point.solr_date
        @doc[prefix + '_display'] = date_point.text
        @doc[year_key + '_iti'] = date_point.date.year # e.g. birth_year_iti
      end
    end

  end
end