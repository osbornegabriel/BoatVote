require "faker"

# bw1 = BoatWatcher.new(username: 'Boatchami_Mucho', email: 'boat@email.com', password: 'password')
bw1.save
bw2 = BoatWatcher.new(username: "Boats n' Boas", email: 'boats@email.com', password: 'password')
bw2.save
bw3 = BoatWatcher.new(username: 'Boatmagedon2012', email: 'boatmagedon@email.com', password: 'password')
bw3.save
bw4 = BoatWatcher.new(username: 'NotABoat!!!', email: 'naysay@email.com', password: 'password')
bw4.save
bw5 = BoatWatcher.new(username: 'Beach & Pong', email: 'bp@email.com', password: 'password')
bw5.save

Boat.find_or_create_by(url: "http://lucidyacht.com/wp-content/uploads/2011/04/funny-boating-pic2.jpg", discoverer_id: 1)
Boat.find_or_create_by(url: "http://stuffonmymutt.com/wp-content/uploads/2012/05/SOMM_6.jpg", discoverer_id: 1)
Boat.find_or_create_by(url: "https://i.ytimg.com/vi/m1geDcGfbBk/hqdefault.jpg", discoverer_id: 3)
Boat.find_or_create_by(url: "http://funnystack.com/wp-content/uploads/2015/07/Funny-Boat-29.jpg", discoverer_id: 5)
Boat.find_or_create_by(url: "http://funnystack.com/wp-content/uploads/2015/07/Funny-Boat-56.jpg", discoverer_id: 2)
Boat.find_or_create_by(url: "http://www.thehulltruth.com/attachment.php?attachmentid=187238&stc=1&d=1313271156",discoverer_id: 2)
Boat.find_or_create_by(url: "http://1funny.com/wp-content/uploads/2012/01/goat-boat.jpg", discoverer_id: 1)
Boat.find_or_create_by(url: "http://orig13.deviantart.net/3080/f/2010/347/9/e/goat_in_a_boat_by_danpagan-d34tz8w.jpg",discoverer_id: 1)
Boat.find_or_create_by(url: "http://www.whereoware.com/blog/wp-content/uploads/Puppy-in-Boat2.png",discoverer_id: 1)
Boat.find_or_create_by(url: "http://www.indya101.com/funnypictures/People/2012/10/18/funniest_guitar_2012_fgnez_Indya101(dot)com.jpg",discoverer_id: 1)

# x.boat_votes << BoatVote.new(boat_id: 1, vote: true)

# Boat.all.length.times do |i|
#   bw4.boat_votes << BoatVote.create(boat_id: i, vote: true)
#   bw4.save
# end

def random_boolean
  [true, false].sample
end

Boat.all.each do |boat|
  bw4.boat_votes.create(boat: boat, vote: false)
end

Boat.all.each do |boat|
  bw2.boat_votes.create(boat: boat, vote: true)
end

Boat.all.each do |boat|
  bw5.boat_votes.create(boat: boat, vote: random_boolean)
end

Boat.all.each do |boat|
  bw1.boat_votes.create(boat: boat)
end

Boat.all.each do |boat|
  bw3.boat_votes.create(boat: boat, vote: random_boolean)
end
