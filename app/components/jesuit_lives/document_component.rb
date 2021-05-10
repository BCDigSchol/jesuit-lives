module JesuitLives
  class DocumentComponent < Blacklight::DocumentComponent

    def tombstone
      @tombstone ||= begin
                       byear = first(SolrIndexer::Fields::BIRTH_DATE_YEAR_DISPLAY)
                       place_birth = first(SolrIndexer::Fields::PLACE_OF_BIRTH)
                       dyear = first(SolrIndexer::Fields::DEATH_DATE_YEAR_DISPLAY)
                       place_death = first(SolrIndexer::Fields::PLACE_OF_DEATH)

                       @tombstone = TombstonePresenter::new(byear, place_birth, dyear, place_death)
                     end
    end

    private
    def first(field)
      if @document[field].kind_of?(Array)
        @document[field].first
      else
        @document[field]
      end
    end
  end
end