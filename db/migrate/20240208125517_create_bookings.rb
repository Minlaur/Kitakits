class CreateBookings < ActiveRecord::Migration[7.0]
  def change
    create_table :bookings do |t|
      t.references :topic, null: false, foreign_key: true
      t.datetime :time
      t.integer :status

      t.timestamps
    end
  end
end
