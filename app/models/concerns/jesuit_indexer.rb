# Handles indexing of Jesuits in ElasticSearch via Sunspot.
module JesuitIndexer
  extend ActiveSupport::Concern

  # Public method for manually triggering reindexing
  def reindex_me
    puts "I'm being reindexed: ID##{self.id}\n\n"
    self.save
  end

  # Rules for indexing in ElasticSearch.
  included do
    searchable do

      # Jesuit Lives ID
      text :jl_id do
        self.jl_id.sub('.','-')
      end

      # Name
      text :last_name
      text :first_name_abbrev
      text :first_name

      # Dates
      date :birth_date do
        self.birth_date.date if self.birth_date.present?
      end

      date :entrance_date do
        self.entrance_date.date if self.entrance_date.present?
      end

      date :entrance_date_2 do
        self.entrance_date_2.date if self.entrance_date_2.present?
      end

      date :vow_date do
        self.vow_date.date if self.vow_date.present?
      end

      date :death_date do
        self.entrance_date_2.date if self.entrance_date_2.present?
      end

      text :entrance_province_abbrev do
        self.entrance_province.abbreviation if self.entrance_province.present?
      end

      text :entrance_province do
        self.entrance_province.label if self.entrance_province.present?
      end

      # Title

      text :title_abbrev do
        self.title.abbreviation if self.title.present?
      end

      text :title_unabridged do
        self.title.unabridged if self.title.present?
      end

      text :title do
        self.title.label if self.title.present?
      end

      # Status

      text :status_abbrev do
        self.status.abbreviation if self.status.present?
      end

      text :status_unabridged do
        self.status.unabridged if self.status.present?
      end

      text :status do
        self.status.label if self.status.present?
      end

      time :created_at
      time :updated_at
    end

  end
end