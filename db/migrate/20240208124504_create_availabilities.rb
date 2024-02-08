class CreateAvailabilities < ActiveRecord::Migration[7.0]
  def change
    create_table :availabilities do |t|
      t.date :date
      t.datetime :time_from
      t.datetime :time_to
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
