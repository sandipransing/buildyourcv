class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.string :name
      t.string :tagline
      t.string :email
      t.string :mobile
      t.string :languages
      t.text :summary
      t.string :address
      t.string :landmark
      t.string :education
      t.string :website
      t.string :company
      t.string :designation
      t.string :areas_of_speciality
      t.date :birth_date
      t.string :nationality
      t.text :interests

      t.timestamps
    end
  end

  def self.down
    drop_table :users
  end
end
