class AddFieldsToProvinces < ActiveRecord::Migration[6.1]
  def change
    add_column :provinces, :latitude, :decimal,:precision => 9, :scale => 7
    add_column :provinces, :longitude, :decimal, :precision => 10, :scale => 7
    add_column :provinces, :placeholder_city, :string
    add_column :provinces, :placeholder_country, :string
    add_column :provinces, :mission_date, :string
    add_column :provinces, :vice_province_date, :string
    add_column :provinces, :province_date, :string
  end
end
