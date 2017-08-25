class RandomBoat
  include HTTParty
  base_uri "api.giphy.com"

  def initialize

  end

  def random_boat
    random_gif_object = self.class.get("/v1/gifs/random?api_key=#{ENV['GIPHY_API']}")
    random_gif_object["data"]["image_original_url"]
  end

end