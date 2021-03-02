class CreateTitles < ActiveRecord::Migration[6.1]
  def change
    create_table :titles do |t|
      t.string :abbreviation
      t.string :label
      t.string :unabridged
      t.text :description

      t.timestamps
    end
  end
end
