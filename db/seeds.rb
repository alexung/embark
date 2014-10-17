#As a user, I want to be able to signup
User.create(name: 'Joe', username: 'e710476', password: 'password')
User.create(name: 'requestor', username: 'rq3', password: 'password')
driver = User.first
rq = User.second

#As a driver, I want to be able to create a ride
Ride.create(driver: driver, origin: 'Los Angeles', destination:'Tokyo', seat_openings: 1, price: 25.00)

#As a driver, I want to be able to update a ride
driver.driver_rides.first.update(origin: 'San Diego')

#As a driver, I want to be able to see all the accepted passengers for a particular ride I created
driver.driver_rides.first.passengers

#As a driver, I want to be able to see all users that have requested to be a part of a particular ride I created
driver.driver_rides.first.requestors

#As a driver, I want to be able to see all of the rides I have created
driver.driver_rides

#As a driver, I want to be able to accept a requestor to become a passenger of one of my rides
PassengerRide.create(accepted_ride: Ride.first, passenger: rq)


#As a passenger, I want to be able to be able to view all of the rides I have been accepted to
rq.accepted_rides


#As a requestor, I want to be able to make a request
Request.create(requested_ride: Ride.first, requestor: rq, description: 'im not a weirdo')

#As a requestor, I want to be able to be able to view all of the requests I have sent
rq.requests

#As a requestor, I want to be able to view all of the rides I have sent requests to
rq.requested_rides


#As a user, I want to be able to view all of the rides for a particular city
Ride.where(origin: 'San Diego')
