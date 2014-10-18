get "/ride" do
  @rides = Ride.all
  erb :ride_homepage
end

get '/message' do
  @all_requests = get_requests_for_driver(session[:user_id]);

  erb :message
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
  erb :ride
end

get '/message/:id' do
  # binding.pry
  @requested_route = Request.find(params[:id].to_i)
  # binding.pry
  p "*"*30
  p params[:id].to_i #=> 6
  p "*"*30
  # @user = User.find(session[:user_id])
  erb :individual_message
end

post '/message/:id' do
  passenger_request = Request.find(params[:id])
  requestor = passenger_request.requestor
  if params[:accept]
    ride = Ride.find(passenger_request.requested_ride)
    PassengerRide.create(passenger: requestor, accepted_ride: passenger_request.requested_ride)
    ride.remove_seat
    redirect '/ride'
  else
    redirect '/ride'
  end

end
