Venue.create([{name: 'Starbucks'}, {name: 'Costa'}, {name: 'Delta Coffees'}])

Venue.first.tags.create(tag: 'not_serving', expires_in: 2147483647)
Venue.second.tags.create(tag: 'not_serving', expires_in: 180)
Venue.third.tags.create(tag: 'no_takeaway')