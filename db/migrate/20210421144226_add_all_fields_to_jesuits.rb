class AddAllFieldsToJesuits < ActiveRecord::Migration[6.1]
  def change
    add_reference :jesuits, :ordination_date, null: true, foreign_key: {to_table: :date_points}
    add_column :jesuits, :alt_last_name, :string
    add_column :jesuits, :add_last_name_info, :text
    add_column :jesuits, :alt_first_name, :string
    add_column :jesuits, :add_first_name_info, :text
    add_reference :jesuits, :alt_birth_date, null: true, foreign_key: {to_table: :date_points}
    add_column :jesuits, :add_birth_date_info, :text
    add_reference :jesuits, :alt_place_of_birth, null: true, foreign_key: {to_table: :places}
    add_column :jesuits, :add_place_of_birth_info, :text
    add_reference :jesuits, :alt_entrance_date_i1, null: true, foreign_key: {to_table: :date_points}
    add_column :jesuits, :add_entrance_date_i1_info, :text
    add_reference :jesuits, :alt_entrance_date_i2, null: true, foreign_key: {to_table: :date_points}
    add_column :jesuits, :add_entrance_date_i2_info, :text
    add_column :jesuits, :add_entrance_place_info_i1, :text
    add_column :jesuits, :add_entrance_place_info_i2, :text
    add_reference :jesuits, :alt_final_vow_date, null: true, foreign_key: {to_table: :date_points}
    add_column :jesuits, :add_final_vow_date_info, :text
    add_column :jesuits, :add_status_info, :text
    add_reference :jesuits, :alt_death_date, null: true, foreign_key: {to_table: :date_points}
    add_column :jesuits, :add_death_date_info, :text
    add_reference :jesuits, :alt_place_of_death, null: true, foreign_key: {to_table: :places}
    add_column :jesuits, :add_place_of_death_info, :text
  end
end
