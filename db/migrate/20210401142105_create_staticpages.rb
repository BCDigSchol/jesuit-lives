class CreateStaticpages < ActiveRecord::Migration[6.1]
  def change
    create_table :staticpages do |t|
      t.text :title
      t.text :slug
      t.text :description
      t.integer :rank
      t.text :body
      t.text :blurb
      t.boolean :publish

      t.references :createdby
      t.references :modifiedby

      t.timestamps
    end
  end
end
