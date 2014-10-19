get '/testvideo' do
  erb :testvideo
end

get "/ride" do
  @rides = Ride.all
  erb :ride_homepage
end

get '/ride/new' do
  erb :new_ride
end

post '/ride/new' do
  @ride = params[:ride]
  Ride.create(@ride)
  redirect '/ride'
end

get '/ride/success' do
  erb :ride_requested
end

post '/ride/success' do
  Request.create(requestor_id: session[:user_id], requested_ride_id: params[:id], description: params[:description])
  redirect '/ride/success'
end

get '/ride/:id' do
  @ride = Ride.find(params[:id])
  @driver = User.find(@ride.driver_id)
  @driver_rides_count = @driver.driver_rides.count
  erb :ride
end
