# Presenter for Jesuit record tombstones. Used to give a brief summary of the Jesuit for
# identification purposes. Includes birth/death dates and places.
module JesuitLives
  class TombstonePresenter
    def initialize(birth_year, birth_place, death_year, death_place)
      @birth_year = birth_year
      @birth_place = birth_place
      @death_year = death_year
      @death_place = death_place
    end

    # Fully formatted tombstone
    #
    # @return [String] e.g. '????; Palacio – 1814; Roma'
    def full
      birth + separator + death
    end

    # Birth portion of tombstone
    #
    # @return [String] e.g. '????; Palacio'
    def birth
      TombstonePresenter::format_date_place_entry(@birth_year, @birth_place)
    end

    # Death portion of tombstone
    #
    # @return [String] e.g. '1814; Roma''
    def death
      TombstonePresenter::format_date_place_entry(@death_year, @death_place)
    end

    # Separator string between birth and death portions of tombstone
    #
    # @return [String] e.g. '–'
    def separator
      '–'
    end

    # Format year and place string for presentation in tombstone
    #
    #
    # @param [String] year
    # @param [String] place
    # @return [String] e.g. '1814; Roma''
    def self.format_date_place_entry(year, place)
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
  end

end