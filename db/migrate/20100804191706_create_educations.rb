class CreateEducations < ActiveRecord::Migration
  def self.up
    create_table :educations do |t|
      t.integer :user_id
      t.integer :year
      t.string :where
      t.string :what
      t.string :grade

      t.timestamps
    end
  end

  def self.down
    drop_table :educations
  end
end
