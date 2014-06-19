lawrence = User.create(first_name: "Lawrence", last_name: "Manfredi", email: "lrmanfre@me.com", password: "123")
jane = User.create(first_name: "Jane", last_name: "Manfredi", email: "j@me.com", password: "123")

bos = Location.create(name: "Boston, MA", latitude: 42.3584308, longitude: -71.0597732)
pvd = Location.create(name: "Providence, RI", latitude: 41.8239891, longitude: -71.4128343)
hrt = Location.create(name: "Hartford, CT", latitude: 41.76371109999999, longitude: -72.6850932)
nyc = Location.create(name: "New York, NY", latitude: 40.7127837, longitude: -74.0059413)
ac = Location.create(name: "Atlantic City, NJ", latitude: 39.3642834, longitude: -74.4229266)
buf = Location.create(name: "Buffalo, NY", latitude: 42.81152174509788, longitude: -78.85608673095703)
pit = Location.create(name: "Pittsburgh, PA", latitude: 40.44062479999999, longitude: -79.9958864)

new_eng = Trip.create(title: "New England Summer Getaway", user: lawrence)
bb = Trip.create(title: "Bread Basket Tour", user: jane)

LocationPin.create(trip: new_eng, location: hrt)
LocationPin.create(trip: new_eng, location: pvd)
LocationPin.create(trip: new_eng, location: bos)
LocationPin.create(trip: new_eng, location: buf)
LocationPin.create(trip: new_eng, location: pit)


LocationPin.create(trip: bb, location: ac)
LocationPin.create(trip: bb, location: nyc)

Post.create(title: "First post in Hartford, CT", body: "Hartford has a lot of buses. I like travelling through Hartford, but I don't really want to stay here. It is considered the insurance capital of America. A good amount of buildings too.", location_pin_id: 1)
Post.create(title: "Second post in Hartford", body: "I grow weary of this subdued and altogether bougeois city. I fear there is little left here for my enjoyment. It is as if all the color has been removed from my environs, and I am but a cardboard replica of my former self.", location_pin_id: 1)
Post.create(title: "3rd post from Hartford", body: "Today is the day I depart this city. I could not be more happy.", location_pin_id: 1)
Post.create(title: "Posting from Providence, RI!", body: "Dear Diary, I find myself refreshed by the sea and by both the friendliness of the inhabitants and the familiarity of my surroundings. I desire a longer respite here so that I might acquaint myself with the charming sea-side village of Newport. Ahh, but time passes like sands through the hourglass...", location_pin_id: 2)
Post.create(title: "Red Bud City", body: "Picture the scene, the flaring fire, the leaping sparks, up
into the dark night - Buffalo-chip leaning back, smoking, his
long pipe resting on the ground", location_pin_id: 4)
Post.create(title: "Something with Gray", body: " Tomorrow we will get to Spotted Tail without further storm.", location_pin_id: 5)



