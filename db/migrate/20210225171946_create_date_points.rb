class CreateDatePoints < ActiveRecord::Migration[6.1]
  def up
    execute <<-SQL
      CREATE TYPE precisions AS ENUM ('day', 'month', 'year');
    SQL

    create_table :date_points do |t|
      t.date :date
      t.timestamps
    end
    add_column :date_points, :precision, :precisions

  end

  def down
    drop_table :date_points
    execute <<-SQL
            DROP TYPE precisions;
    SQL
  end
end
