class Ride < ActiveRecord::Base
  belongs_to :driver, class_name: "User"

  has_many :passenger_rides, foreign_key: :accepted_ride_id
  has_many :passengers, through: :passenger_rides

  has_many :requests, foreign_key: :requested_ride_id
  has_many :requestors, through: :requests

  def remove_seat
    seat_count = self.seat_openings
    self.update(seat_openings: seat_count - 1)
  end
end
