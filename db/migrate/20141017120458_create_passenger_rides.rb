class CreatePassengerRides < ActiveRecord::Migration
  def change
    create_table :passenger_rides do |t|
      t.belongs_to :passenger
      t.belongs_to :ride

      t.timestamps
    end
  end
end
