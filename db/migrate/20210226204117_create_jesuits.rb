class CreateJesuits < ActiveRecord::Migration[6.1]
  def change
    create_table :jesuits do |t|
      t.string :jl_id, null: false, index: { unique: true }
      t.references :title, null: true, foreign_key: true
      t.string :last_name, null: true
      t.string :first_name_abbrev, null: true
      t.string :first_name, null: true
      t.references :birth_date, references: :date_points, null: true, foreign_key: { to_table: :date_points }
      t.references :place_of_birth, references: :places, null: true, foreign_key: { to_table: :places }
      t.references :entrance_date, references: :date_points, null: true, foreign_key: { to_table: :date_points }
      t.references :entrance_date_2, references: :date_points, null: true, foreign_key: { to_table: :date_points }
      t.references :entrance_province, references: :provinces, null: true, foreign_key: { to_table: :provinces }
      t.references :entrance_province_2, references: :provinces, null: true, foreign_key: { to_table: :provinces }
      t.references :status, null: true, foreign_key: true
      t.references :vow_date, references: :date_points, null: true, foreign_key: { to_table: :date_points }
      t.references :death_date, references: :date_points, null: true, foreign_key: { to_table: :date_points }

      t.timestamps

      t.index :last_name
    end
  end
end
