get '/' do
 erb :'index'
end

get "/random" do
  authenticate!
  @random = RandomBoat.new(name: "bleh", url: "blah")
  @img_url = @random.random_boat
  erb :"random"
end