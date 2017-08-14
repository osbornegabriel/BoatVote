class CreateBoatWatchers < ActiveRecord::Migration
  def change
    create_table :boat_watchers do |t|
      t.string :username, null: false
      t.string :email, null: false, unique: true
      t.string :password_hash, null: false

      t.timestamps
    end
  end
end
