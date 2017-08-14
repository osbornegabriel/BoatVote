get '/boatwatchers/new' do
  erb :'boatwatchers/new'
end

post '/boatwatchers' do
  @boatwatcher = BoatWatcher.new(params[:boatwatcher])
  if @boatwatcher.save
    session[:boatwatcher_id] = @boatwatcher.id
    redirect '/'
  else
    @errors = @boatwatcher.errors.full_messages
    erb :'boatwatchers/new'
  end
end