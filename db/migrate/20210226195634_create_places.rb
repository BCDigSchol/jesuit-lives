class CreatePlaces < ActiveRecord::Migration[6.1]
  def change
    create_table :places do |t|
      t.string :label
      t.float :latitude
      t.float :longitude
      t.text :description

      t.timestamps
    end
  end
end
