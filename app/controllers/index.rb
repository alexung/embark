get '/' do
  @recent_rides = Ride.last(5).reverse
  erb :index
end
