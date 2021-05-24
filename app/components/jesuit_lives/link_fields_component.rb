# frozen_string_literal: true
module JesuitLives
  # frozen_string_literal: true

  class LinkFieldsComponent < ::ViewComponent::Base

    FIELD_KEYS = [
      SolrIndexer::Fields::PORTAL_URL,
      SolrIndexer::Fields::GEORGETOWN_URL,
      SolrIndexer::Fields::WEB_RESOURCES
    ]

    def initialize(field_hash:)
      @field_hash = field_hash
    end

    # Is there a link on this field?
    # @param [String] key
    def link_present?(key)
      @field_hash.key?(key)
    end

    # Get link for field
    # @param [String] key
    def link_for(key)
      link_present?(key) ? @field_hash[key].values[0] : nil
    end

    # Get the term to search for at the link
    def search_term
      # There should be a better way to get the last name without displaying it
      # separately in the record.
      @field_hash["jl_id_ssi"].document[SolrIndexer::Fields::LAST_NAME]
    end

    def render?
      LinkFieldsComponent::FIELD_KEYS.any? { |k| @field_hash.key?(k) }
    end
  end
end
