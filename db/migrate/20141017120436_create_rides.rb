class CreateRides < ActiveRecord::Migration
  def change
    create_table :rides do |t|
      t.belongs_to :driver #do you have t.integer when aliasing?
      t.string :origin
      t.string :destination #is this string if we're using googlemaps API
      t.integer :seat_openings
      t.integer :price
      t.datetime :start_time

      t.timestamps
    end
  end
end
