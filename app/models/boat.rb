class Boat < ActiveRecord::Base
  # Remember to create a migration!
  belongs_to :discoverer, class_name: BoatWatcher
  has_many :boat_votes
  has_many :voters, through: :boat_votes, source: :voter

  validates_presence_of :url, :discoverer_id


end
