helpers do
  def boatvote_type(vote_value)
    case vote_value
    when "boat"
      @isboat = 'vote-value'
    when "maybeboat"
      @maybeboat = 'vote-value'
    when "notboat"
      @notboat = 'vote-value'
    end
  end

end