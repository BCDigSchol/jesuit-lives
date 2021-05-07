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

    def link_present?(key)
      @field_hash.key?(key)
    end

    def link_for(key)
      link_present?(key) ? @field_hash[key].values[0] : nil
    end

    def render?
      LinkFieldsComponent::FIELD_KEYS.any? { |k| @field_hash.key?(k) }
    end
  end
end
