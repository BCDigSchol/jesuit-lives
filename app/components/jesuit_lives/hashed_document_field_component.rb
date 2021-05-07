# frozen_string_literal: true

class JesuitLives::HashedDocumentFieldComponent < ViewComponent::Base
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
