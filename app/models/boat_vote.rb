class BoatVote < ActiveRecord::Base
  # Remember to create a migration!
  belongs_to :voter, class_name: "BoatWatcher", foreign_key: :voter_id
  belongs_to :boat
end
