get '/session' do
  erb :'users/login'
end

post '/session' do
  user = User.authenticate(params[:username], params[:password])

  if user == nil || user == false
    session[:error] = "Login failed"
    redirect "/session"
  else
    session[:user_id] = user.id
    redirect "/ride"
  end

end

get '/user' do
  erb :'users/create_user'
end

post '/user' do
  user = User.new(params[:user])
  if user.valid?
    user.save
    redirect "/session"
  else
    redirect "/user"
  end

end


get '/logout' do
  redirect '/'
end
