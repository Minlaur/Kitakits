class RemoveAvavailybilityFromBooking < ActiveRecord::Migration[7.0]
  def change
    remove_column :bookings, :availability_id, :bigint
  end
end
