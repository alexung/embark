class Request < ActiveRecord::Base
  # belongs_to :ride
  belongs_to :requested_ride, class_name: "Ride"
  belongs_to :requestor, class_name: "User"
end
