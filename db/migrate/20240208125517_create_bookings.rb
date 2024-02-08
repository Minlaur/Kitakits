class CreateBookings < ActiveRecord::Migration[7.0]
  def change
    create_table :bookings do |t|
      t.references :topic, null: false, foreign_key: true
      t.datetime :time
      t.references :availability, null: false, foreign_key: true
      t.integer :status

      t.timestamps
    end
  end
end
