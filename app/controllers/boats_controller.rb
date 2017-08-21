get '/boats/:id' do
  @boat = Boat.find_by(id: params[:id])
  @boat ||= Boat.find(1)
  if logged_in?
   @boatvote = @boatvote = BoatVote.find_by(boat_id: @boat.id, voter_id: current_user.id)
  end
  if request.xhr?
    erb :'boats/_show', layout: false
  else
    erb :'boats/show'
  end
end