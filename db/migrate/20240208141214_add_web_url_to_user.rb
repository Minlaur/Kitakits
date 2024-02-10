class AddWebUrlToUser < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :web_url, :string
  end
end
