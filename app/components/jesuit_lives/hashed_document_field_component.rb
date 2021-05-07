# frozen_string_literal: true

module JesuitLives
  class HashedDocumentFieldComponent < ViewComponent::Base
    def initialize(field:)
      @field = field
    end

    def render?
      @field.present?
    end

    def field_component(field)
      field&.component || JesuitLives::MetadataFieldComponent
    end
  end
end
