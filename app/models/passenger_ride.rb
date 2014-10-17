class PassengerRide < ActiveRecord::Base
  belongs_to :accepted_ride, class_name: "Ride"
  belongs_to :passenger, class_name: "User"
end
