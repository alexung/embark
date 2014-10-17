class Ride < ActiveRecord::Base
  belongs_to :driver, class_name: "User", foreign_key: :user_id
  has_many :passengers, through: :passenger_rides, class_name: "User"
  has_many :requests
  has_many :passenger_rides
end
