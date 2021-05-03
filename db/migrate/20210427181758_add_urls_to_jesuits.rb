class AddUrlsToJesuits < ActiveRecord::Migration[6.1]
  def change
    add_column :jesuits, :portal_url, :text
    add_column :jesuits, :georgetown_url, :text
    add_column :jesuits, :web_resources, :text
  end
end
