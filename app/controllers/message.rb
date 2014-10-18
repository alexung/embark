get '/message' do
  @all_requests = get_requests_for_driver(session[:user_id])
  erb :message
end

get '/message/:id' do
  #thinks it's pulling in user ID, but it SHOULD be pulling in message id
  @requested_route = Request.find(params[:id].to_i)
  @requested_info = individual_request_for_driver(session[:user_id], Request.find(params[:id]).requested_ride)
  @requestor = User.find(Request.find(params[:id]).requestor_id).name
  erb :individual_message
end

post '/message/:id' do
  #thinks it's pulling in user ID, but it SHOULD be pulling in message id
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
