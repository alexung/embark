helpers do
  def current_user
    @current_user ||= User.find(session[:user_id])
  end

  def mapify(string)
    string.delete(",").gsub(/ /,"+")
  end

  def get_requests_for_driver(driver_id)
    # requests = []

    # all_trips = User.find(driver_id).driver_rides.map { |trip| trip[0] }
    # array_of_hashes = []
    hash_of_requests_for_trip = {}
    User.find(driver_id).driver_rides.each do |trip|
      arr = []
      trip.requests.each do |request|
        arr.push([request,User.find(request.requestor)])
      end
      hash_of_requests_for_trip[trip] = arr
    end

    # User.find(driver_id).driver_rides.each do |trip|
    #   trip.requests.each do |request|
    #     requests.push([trip, request, User.find(request.requestor)])
    #   end
    # end
    hash_of_requests_for_trip
  end

  def individual_request_for_driver(driver_id, ride_id)
    Ride.find(User.find(driver_id).driver_rides.find(ride_id))
  end

end
