get "/ride" do
  @rides = Ride.all
  erb :ride_homepage
end

get '/message' do
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

get '/ride/:id' do
  @ride = Ride.find(params[:id])

  erb :ride
end



