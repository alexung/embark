helpers do
  def current_user
    @current_user ||= User.find(session[:user_id])
  end

  def mapify(string)
    string.delete(",").gsub(/ /,"+")
  end

  def get_requests_for_driver(driver_id)
    requests = []
    User.find(driver_id).driver_rides.each do |trip|
      trip.requests.each do |request|
        requests.push([trip, request, User.find(request.requestor)])
      end
    end
    requests
  end

end
