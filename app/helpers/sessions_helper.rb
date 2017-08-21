helpers do

  def current_user
    @boatwatcher ||= BoatWatcher.find(session[:boatwatcher_id]) if session[:boatwatcher_id]
  end

  def logged_in?
    !!current_user
  end

  def authenticate!
    redirect '/session/new' unless logged_in?
  end

end