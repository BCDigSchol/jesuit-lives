# Add truly unique ID used for linking to records. The Jesuit Online Necrology ID (e.g. 3.015)
# is not unique.
class AddLinkingIdToJesuits < ActiveRecord::Migration[6.1]
  def change
    add_column :jesuits, :linking_id, :integer
    add_index :jesuits, :linking_id, unique: true
  end
end
