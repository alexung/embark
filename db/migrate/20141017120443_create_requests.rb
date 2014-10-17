class CreateRequests < ActiveRecord::Migration
  def change
    create_table :requests do |t|
      t.belongs_to :ride
      t.belongs_to :requestor
      t.text :description

      t.timestamps
    end
  end
end
