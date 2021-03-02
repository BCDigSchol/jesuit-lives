class Jesuit < ApplicationRecord
  belongs_to :title, optional: true
  belongs_to :birth_date, class_name: "DatePoint", foreign_key: :birth_date_id, optional: true
  belongs_to :place_of_birth, class_name: "Place", foreign_key: :place_of_birth_id, optional: true
  belongs_to :entrance_date, class_name: "DatePoint", foreign_key: :entrance_date_id, optional: true
  belongs_to :entrance_date_2, class_name: "DatePoint", foreign_key: :entrance_date_2_id, optional: true
  belongs_to :entrance_province, class_name: "Province", foreign_key: :entrance_province_id, optional: true
  belongs_to :entrance_province_2, class_name: "Province", foreign_key: :entrance_province_2_id, optional: true
  belongs_to :status, optional: true
  belongs_to :vow_date, class_name: "DatePoint", foreign_key: :vow_date_id, optional: true
  belongs_to :death_date, class_name: "DatePoint", foreign_key: :death_date_id, optional: true

  after_save :index_record
  before_destroy :remove_from_index

  def index_record
    indexer = SolrIndexer::Indexer.new
    indexer.add(self)
    indexer.commit
  end

  def remove_from_index
    indexer = SolrIndexer::Indexer.new
    indexer.delete self
    indexer.commit
  end

end
