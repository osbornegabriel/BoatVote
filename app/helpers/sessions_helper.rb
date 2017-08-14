helpers do

  def current_user
    @boatwatcher ||= Boatwatcher.find(params[:boatwatcher_id]) if params[:boatwatcher_id]
  end

  def logged_in?
    !!current_user
  end

end