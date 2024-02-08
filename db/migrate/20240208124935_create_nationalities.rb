class CreateNationalities < ActiveRecord::Migration[7.0]
  def change
    create_table :nationalities do |t|
      t.string :nationality

      t.timestamps
    end
  end
end
