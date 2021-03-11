class AddTextDateToDatePoint < ActiveRecord::Migration[6.1]
  def change
    add_column :date_points, :text, :string
  end
end
