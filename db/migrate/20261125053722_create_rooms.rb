class CreateRooms < ActiveRecord::Migration[7.1]
  def change
    create_table :rooms do |t|
      t.string :name, null: false
      t.integer :capacity, null: false
      t.integer :price_per_30min, null: false, default: 0

      t.timestamps
    end
  end
end
