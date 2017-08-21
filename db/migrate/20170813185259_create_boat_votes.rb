class CreateBoatVotes < ActiveRecord::Migration
  def change
    create_table :boat_votes do |t|
      t.integer :voter_id, null: false
      t.integer :boat_id, null: false
      t.integer :vote, default: 0

      t.timestamps
    end
  end
end