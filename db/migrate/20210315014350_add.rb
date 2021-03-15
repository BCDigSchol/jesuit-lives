class Add < ActiveRecord::Migration[6.1]
  def change
    add_reference :jesuits, :place_of_death,  foreign_key: { to_table: :places }
  end
end
