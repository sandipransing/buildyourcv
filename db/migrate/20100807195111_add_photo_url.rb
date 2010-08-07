class AddPhotoUrl < ActiveRecord::Migration
  def self.up
    add_column :users, :photo_url, :string
  end

  def self.down
  end
end
