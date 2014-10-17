class User < ActiveRecord::Base
  has_many :driver_rides, class_name: "Ride", foreign_key: :driver_id

  has_many :passenger_rides, foreign_key: :passenger_id
  has_many :accepted_rides, through: :passenger_rides

  has_many :requests, foreign_key: :requestor_id
  has_many :requested_rides, through: :requests

  has_secure_password
end
