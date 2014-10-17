class Ride < ActiveRecord::Base
  belongs_to :driver, class_name: :user
  has_many :passengers, through: :passenger_rides
  has_many :requests
  has_many :passenger_rides
end
