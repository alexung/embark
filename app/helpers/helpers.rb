helpers do
  def current_user
    @current_user ||= User.find(session[:user_id])
  end
  def mapify(string)
    string.delete(",").gsub(/ /,"+")
  end

end
