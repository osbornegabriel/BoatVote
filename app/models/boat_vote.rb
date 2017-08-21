class BoatVote < ActiveRecord::Base
  # Remember to create a migration!
  belongs_to :voter, class_name: "BoatWatcher", foreign_key: :voter_id
  belongs_to :boat

  validates_presence_of :voter_id, :boat_id

  def vote_value
    if self.vote == 1
      "is-boat"
    elsif self.vote == 0
      "maybe-boat"
    else
      "not-boat"
    end
  end
end
