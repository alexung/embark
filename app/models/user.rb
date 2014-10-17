class User < ActiveRecord::Base
  has_many :driver_rides, class_name: "Ride", foreign_key: :driver_id
  has_many :passenger_rides, foreign_key: :passenger_id
  has_many :rides, through: :passenger_rides
  has_many :requests
  has_many :rides, through: :requests

  def self.authenticate(username, password)
    user = User.find_by(username: username)
    return user.authenticate(password) unless user == nil
    nil
  end

end
