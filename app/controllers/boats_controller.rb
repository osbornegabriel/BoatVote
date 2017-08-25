get "/boats/no_boats" do
  erb :"boats/no_boats"
end

post '/boats' do
  authenticate!
  @boat = Boat.new(url: params[:url], discoverer_id: current_user.id)
  if @boat.save
    redirect "/boats/#{@boat.id}"
  else
    redirect "/random"
  end
end

get '/boats/:id' do
  redirect "/boats/no_boats" unless Boat.all.length != 0
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