get '/boats/:boat_id/votes/:vote_type' do
  authenticate!
  @boat = Boat.find(params[:boat_id])
  @boatvote = BoatVote.find_by(boat_id: @boat.id, voter_id: current_user.id)

  case params[:vote_type]
  when "boat"
    if !@boatvote
      @boat.boat_votes << BoatVote.new(voter_id: current_user.id, vote: 1)
      @boat.save
    else
      @boatvote.update_attribute("vote", 1)
    end
  when "maybeboat"
    if !@boatvote
      @boat.boat_votes << BoatVote.new(voter_id: current_user.id, vote: 0)
      @boat.save
    else
      @boatvote.update_attribute("vote", 0)
    end
  when "notboat"
    if !@boatvote
      @boat.boat_votes << BoatVote.new(voter_id: current_user.id, vote: -1)
      @boat.save
    else
      @boatvote.update_attribute("vote", -1)
    end
  end

end