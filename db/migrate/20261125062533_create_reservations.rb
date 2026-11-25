class CreateReservations < ActiveRecord::Migration[7.1]
  def change
    create_table :reservations do |t|
      t.integer :people, null: false
      t.datetime :start_at
      t.datetime :end_at
      t.integer :room_id
      t.integer :user_id
      t.integer :status, null: false, default: 0

      t.timestamps
    end
  end
end
