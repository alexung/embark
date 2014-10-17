class CreatePassengerRides < ActiveRecord::Migration
  def change
    create_table :passenger_rides do |t|
      t.integer :passenger_id
      t.integer :ride_id

      t.timestamps
    end
  end
end
