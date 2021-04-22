# Solr index field names
#
# All fields except 'id' are <dynamicField>s.
module SolrIndexer::Fields
  # SUFFIXES

  # Analyzed text fields
  TEXT_STORED_INDEXED = 'tsi'
  TEXT_STORED_INDEXED_MULTI = 'tsim'

  # Unanalyzed string fields.
  STRING_STORED_INDEXED = 'ssi'

  # String, not analyzed used for facets
  FACET = 'facet'

  # Stored text, not indexed. Multi.
  DISPLAY = 'display'

  # Integer point, used in range searches (e.g. year)
  INTEGER_POINT = 'iti'
  INTEGER_POINT_MULTI = 'itim'

  # Date types
  DATE_INDEXED = 'dti'
  DATE_INDEXED_MULTI = 'dtim'

  # Geo-coordinate
  COORDINATE = 'coordinate'

  # FIELDS

  # Generated ID, used as unique identifier for record
  ID = "id"

  # In-project IDs
  JESUIT_LIVES_ID = "jl_id_#{STRING_STORED_INDEXED}"

  # Name fields
  FIRST_NAME = "first_name_#{TEXT_STORED_INDEXED}"
  FIRST_NAME_ABBREV = "first_name_abbrev_#{TEXT_STORED_INDEXED}"
  LAST_NAME = "last_name_#{TEXT_STORED_INDEXED}"
  FULL_NAME = "full_name_#{TEXT_STORED_INDEXED}"

  ALT_LAST_NAME = "alt_last_name_#{TEXT_STORED_INDEXED}"
  ALT_FIRST_NAME = "alt_first_name_#{TEXT_STORED_INDEXED}"

  ADD_FIRST_NAME_INFO = "add_first_name_info_#{TEXT_STORED_INDEXED}"
  ADD_LAST_NAME_INFO = "add_last_name_info_#{TEXT_STORED_INDEXED}"

  # Title fields
  TITLE = "title_#{TEXT_STORED_INDEXED}"
  TITLE_ABBREV = "title_abbrev_#{STRING_STORED_INDEXED}"
  TITLE_UNABRIDGED = "title_unabridged_#{TEXT_STORED_INDEXED}"
  TITLE_FACET = "title_#{FACET}"

  # Status fields
  STATUS = "status_#{TEXT_STORED_INDEXED}"
  STATUS_ABBREV = "status_abbrev_#{STRING_STORED_INDEXED}"
  STATUS_UNABRIDGED = "status_unabridged_#{TEXT_STORED_INDEXED}"
  STATUS_FACET = "status_#{FACET}"

  ADD_STATUS_INFO = "add_status_info_#{TEXT_STORED_INDEXED}"

  # Place fields
  PLACE_OF_BIRTH = "place_of_birth_#{TEXT_STORED_INDEXED}"
  PLACE_OF_BIRTH_ID = "place_of_birth_#{DISPLAY}"
  PLACE_OF_BIRTH_LAT = "place_of_birth_lat_#{COORDINATE}"
  PLACE_OF_BIRTH_LON = "place_of_birth_lon_#{COORDINATE}"
  PLACE_OF_BIRTH_DESC = "place_of_birth_desc_#{TEXT_STORED_INDEXED}"
  PLACE_OF_BIRTH_FACET = "place_of_birth_#{FACET}"

  ALT_PLACE_OF_BIRTH = "alt_place_of_birth_#{TEXT_STORED_INDEXED}"
  ALT_PLACE_OF_BIRTH_ID = "alt_place_of_birth_#{DISPLAY}"
  ALT_PLACE_OF_BIRTH_LAT = "alt_place_of_birth_lat_#{COORDINATE}"
  ALT_PLACE_OF_BIRTH_LON = "alt_place_of_birth_lon_#{COORDINATE}"
  ALT_PLACE_OF_BIRTH_DESC = "alt_place_of_birth_desc_#{TEXT_STORED_INDEXED}"
  ALT_PLACE_OF_BIRTH_FACET = "alt_place_of_birth_#{FACET}"

  ALL_PLACES_OF_BIRTH = "all_places_of_birth_#{TEXT_STORED_INDEXED_MULTI}"
  ALL_PLACES_OF_BIRTH_ID = "all_places_of_birth_#{DISPLAY}"
  ALL_PLACES_OF_BIRTH_LAT = "all_places_of_birth_lat_#{COORDINATE}" # Coordinates might be weird for multi fields
  ALL_PLACES_OF_BIRTH_LON = "all_places_of_birth_lon_#{COORDINATE}"
  ALL_PLACES_OF_BIRTH_DESC = "all_places_of_birth_desc_#{TEXT_STORED_INDEXED_MULTI}"
  ALL_PLACES_OF_BIRTH_FACET = "all_places_of_birth_#{FACET}"
  
  PLACE_OF_DEATH = "place_of_death_#{TEXT_STORED_INDEXED}"
  PLACE_OF_DEATH_ID = "place_of_death_#{DISPLAY}"
  PLACE_OF_DEATH_LAT = "place_of_death_lat_#{COORDINATE}"
  PLACE_OF_DEATH_LON = "place_of_death_lon_#{COORDINATE}"
  PLACE_OF_DEATH_DESC = "place_of_death_desc_#{TEXT_STORED_INDEXED}"
  PLACE_OF_DEATH_FACET = "place_of_death_#{FACET}"

  ALT_PLACE_OF_DEATH = "alt_place_of_death_#{TEXT_STORED_INDEXED}"
  ALT_PLACE_OF_DEATH_ID = "alt_place_of_death_#{DISPLAY}"
  ALT_PLACE_OF_DEATH_LAT = "alt_place_of_death_lat_#{COORDINATE}"
  ALT_PLACE_OF_DEATH_LON = "alt_place_of_death_lon_#{COORDINATE}"
  ALT_PLACE_OF_DEATH_DESC = "alt_place_of_death_desc_#{TEXT_STORED_INDEXED}"
  ALT_PLACE_OF_DEATH_FACET = "alt_place_of_death_#{FACET}"

  ALL_PLACES_OF_DEATH = "all_places_of_death_#{TEXT_STORED_INDEXED_MULTI}"
  ALL_PLACES_OF_DEATH_ID = "all_places_of_death_#{DISPLAY}"
  ALL_PLACES_OF_DEATH_LAT = "all_places_of_death_lat_#{COORDINATE}" # Coordinates might be weird for multi fields
  ALL_PLACES_OF_DEATH_LON = "all_places_of_death_lon_#{COORDINATE}"
  ALL_PLACES_OF_DEATH_DESC = "all_places_of_death_desc_#{TEXT_STORED_INDEXED_MULTI}"
  ALL_PLACES_OF_DEATH_FACET = "all_places_of_death_#{FACET}"

  ADD_PLACE_OF_BIRTH_INFO = "add_place_of_birth_info_#{TEXT_STORED_INDEXED}"
  ADD_PLACE_OF_DEATH_INFO = "add_place_of_death_info_#{TEXT_STORED_INDEXED}"

  # Province fields
  ENTRANCE_PROVINCE = "entrance_province_#{TEXT_STORED_INDEXED}"
  ENTRANCE_PROVINCE_FACET = "entrance_province_#{FACET}"

  ENTRANCE_PROVINCE_2 = "entrance_province_2_#{TEXT_STORED_INDEXED}"
  ENTRANCE_PROVINCE_2_FACET = "entrance_province_2_#{FACET}"

  ALL_ENTRANCE_PROVINCE = "all_entrance_province_#{TEXT_STORED_INDEXED_MULTI}"
  ALL_ENTRANCE_PROVINCE_FACET = "all_entrance_province_#{FACET}"

  ADD_ENTRANCE_PLACE_INFO_I1 = "add_entrance_place_info_i1_#{TEXT_STORED_INDEXED}"
  ADD_ENTRANCE_PLACE_INFO_I2 = "add_entrance_place_info_i2_#{TEXT_STORED_INDEXED}"

  # Date fields
  BIRTH_DATE = "birth_date_#{DATE_INDEXED}"
  BIRTH_DATE_DISPLAY = "birth_date_#{DISPLAY}"
  BIRTH_DATE_YEAR = "birth_year_#{INTEGER_POINT}"

  ALT_BIRTH_DATE = "alt_birth_date_#{DATE_INDEXED}"
  ALT_BIRTH_DATE_DISPLAY = "alt_birth_date_#{DISPLAY}"
  ALT_BIRTH_DATE_YEAR = "alt_birth_year_#{INTEGER_POINT}"

  ALL_BIRTH_DATES = "all_birth_dates_#{DATE_INDEXED_MULTI}"
  ALL_BIRTH_DATES_DISPLAY = "all_birth_dates_#{DISPLAY}"
  ALL_BIRTH_DATES_YEAR = "all_birth_years_#{INTEGER_POINT_MULTI}"

  ADD_BIRTH_DATE_INFO = "add_birth_date_info_#{TEXT_STORED_INDEXED}"

  DEATH_DATE = "death_date_#{DATE_INDEXED}"
  DEATH_DATE_DISPLAY = "death_date_#{DISPLAY}"
  DEATH_DATE_YEAR = "death_year_#{INTEGER_POINT}"

  ALT_DEATH_DATE = "alt_death_date_#{DATE_INDEXED}"
  ALT_DEATH_DATE_DISPLAY = "alt_death_date_#{DISPLAY}"
  ALT_DEATH_DATE_YEAR = "alt_death_year_#{INTEGER_POINT}"

  ALL_DEATH_DATES = "all_death_dates_#{DATE_INDEXED_MULTI}"
  ALL_DEATH_DATES_DISPLAY = "all_death_dates_#{DISPLAY}"
  ALL_DEATH_DATES_YEAR = "all_death_years_#{INTEGER_POINT_MULTI}"

  ADD_DEATH_DATE_INFO = "add_death_date_info_#{TEXT_STORED_INDEXED}"

  VOW_DATE = "vow_date_#{DATE_INDEXED}"
  VOW_DATE_DISPLAY = "vow_date_#{DISPLAY}"
  VOW_DATE_YEAR = "vow_year_#{INTEGER_POINT}"

  ALT_VOW_DATE = "alt_vow_date_#{DATE_INDEXED}"
  ALT_VOW_DATE_DISPLAY = "alt_vow_date_#{DISPLAY}"
  ALT_VOW_DATE_YEAR = "alt_vow_year_#{INTEGER_POINT}"

  ALL_VOW_DATES = "all_vow_dates_#{DATE_INDEXED_MULTI}"
  ALL_VOW_DATES_DISPLAY = "all_vow_dates_#{DISPLAY}"
  ALL_VOW_DATES_YEAR = "all_vow_years_#{INTEGER_POINT_MULTI}"

  ADD_VOW_DATE_INFO = "add_vow_date_info_#{TEXT_STORED_INDEXED}"

  ENTRANCE_DATE = "entrance_date_#{DATE_INDEXED}"
  ENTRANCE_DATE_DISPLAY = "entrance_date_#{DISPLAY}"
  ENTRANCE_DATE_YEAR = "entrance_year_#{INTEGER_POINT}"

  ENTRANCE_DATE_2 = "entrance_date_2_#{DATE_INDEXED}"
  ENTRANCE_DATE_2_DISPLAY = "entrance_date_2_#{DISPLAY}"
  ENTRANCE_DATE_2_YEAR = "entrance_year_2_#{INTEGER_POINT}"

  ALT_ENTRANCE_DATE_I1 = "alt_entrance_date_i1_#{DATE_INDEXED}"
  ALT_ENTRANCE_DATE_I1_DISPLAY = "alt_entrance_date_i1_#{DISPLAY}"
  ALT_ENTRANCE_DATE_I1_YEAR = "entrance_year_i1_#{INTEGER_POINT}"

  ALT_ENTRANCE_DATE_I2 = "alt_entrance_date_i2_#{DATE_INDEXED}"
  ALT_ENTRANCE_DATE_I2_DISPLAY = "alt_entrance_date_i2_#{DISPLAY}"
  ALT_ENTRANCE_DATE_I2_YEAR = "entrance_year_i2_#{INTEGER_POINT}"

  ALL_ENTRANCE_DATES = "all_entrance_dates_#{DATE_INDEXED_MULTI}"
  ALL_ENTRANCE_DATES_DISPLAY = "all_entrance_dates_#{DISPLAY}"
  ALL_ENTRANCE_DATES_YEAR = "all_entrance_years_#{INTEGER_POINT_MULTI}"
  
  ADD_ENTRANCE_DATE_I1_INFO = "add_entrance_date_i1_info_#{TEXT_STORED_INDEXED}"
  ADD_ENTRANCE_DATE_I2_INFO = "add_entrance_date_i2_info_#{TEXT_STORED_INDEXED}"

  ORDINATION_DATE = "ordination_date_#{DATE_INDEXED}"
  ORDINATION_DATE_DISPLAY = "ordination_date_#{DISPLAY}"
  ORDINATION_DATE_YEAR = "ordination_year_#{INTEGER_POINT}"

end