
get '/session' do
  erb :'users/login'
end

post '/session' do
  user = User.find_by(username: params[:username])

 if user.nil?
   session[:error] = "Login failed"
    redirect "/session"
  end

  user = user.authenticate(params[:password]) #the real deal. when false, it returns false. When true, returns user object

  if user
    session[:user_id] = user.id
    redirect "/ride"
  else
    session[:error] = "Login failed"
    redirect "/session"
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
  session.clear
  redirect '/'
end
