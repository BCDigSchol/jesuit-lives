module SolrIndexer

  # A Doc for indexing into Solr.
  class Doc

    # @param [Jesuit] jesuit
    def initialize(jesuit)
      raise JesuitLacksIdError unless jesuit.jl_id.present?

      @doc = {}

      add_field(Fields::ID, jesuit.linking_id)
      add_field(Fields::JESUIT_LIVES_ID, jesuit.jl_id)

      add_field(Fields::FIRST_NAME, jesuit.first_name)
      add_field(Fields::FIRST_NAME_ABBREV, jesuit.first_name_abbrev)
      add_field(Fields::ALT_FIRST_NAME, jesuit.alt_first_name)
      add_field(Fields::ADD_FIRST_NAME_INFO, jesuit.add_first_name_info)

      add_field(Fields::LAST_NAME, jesuit.last_name)
      add_field(Fields::ALT_LAST_NAME, jesuit.alt_last_name)
      add_field(Fields::ADD_LAST_NAME_INFO, jesuit.add_last_name_info)

      add_field(Fields::FULL_NAME, jesuit.full_name)

      unless jesuit.title.nil?
        add_field(Fields::TITLE, jesuit.title.label)
        add_field(Fields::TITLE_ABBREV, jesuit.title.abbreviation)
        add_field(Fields::TITLE_UNABRIDGED, jesuit.title.unabridged)
        add_field(Fields::TITLE_FACET, jesuit.title.label)
      end

      unless jesuit.status.nil?
        add_field(Fields::STATUS, jesuit.status.label)
        add_field(Fields::STATUS_ABBREV, jesuit.status.abbreviation)
        add_field(Fields::STATUS_UNABRIDGED, jesuit.status.unabridged)
        add_field(Fields::STATUS_FACET, jesuit.status.label)
      end

      add_field(Fields::ADD_STATUS_INFO, jesuit.add_status_info)

      add_date('BIRTH_DATE', jesuit.birth_date)
      add_date('ALT_BIRTH_DATE', jesuit.alt_birth_date)
      add_date('ALL_BIRTH_DATES', jesuit.birth_date, multi_value: true)
      add_date('ALL_BIRTH_DATES', jesuit.alt_birth_date, multi_value: true)

      add_field(Fields::ADD_BIRTH_DATE_INFO, jesuit.add_birth_date_info)

      add_date('DEATH_DATE', jesuit.death_date)
      add_date('ALT_DEATH_DATE', jesuit.alt_death_date)
      add_date('ALL_DEATH_DATES', jesuit.death_date, multi_value: true)
      add_date('ALL_DEATH_DATES', jesuit.alt_death_date, multi_value: true)

      add_field(Fields::ADD_DEATH_DATE_INFO, jesuit.add_death_date_info)

      add_date('VOW_DATE', jesuit.vow_date)
      add_date('ALT_VOW_DATE', jesuit.alt_final_vow_date)
      add_date('ALL_VOW_DATES', jesuit.vow_date, multi_value: true )
      add_date('ALL_VOW_DATES', jesuit.alt_final_vow_date, multi_value: true)

      add_field(Fields::ADD_VOW_DATE_INFO, jesuit.add_final_vow_date_info)

      add_date('ORDINATION_DATE', jesuit.ordination_date)

      add_date('ENTRANCE_DATE', jesuit.entrance_date)
      add_date('ENTRANCE_DATE_2', jesuit.entrance_date_2)
      add_date('ALT_ENTRANCE_DATE_I1', jesuit.alt_entrance_date_i1)
      add_date('ALT_ENTRANCE_DATE_I2', jesuit.alt_entrance_date_i2)

      add_date('ALL_ENTRANCE_DATES', jesuit.entrance_date, multi_value: true)
      add_date('ALL_ENTRANCE_DATES', jesuit.entrance_date_2, multi_value: true)
      add_date('ALL_ENTRANCE_DATES', jesuit.alt_entrance_date_i1, multi_value: true)
      add_date('ALL_ENTRANCE_DATES', jesuit.alt_entrance_date_i2, multi_value: true)

      add_field(Fields::ADD_ENTRANCE_PLACE_INFO_I1, jesuit.add_entrance_date_i1_info)
      add_field(Fields::ADD_ENTRANCE_PLACE_INFO_I2, jesuit.add_entrance_date_i2_info)

      add_place('PLACE_OF_BIRTH', jesuit.place_of_birth)
      add_place('ALT_PLACE_OF_BIRTH', jesuit.alt_place_of_birth)

      add_field(Fields::ADD_PLACE_OF_BIRTH_INFO, jesuit.add_place_of_birth_info)

      add_place('PLACE_OF_DEATH', jesuit.place_of_death)
      add_place('ALT_PLACE_OF_DEATH', jesuit.alt_place_of_death)

      add_field(Fields::ADD_PLACE_OF_DEATH_INFO, jesuit.add_place_of_death_info)

      unless jesuit.entrance_province.nil?
        @doc[Fields::ENTRANCE_PROVINCE] = []
        @doc[Fields::ENTRANCE_PROVINCE] << jesuit.entrance_province.label

        @doc[Fields::ENTRANCE_PROVINCE_FACET] = []
        @doc[Fields::ENTRANCE_PROVINCE_FACET] << jesuit.entrance_province.label
      end

      unless jesuit.entrance_province_2.nil?
        @doc[Fields::ENTRANCE_PROVINCE_2] = []
        @doc[Fields::ENTRANCE_PROVINCE_2] << jesuit.entrance_province_2.label

        @doc[Fields::ENTRANCE_PROVINCE_2_FACET] = []
        @doc[Fields::ENTRANCE_PROVINCE_2_FACET] << jesuit.entrance_province_2.label
      end

      add_field(Fields::ADD_ENTRANCE_PLACE_INFO_I1, jesuit.add_entrance_place_info_i1)
      add_field(Fields::ADD_ENTRANCE_PLACE_INFO_I2, jesuit.add_entrance_place_info_i2)

      add_field(Fields::PORTAL_URL, jesuit.portal_url)
      add_field(Fields::GEORGETOWN_URL, jesuit.georgetown_url)
      add_field(Fields::WEB_RESOURCES, jesuit.web_resources)

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
      @doc[Fields::const_get("#{prefix}_YEAR_DISPLAY")] = date_point.date.year
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

      year_display_field = Fields::const_get("#{prefix}_YEAR")
      @doc[year_display_field] ||= []
      @doc[year_display_field] << date_point.date.year
    end


    # Add a field unless it's blank or nil
    #
    # @param [String] field_name Solr field to index
    # @param [Object] value to index
    def add_field(field_name, value)
      @doc[field_name] = value unless value.to_s.empty?
    end

  end
end