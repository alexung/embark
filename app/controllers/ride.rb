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

get '/message/:id' do
  @request = Request.find(params[:id])
  erb :individual_message
end

get '/ride/:id' do
  @ride = Ride.find(params[:id])
  erb :ride
end









