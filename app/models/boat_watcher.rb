class BoatWatcher < ActiveRecord::Base
  # Remember to create a migration!
  has_many :boat_votes
  has_many :discovered_boats, class_name: Boat, foreign_key: :discoverer
  has_many :voters, through: :discovered_boats
end
