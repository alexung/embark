# #As a user, I want to be able to signup
# User.create(name: 'Joe', username: 'e710476', password: 'password')
# User.create(name: 'requestor', username: 'rq3', password: 'password')
# driver = User.first
# rq = User.second

# #As a driver, I want to be able to create a ride
# Ride.create(driver: driver, origin: 'Los Angeles', destination:'Tokyo', seat_openings: 1, price: 25.00)

# #As a driver, I want to be able to update a ride
# driver.driver_rides.first.update(origin: 'San Diego')

# #As a driver, I want to be able to see all the accepted passengers for a particular ride I created
# driver.driver_rides.first.passengers

# #As a driver, I want to be able to see all users that have requested to be a part of a particular ride I created
# driver.driver_rides.first.requestors

# #As a driver, I want to be able to see all of the rides I have created
# driver.driver_rides

# #As a driver, I want to be able to accept a requestor to become a passenger of one of my rides
# PassengerRide.create(accepted_ride: Ride.first, passenger: rq)


# #As a passenger, I want to be able to be able to view all of the rides I have been accepted to
# rq.accepted_rides


# #As a requestor, I want to be able to make a request
# Request.create(requested_ride: Ride.first, requestor: rq, description: 'im not a weirdo')

# #As a requestor, I want to be able to be able to view all of the requests I have sent
# rq.requests

# #As a requestor, I want to be able to view all of the rides I have sent requests to
# rq.requested_rides


# #As a user, I want to be able to view all of the rides for a particular city
# Ride.where(origin: 'San Diego')

# ------ Zack's work below ---------
#require 'faker'


cities =
["New York, New York",
"Los Angeles, California",
"Chicago, Illinois",
"Houston, Texas",
"Philadelphia, Pennsylvania",
"Phoenix, Arizona",
"San Diego, California",
"San Antonio, Texas",
"Dallas, Texas",
"Detroit, Michigan",
"San Jose, California",
"Indianapolis, Indiana",
"Jacksonville, Florida",
"San Francisco, California",
"Columbus, Ohio",
"Austin, Texas",
"Memphis, Tennessee",
"Baltimore, Maryland",
"Charlotte, North Carolina",
"Fort Worth, Texas",
"Boston, Massachusetts",
"Milwaukee, Wisconsin",
"El Paso, Texas",
"Washington, District of Columbia",
"Nashville-Davidson, Tennessee",
"Seattle, Washington",
"Denver, Colorado",
"Las Vegas, Nevada",
"Portland, Oregon",
"Oklahoma City, Oklahoma",
"Tucson, Arizona",
"Albuquerque, New Mexico",
"Atlanta, Georgia",
"Long Beach, California",
"Kansas City, Missouri",
"Fresno, California",
"New Orleans, Louisiana",
"Cleveland, Ohio",
"Sacramento, California",
"Mesa, Arizona",
"Virginia Beach, Virginia",
"Omaha, Nebraska",
"Colorado Springs, Colorado",
"Oakland, California",
"Miami, Florida",
"Tulsa, Oklahoma",
"Minneapolis, Minnesota",
"Honolulu, Hawaii",
"Arlington, Texas",
"Wichita, Kansas",
"St. Louis, Missouri",
"Raleigh, North Carolina",
"Santa Ana, California",
"Cincinnati, Ohio",
"Anaheim, California",
"Tampa, Florida",
"Toledo, Ohio",
"Pittsburgh, Pennsylvania",
"Aurora, Colorado",
"Bakersfield, California",
"Riverside, California",
"Stockton, California",
"Corpus Christi, Texas",
"Lexington-Fayette, Kentucky",
"Buffalo, New York",
"St. Paul, Minnesota",
"Anchorage, Alaska",
"Newark, New Jersey",
"Plano, Texas",
"Fort Wayne, Indiana",
"St. Petersburg, Florida",
"Glendale, Arizona",
"Lincoln, Nebraska",
"Norfolk, Virginia",
"Jersey City, New Jersey",
"Greensboro, North Carolina",
"Chandler, Arizona",
"Birmingham, Alabama",
"Henderson, Nevada",
"Scottsdale, Arizona",
"North Hempstead, New York",
"Madison, Wisconsin",
"Hialeah, Florida",
"Baton Rouge, Louisiana",
"Chesapeake, Virginia",
"Orlando, Florida",
"Lubbock, Texas",
"Garland, Texas",
"Akron, Ohio",
"Rochester, New York",
"Chula Vista, California",
"Reno, Nevada",
"Laredo, Texas",
"Durham, North Carolina",
"Modesto, California",
"Huntington, New York",
"Montgomery, Alabama",
"Boise, Idaho",
"Arlington, Virginia",
"San Bernardino, California"]
users=[]
rides = []
passenger_rides = []
requests = []

25.times do
  fn = Faker::Name.first_name
  ln = Faker::Name.last_name
  n = fn+" "+ln
  ln = (fn[0]+ln).downcase
  user_hash = {name: n,username:ln,password_digest:ln}
  # users.push(user_hash)
  User.create(user_hash)
end


25.times {
  two_cities = cities.sample(2)
  ride_hash = {
                 origin: two_cities[1],
                 destination: two_cities[0],
                 driver_id: 1+rand(40),
                 seat_openings: 1+rand(4),
                 price: 1000+rand(9000),
                 start_time: DateTime.new(2014,11+rand(2),1+rand(30),rand(24))
                 }
  Ride.create(ride_hash)
  # rides.push(ride_hash)
}

25.times {
  passenger_ride_hash = {passenger_id: 1+rand(25),accepted_ride_id: 1+rand(25)}
  PassengerRide.create(passenger_ride_hash)
  # passenger_rides.push(passenger_ride_hash)
}

25.times {
  request_hash = {requestor_id: 1+rand(25),requested_ride_id: 1+rand(25),description: ["Not a weirdo!","Need a lift, bro"].sample}
  Request.create(request_hash)
  # requests.push(request_ride_hash)
}

# p users
# p rides
# p passenger_rides
# p requests

