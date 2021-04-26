class JesuitDocumentComponent < Blacklight::DocumentComponent
  # Birth year and place portion of tombstone
  #
  # @return [String] e.g. "1736; Palmero"
  def tombstone_birth
    byear = first(SolrIndexer::Fields::BIRTH_DATE_YEAR_DISPLAY)
    place_birth = first(SolrIndexer::Fields::PLACE_OF_BIRTH)

    format_date_place_entry(byear, place_birth)
  end

  # Death year and place portion of tombstone
  #
  # @return [String] e.g. "1814; Castelvetrano"
  def tombstone_death
    dyear = first(SolrIndexer::Fields::DEATH_DATE_YEAR_DISPLAY)
    place_death = first(SolrIndexer::Fields::PLACE_OF_DEATH)

    format_date_place_entry(dyear, place_death)
  end

  # Build one half of the tombstone entry
  #
  # @param [String] year
  # @param [String] place
  # @return [String (frozen)]
  def format_date_place_entry(year, place)
    year_placeholder = '????'

    if year && place
      "#{year}; #{place}"
    elsif year
      year
    elsif place
      "#{year_placeholder}; #{place}"
    else
      year_placeholder
    end
  end

  def first(field)
    if @document[field].kind_of?(Array)
      @document[field].first
    else
      @document[field]
    end
  end
end