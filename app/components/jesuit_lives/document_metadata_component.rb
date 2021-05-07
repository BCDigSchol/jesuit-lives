# frozen_string_literal: true

module JesuitLives
  class DocumentMetadataComponent < ::ViewComponent::Base

    def initialize(field_hash:)
      @field_hash = field_hash
    end

    def render?
      @field_hash.any?
    end

    def hashed_field_component(key)
      JesuitLives::HashedDocumentFieldComponent.new(field: @field_hash[key])
    end

  end
end
