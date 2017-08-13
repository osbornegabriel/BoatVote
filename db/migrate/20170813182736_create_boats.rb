class CreateBoats < ActiveRecord::Migration
  def change
    create_table :boats do |t|
      t.string :url, null: false
      t.integer :discoverer_id, null: false

      t.timestamps
    end
  end
end
