class CreateBoatvotes < ActiveRecord::Migration
  def change
    create_table :boatvotes do |t|
      t.integer :voter_id, null: false
      t.integer :boat_id, null: false
      t.boolean :vote, default: nil

      t.timestamps
    end
  end
end


# With line 6, (the vote), I'm going to experiment with a 3-value-logic. With SQL I read articles discussing UNKNOWN as a value in boolean table-rows. Many advise against this, others think it's the best thing ever. This might blow up in my face - let's find out!