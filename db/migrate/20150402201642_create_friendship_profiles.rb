class CreateFriendshipProfiles < ActiveRecord::Migration
  def change
    create_table :friendship_profiles do |t|
      t.belongs_to :friendship, index: true
      t.string :meeting_location
      t.float :meeting_latitude
      t.float :meeting_longitude

      t.timestamps null: false
    end
    add_foreign_key :friendship_profiles, :friendships
  end
end
