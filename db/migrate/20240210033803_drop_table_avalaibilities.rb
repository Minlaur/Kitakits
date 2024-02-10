class DropTableAvalaibilities < ActiveRecord::Migration[7.0]
  def change
    drop_table :availabilities, if_exists: true
  end
end
