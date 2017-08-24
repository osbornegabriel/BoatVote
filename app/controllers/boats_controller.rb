get '/boats/:id' do
  erb :"boats/no_boats" unless Boat.all.reduce(:+) != nil
  @boat = Boat.find_by(id: params[:id])
  @boat ||= Boat.find(1)
  if logged_in?
   @boatvote = BoatVote.find_by(boat_id: @boat.id, voter_id: current_user.id)
   @boatvote_value = @boatvote.vote_value if @boatvote
  end
  if request.xhr?
    erb :'boats/_show', layout: false
  else
    erb :'boats/show'
  end
end