get '/' do
  erb :index
end

get '/session' do
  erb :'users/login'
end

get '/user' do
  erb :'users/create_user'
end

get '/message' do
  erb :message
end

get '/ride/new' do
  erb :new_ride
end

get '/logout' do
  redirect '/'
end
