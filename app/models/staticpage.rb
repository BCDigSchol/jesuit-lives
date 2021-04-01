class Staticpage < ApplicationRecord
    belongs_to :createdby, class_name: 'User'
    belongs_to :modifiedby, class_name: 'User'

    validates :title, presence: true
    validates :slug, presence: true, uniqueness: true
    validates :blurb, presence: true
end
