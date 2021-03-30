class CreateRoles < ActiveRecord::Migration[6.1]
  def change
    create_table :roles do |t|
      t.string :name
      t.string :description

      t.timestamps
    end

    add_column :users, :role_id, :integer
    add_column :users, :name, :string
    add_index :users, :role_id
  end
end
