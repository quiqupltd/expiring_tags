Venue.create([{name: 'Starbucks'}, {name: 'Costa'}, {name: 'Delta Coffees'}])

Venue.first.tags.create(name: 'not_serving', expires_in: 2147483647)
Venue.second.tags.create(name: 'not_serving', expires_in: 180)
Venue.third.tags.create(name: 'no_takeaway')