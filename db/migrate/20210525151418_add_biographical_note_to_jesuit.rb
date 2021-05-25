class AddBiographicalNoteToJesuit < ActiveRecord::Migration[6.1]
  def change
    add_column :jesuits, :biographical_note, :text
  end
end
