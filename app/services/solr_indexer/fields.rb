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

  # Stored text, not indexed.
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

  # In-project ID (e.g. 1.143)
  JESUIT_LIVES_ID = "jl_id_#{STRING_STORED_INDEXED}"

  # Name fields
  FIRST_NAME = "first_name_#{TEXT_STORED_INDEXED}"
  FIRST_NAME_ABBREV = "first_name_abbrev_#{TEXT_STORED_INDEXED}"
  LAST_NAME = "last_name_#{TEXT_STORED_INDEXED}"
  FULL_NAME = "full_name_#{TEXT_STORED_INDEXED}"

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

  # Place fields
  PLACE_OF_BIRTH = "place_of_birth_#{TEXT_STORED_INDEXED}"
  PLACE_OF_BIRTH_ID = "place_of_birth_#{DISPLAY}"
  PLACE_OF_BIRTH_LAT = "place_of_birth_lat_#{COORDINATE}"
  PLACE_OF_BIRTH_LON = "place_of_birth_lon_#{COORDINATE}"
  PLACE_OF_BIRTH_DESC = "place_of_birth_desc_#{TEXT_STORED_INDEXED}"
  PLACE_OF_BIRTH_FACET = "place_of_birth_#{FACET}"

  PLACE_OF_DEATH = "place_of_death_#{TEXT_STORED_INDEXED}"
  PLACE_OF_DEATH_ID = "place_of_death_#{DISPLAY}"
  PLACE_OF_DEATH_LAT = "place_of_death_lat_#{COORDINATE}"
  PLACE_OF_DEATH_LON = "place_of_death_lon_#{COORDINATE}"
  PLACE_OF_DEATH_DESC = "place_of_death_desc_#{TEXT_STORED_INDEXED}"
  PLACE_OF_DEATH_FACET = "place_of_death_#{FACET}"

  # Province fields
  ENTRANCE_PROVINCE = "entrance_province_#{TEXT_STORED_INDEXED_MULTI}"
  ENTRANCE_PROVINCE_FACET = "entrance_province_#{FACET}"

  # Date fields
  BIRTH_DATE = "birth_date_#{DATE_INDEXED}"
  BIRTH_DATE_DISPLAY = "birth_date_#{DISPLAY}"
  BIRTH_DATE_YEAR = "birth_year_#{INTEGER_POINT}"

  DEATH_DATE = "death_date_#{DATE_INDEXED}"
  DEATH_DATE_DISPLAY = "death_date_#{DISPLAY}"
  DEATH_DATE_YEAR = "death_year_#{INTEGER_POINT}"

  VOW_DATE = "vow_date_#{DATE_INDEXED}"
  VOW_DATE_DISPLAY = "vow_date_#{DISPLAY}"
  VOW_DATE_YEAR = "vow_year_#{INTEGER_POINT}"

  ENTRANCE_DATE = "entrance_date_#{DATE_INDEXED_MULTI}"
  ENTRANCE_DATE_DISPLAY = "entrance_date_#{DISPLAY}"
  ENTRANCE_DATE_YEAR = "entrance_year_#{INTEGER_POINT_MULTI}"

end