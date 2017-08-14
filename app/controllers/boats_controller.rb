get '/boats/:id' do
  @boat = Boat.find_by(id: params[:id])
  @boat ||= Boat.find(1)
  erb :'boats/show'
end