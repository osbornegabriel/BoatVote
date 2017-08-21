get '/boats/:id' do
  @boat = Boat.find_by(id: params[:id])
  @boat ||= Boat.find(1)
  if request.xhr?
    erb :'boats/_show', layout: false
  else
    erb :'boats/show'
  end
end