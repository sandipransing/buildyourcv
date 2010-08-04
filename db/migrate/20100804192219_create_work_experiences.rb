class CreateWorkExperiences < ActiveRecord::Migration
  def self.up
    create_table :work_experiences do |t|
      t.integer :user_id
      t.string :where
      t.text :summary
      t.date :from
      t.date :to
      t.string :title

      t.timestamps
    end
  end

  def self.down
    drop_table :work_experiences
  end
end
