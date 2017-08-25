get '/' do
 erb :'index'
end

get "/random" do
  authenticate!
  @random = RandomBoat.new
  @img_url = @random.random_boat
  erb :"random"
end