require 'bcrypt'

class BoatWatcher < ActiveRecord::Base
  include BCrypt
  attr_accessor :inputted_password
  # Remember to create a migration!
  has_many :boat_votes
  has_many :discovered_boats, class_name: Boat, foreign_key: :discoverer
  has_many :voters, through: :discovered_boats

  validates :username, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true
  validates :inputted_password

  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    inputted_password = new_password
    @password = Password.create(new_password)
    self.password_hash = @password
  end
end
