class User < ActiveRecord::Base
  has_many :driver_rides, class_name: "Rides", foreign_key: :driver_id
  has_many :passenger_rides, foreign_key: :passenger_id
  has_many :rides, through: :passenger_rides
  has_many :requests
end
