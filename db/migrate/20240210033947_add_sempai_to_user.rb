class AddSempaiToUser < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :sempai, :boolean, default: false
  end
end
