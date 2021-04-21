class Jesuit < ApplicationRecord
  # set to override default per page
  #paginates_per 50
  
  belongs_to :title, optional: true
  belongs_to :birth_date, class_name: "DatePoint", foreign_key: :birth_date_id, optional: true
  belongs_to :place_of_birth, class_name: "Place", foreign_key: :place_of_birth_id, optional: true
  belongs_to :place_of_death, class_name: "Place", foreign_key: :place_of_death_id, optional: true
  belongs_to :entrance_date, class_name: "DatePoint", foreign_key: :entrance_date_id, optional: true
  belongs_to :entrance_date_2, class_name: "DatePoint", foreign_key: :entrance_date_2_id, optional: true
  belongs_to :entrance_province, class_name: "Province", foreign_key: :entrance_province_id, optional: true
  belongs_to :entrance_province_2, class_name: "Province", foreign_key: :entrance_province_2_id, optional: true
  belongs_to :status, optional: true
  belongs_to :vow_date, class_name: "DatePoint", foreign_key: :vow_date_id, optional: true
  belongs_to :death_date, class_name: "DatePoint", foreign_key: :death_date_id, optional: true
  belongs_to :ordination_date, class_name: "DatePoint", foreign_key: :ordination_date_id, optional: true
  belongs_to :alt_birth_date, class_name: "DatePoint", foreign_key: :alt_birth_date_id, optional: true
  belongs_to :alt_place_of_birth, class_name: "Place", foreign_key: :alt_place_of_birth_id, optional: true
  belongs_to :alt_entrance_date_i1, class_name: "DatePoint", foreign_key: :alt_entrance_date_i1_id, optional: true
  belongs_to :alt_entrance_date_i2, class_name: "DatePoint", foreign_key: :alt_entrance_date_i2_id, optional: true
  belongs_to :alt_final_vow_date, class_name: "DatePoint", foreign_key: :alt_final_vow_date_id, optional: true
  belongs_to :alt_death_date, class_name: "DatePoint", foreign_key: :alt_death_date_id, optional: true
  belongs_to :alt_place_of_death, class_name: "Place", foreign_key: :alt_place_of_death_id, optional: true

  # Save then add to search index
  def save_and_index
    save
    indexer = SolrIndexer::Indexer.new
    indexer.add(self)
  end

  # Remove from search index then destroy
  def destroy_and_index
    indexer = SolrIndexer::Indexer.new
    indexer.delete(self)
    indexer.commit
    destroy
  end

  # Get the full name
  # @return [String]
  def full_name
    last_name_part = last_name.nil? ? '???' : last_name
    first_name_part = first_name.nil? ? '???' : first_name
    "#{last_name_part}, #{first_name_part}"
  end

end
