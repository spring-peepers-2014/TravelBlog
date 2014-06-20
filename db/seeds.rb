xine = User.create(email: "christine.feaster@gmail.com", password: "goslow", password_confirmation: "goslow")
demo = User.create(email: "demo@email.com", password: "password", password_confirmation: "password")

users = [xine, demo]

west_coast = xine.trips.create(title: "Surfing the West Coast")
pnw_coffee = xine.trips.create(title: "Pacific Northwest Coffee Tour")
trip_to_dbc = xine.trips.create(title: "Dev Bootcamp NYC")

demo_west_coast = demo.trips.create(title: "Surfing the West Coast")
demo_pnw_coffee = demo.trips.create(title: "Pacific Northwest Coffee Tour")
demo_trip_to_dbc = demo.trips.create(title: "Dev Bootcamp NYC")

def get_location(city_state)
  location = Geocoder.search(city_state).first
  full_location_name = location.formatted_address.split(', ')
  location_name = "#{full_location_name[0]}, #{location.state_code}"
  { name: location_name, coords: { lat: location.coordinates[0], lon: location.coordinates[1] } }
end


trip_to_dbc_waypoints =
["San Francisco, CA",
  "Sacramento, CA",
  "Reno, NV",
  "Salt Lake City, UT",
  "Evanston, WY",
  "Little America, WY",
  "Denver, CO",
  "Oklahoma City, OK",
  "Dallas, TX",
  "New Orleans, LA",
  "Birmingham, AL",
  "Atlanta, GA",
  "Harrisburg, PA",
  "Hoboken, NJ",
  "Brooklyn, NY",
  "Manhattan, NY"]

  trip_to_dbc_waypoints.each do |waypoint|
    location_data = get_location(waypoint)
    location = Location.create(name: location_data[:name], latitude: location_data[:coords][:lat], longitude: location_data[:coords][:lon])
    trip_to_dbc.location_pins.create(location: location)
    demo_trip_to_dbc.location_pins.create(location: location)
end

sf_ca_pin = LocationPin.where(location: Location.where(name: "San Francisco, CA").first, trip: trip_to_dbc).first
sf_ca_pin.posts.create(title: "Saying Goodbye", body: "I had a small party to say goodbye to friends and family before I pack up my apt to head to New York City for Dev Bootcamp. I'm scared and a little sad to pull up my roots and move so far from my network of support, but all things good and bad don't last. I'm excited for the road ahead.")

hb_nj_pin = LocationPin.where(location: Location.where(name: "Hoboken, NJ").first, trip: trip_to_dbc).first
hb_nj_pin.posts.create(title: "Almost in New York and I could use a break", body: "I can believe I made it all the way to the East Coast. What an adventure!")
hb_nj_pin.posts.create(title: "Holy Cannoli!", body: "I visited Carlo's Bakery today and had some of their famous cannolis. Mm, desserts done right. With fresh ingredients and the right process you can get some flavorful desserts that aren't masked by excessive butter and sugar. Simply delicious.")


bk_ny_pin = LocationPin.where(location: Location.where(name: "Brooklyn, NY").first, trip: trip_to_dbc).first
bk_ny_pin.posts.create(title: "Just arrived at my new apt", body: "March 2, 2014\nSo, I'm finally living in New York City. One more adventure to cross off my bucket list. The pace is so different out here. I thought coming from a big city like San Francisco would prepare me for this, but I'm still coping with serious culture shock.")
bk_ny_pin.posts.create(title: "Di Fara, best pizza ever", body: "I was not much of a pizza fan until I had a heavenly slice of Di Fara's margherita pizza on my first trip to New York in 2011. Life is too short to waste time on dieting.")
bk_ny_pin.posts.create(title: "Can't sleep", body: "Living above a bar in an up and coming neighborhood with a bedroom window that faces the street is not conducive to sleep. I couldn't sleep well when I arrived because I was still adjusting to the time zone change, but now I can't sleep because drunk people don't know how to use indoor voices between 11 p.m. and 4:30 a.m. Good grief, this is going to be a long 9 weeks.")

mtn_ny_pin = LocationPin.where(location: Location.where(name: "Manhattan, NY").first, trip: trip_to_dbc).first
mtn_ny_pin.posts.create(title: "First day at DBC", body: "Where did all the time go? Today was orientation day. I'm nervous and excited and exhausted. I had some fun ice breakers, some not so fun popcorn pairing sessions, and I crammed algorithm logic into my brain until I felt like my head would explode.")
mtn_ny_pin.posts.create(title: "New cohorts are rolling in!", body: "After having the space mostly to myself for the past three weeks, I'm now a big sister to a new cohort. I gave a lightning talk on what to do when they get stuck and can't find an answer after a quick Google search, namely how to ask effective questions in online forums, and of peers and instructors. I'm really excited to have the space fill out with more bright passionate people.")
mtn_ny_pin.posts.create(title: "What we're doing at DBC is insane - I love it!", body: "An instructor told us today that it took him a year to learn what we're about to cram into 3 weeks, and years after that to get good at it. He is floored by our dedication and ability to learn at such a rapid pace. Three weeks ago I could never have wrapped my mind around being as skilled as I am now by this point. It's insane!")
mtn_ny_pin.posts.create(title: "Graduation is almost upon us", body: "My learning at DBC has been exponential. I learned more in Phase 1 than in months of self-study. In Phase 2, I learned more about technologies, methodologies, frameworks, and design patterns than my CS graduate friends have even heard of. In Phase 3, by working on a full-featured app through the entire product life cycle, embracing agile development methodologies, I have a deeper and more meaningful connection with everything that I've learned in my cumulative time spent here.")

