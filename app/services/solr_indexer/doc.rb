module SolrIndexer

  # A Doc for indexing into Solr.
  class Doc

    # @param [Jesuit] jesuit
    def initialize(jesuit)
      raise JesuitLacksIdError unless jesuit.jl_id.present?

      @doc = {}

      @doc[Fields::ID] = jesuit.linking_id
      @doc[Fields::JESUIT_LIVES_ID] = jesuit.jl_id

      @doc[Fields::FIRST_NAME] = jesuit.first_name
      @doc[Fields::FIRST_NAME_ABBREV] = jesuit.first_name_abbrev
      @doc[Fields::LAST_NAME] = jesuit.last_name
      @doc[Fields::FULL_NAME] = jesuit.full_name

      unless jesuit.title.nil?
        @doc[Fields::TITLE] = jesuit.title.label
        @doc[Fields::TITLE_ABBREV] = jesuit.title.abbreviation
        @doc[Fields::TITLE_UNABRIDGED] = jesuit.title.unabridged
        @doc[Fields::TITLE_FACET] = jesuit.title.label
      end

      unless jesuit.status.nil?
        @doc[Fields::STATUS] = jesuit.status.label
        @doc[Fields::STATUS_ABBREV] = jesuit.status.abbreviation
        @doc[Fields::STATUS_UNABRIDGED] = jesuit.status.unabridged
        @doc[Fields::STATUS_FACET] = jesuit.status.label
      end

      add_date('BIRTH_DATE', jesuit.birth_date)
      add_date('DEATH_DATE', jesuit.death_date)
      add_date('VOW_DATE', jesuit.vow_date)
      add_date('ENTRANCE_DATE', jesuit.entrance_date, multi_value: true)
      add_date('ENTRANCE_DATE', jesuit.entrance_date_2, multi_value: true)

      add_place('PLACE_OF_BIRTH', jesuit.place_of_birth)
      add_place('PLACE_OF_DEATH', jesuit.place_of_death)

      unless jesuit.entrance_province.nil?
        @doc[Fields::ENTRANCE_PROVINCE] = []
        @doc[Fields::ENTRANCE_PROVINCE] << jesuit.entrance_province.abbreviation

        @doc[:entrance_province_facet] = []
        @doc[:entrance_province_facet] << jesuit.entrance_province.abbreviation
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
    # @param [String] prefix e.g. 'PLACE_OF_BIRTH'
    # @param [#label] place
    def add_place(prefix, place)
      return if place.nil?

      @doc[Fields::const_get(prefix)] = place.label
      @doc[Fields::const_get("#{prefix}_ID")] = place.id
      @doc[Fields::const_get("#{prefix}_LAT")] = place.latitude
      @doc[Fields::const_get("#{prefix}_LON")] = place.longitude
      @doc[Fields::const_get("#{prefix}_DESC")] = place.description
      @doc[Fields::const_get("#{prefix}_FACET")] = place.label
    end

    # Add all fields needed to represent a date
    #
    # @param [String] prefix
    # @param [#label] date_point
    def add_date(prefix, date_point, multi_value: false)

      # Return early if there is no date.
      return if date_point.nil? || date_point.date.nil?

      if multi_value
        add_multi_value_date(date_point, prefix)
      else
        add_single_value_date(date_point, prefix) # e.g. birth_year_iti
      end

    end

    # Add a date to a field that only allows one value
    #
    #
    # @param [DatePoint] date_point
    # @param [String] prefix e.g. 'BIRTH'
    def add_single_value_date(date_point, prefix)
      @doc[Fields::const_get("#{prefix}")] = date_point.solr_date
      @doc[Fields::const_get("#{prefix}_DISPLAY")] = date_point.text
      @doc[Fields::const_get("#{prefix}_YEAR")] = date_point.date.year
    end

    # Add a date to a field that allows multiple values
    #
    # @param [DatePoint] date_point
    # @param [String] prefix e.g. 'ENTRANCE'
    def add_multi_value_date(date_point, prefix)
      date_field = Fields::const_get("#{prefix}")
      @doc[date_field] ||= []
      @doc[date_field] << date_point.solr_date

      display_field = Fields::const_get("#{prefix}_DISPLAY")
      @doc[display_field] ||= []
      @doc[display_field] << date_point.text

      year_field = Fields::const_get("#{prefix}_YEAR")
      @doc[year_field] ||= []
      @doc[year_field] << date_point.date.year
    end

  end
end