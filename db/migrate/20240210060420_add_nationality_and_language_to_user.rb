require 'active_record/migration'

class AddNationalityAndLanguageToUser < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :nationality, :string
    add_column :users, :language, :string
  end
end
