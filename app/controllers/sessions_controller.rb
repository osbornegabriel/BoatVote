get '/sessions/new' do
  erb :'sessions/new'
end

post '/sessions' do
  @boatwatcher = BoatWatcher.find_by(email: params[:email])
  if @boatwatcher && @boatwatcher.password == params[:password]
    session[:boatwatcher_id] = @boatwatcher.id
    redirect 'boatwatchers/show'
  else
    @error = "Ye be a fool!!! It's aye-ther be yer name or yarr email. Yull never get the truth from me"
    erb :'sessions/new'
  end
end

delete '/sessions' do
  session[:boatwatcher_id] = nil
  redirect '/'
end
