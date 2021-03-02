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
      @doc[:full_name] = jesuit.last_name + ', ' + jesuit.first_name

      if jesuit.title.present?
        @doc[:title] = jesuit.title.label
        @doc[:title_abbrev] = jesuit.title.abbreviation
        @doc[:title_unabridged] = jesuit.title.unabridged
      end

      if jesuit.status.present?
        @doc[:status] = jesuit.status.label
        @doc[:status_abbrev] = jesuit.status.abbreviation
        @doc[:status_unabridged] = jesuit.status.unabridged
      end

      if jesuit.birth_date.present?
        @doc[:birth_date] = jesuit.birth_date.solr_date
      end

      if jesuit.death_date.present?
        @doc[:death_date] = jesuit.death_date.solr_date
      end

      if jesuit.vow_date.present?
        @doc[:vow_date] = jesuit.vow_date.solr_date
      end

      if jesuit.entrance_date.present?
        @doc[:entrance_date] = jesuit.entrance_date.solr_date
      end

      if jesuit.entrance_date_2.present?
        @doc[:entrance_date_2] = jesuit.entrance_date_2.solr_date
      end

      if jesuit.place_of_birth.present?
        add_place 'place_of_birth', jesuit.place_of_birth
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

    # @param [Place] place
    # @param [string] prefix
    def add_place(prefix, place)
      @doc[prefix] = place.label
      @doc[prefix + '_id'] = place.id
      @doc[prefix + '_lat'] = place.latitude
      @doc[prefix + '_lon'] = place.longitude
      @doc[prefix + '_desc'] = place.description
    end

  end
end