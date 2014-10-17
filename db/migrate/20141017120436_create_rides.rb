class CreateRides < ActiveRecord::Migration
  def change
    create_table :rides do |t|
      t.integer :driver_id #do you have t.integer when aliasing?
      t.string :origin
      t.string :destination #is this string if we're using googlemaps API
      t.integer :seat_openings
      t.float :price

      t.timestamps
    end
  end
end
