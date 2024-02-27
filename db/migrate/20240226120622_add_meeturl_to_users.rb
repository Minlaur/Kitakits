class AddMeeturlToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :meet_url, :string
  end
end
