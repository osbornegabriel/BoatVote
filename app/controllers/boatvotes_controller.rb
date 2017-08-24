get '/boats/:boat_id/boatvotes/:vote_type/edit' do
  @boat = Boat.find(params[:boat_id])
  boatvote_type(params[:vote_type])
  erb :"boatvotes/_show_value", layout: false
end

get '/boats/:boat_id/boatvotes/:vote_type' do
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
  if request.xhr?
    params[:vote_type]
  else
    redirect "/boats/#{@boat.id + 1}"
  end
end



    # @boat = Boat.find_by(id: (@boat.id + 1))
    # @boat ||= Boat.find(1)
    # if logged_in?
    #  @boatvote = BoatVote.find_by(boat_id: @boat.id, voter_id: current_user.id)
    #  @boatvote_value = @boatvote.vote_value if @boatvote
    # end
    # erb :'boats/_show', layout: false